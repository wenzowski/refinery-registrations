module Admin
  class FeesController < Admin::BaseController

    crudify :fee,
            :title_attribute => 'currency', :xhr_paging => true

  end
end
