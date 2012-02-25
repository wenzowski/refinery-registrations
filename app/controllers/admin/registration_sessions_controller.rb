module Admin
  class RegistrationSessionsController < Admin::BaseController

    crudify :registration_session, :xhr_paging => true

  end
end
