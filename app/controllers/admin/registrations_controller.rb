module Admin
  class RegistrationsController < Admin::BaseController

    crudify :registration, :xhr_paging => true

  end
end
