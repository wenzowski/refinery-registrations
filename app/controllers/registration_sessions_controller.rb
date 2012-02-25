class RegistrationSessionsController < ApplicationController

  before_filter :find_all_registration_sessions
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @registration_session in the line below:
    present(@page)
  end

  def show
    @registration_session = RegistrationSession.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @registration_session in the line below:
    present(@page)
  end

protected

  def find_all_registration_sessions
    @registration_sessions = RegistrationSession.order('position ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/registration_sessions").first
  end

end
