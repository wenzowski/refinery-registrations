class RegistrationsController < ApplicationController

  before_filter :find_page, :prepare_registration, only: [:index, :edit, :update]

  def thank_you
    @page = Page.find_by_link_url("/registrations/thank_you", include: [:parts, :slugs])
  end

  def terms_of_agreement
    @page = Page.find_by_link_url("/registrations/terms_of_agreement", include: [:parts, :slugs])
  end

  def index
    store_location if defined?(user_signed_in?) && !user_signed_in?
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @registration in the line below:
    present(@page)
  end

  def show
    present(@registration)
  end

  def edit
    store_location if defined?(user_signed_in?) && !user_signed_in?
    # TODO: add "accept terms" flash message if terms not accepted
    # TODO: add "pay with paypal" flash message if terms accepted
    present(@registration)
  end

  def update
    if params[:commit] == "I agree"
      @registration.terms_accepted = Time.now
      @registration.save #TODO handle save failure
    end
    render action: 'edit'
  end

protected

  def find_page
    @page = Page.where(:link_url => "/registrations").first
    @terms = Page.where(:link_url => "/camp-terms").first
  end

  def prepare_registration
    @registration = current_registration
    if defined?(user_signed_in?) && user_signed_in?
      @registration.parent_id = current_user.id
      clear_stored_location
    end
    @registration.registration_session = RegistrationSession.open.first if RegistrationSession.open?
    @registration.save if !@registration.child_registrations.empty? && @registration.changed?
    session[:registration_id] = @registration.id
  end

  def store_location
    session[:user_return_to] = request.fullpath
  end

  def clear_stored_location
    session[:user_return_to] = nil
  end

end
