class ChildRegistrationsController < ApplicationController

  before_filter :find_page, :prepare_registration

  # def new
  #   @child_registration = ChildRegistration.new
  #   @educational_stages = EducationalStage.all
  # end

  def create
    @child_registration = ChildRegistration.new(params[:child_registration])
    @child_registration.registration = @registration
    redirect_to @page if @child_registration.save
  end

  def destroy
    @child_registration = ChildRegistration.find(params[:id])
    redirect_to @page if @child_registration.destroy
  end

protected

  def find_page
    @page = Page.where(:link_url => "/registrations").first
  end

  def prepare_registration
    @registration = current_registration
    @registration.parent_id = current_user.id if defined?(user_signed_in?) && user_signed_in?
    @registration.registration_session = RegistrationSession.open.first if RegistrationSession.open?
    @registration.save if @registration.changed?
    session[:registration_id] = @registration.id
  end

end
