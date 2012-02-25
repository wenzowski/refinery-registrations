module Admin
  class ChildRegistrationsController < Admin::BaseController

    crudify :child_registration, :xhr_paging => true

  end
end
