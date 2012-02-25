module Admin
  class ChildrenController < Admin::BaseController

    crudify :child,
            :title_attribute => 'name', :xhr_paging => true

  end
end
