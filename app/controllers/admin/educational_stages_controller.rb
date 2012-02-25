module Admin
  class EducationalStagesController < Admin::BaseController

    crudify :educational_stage,
            :title_attribute => 'name', :xhr_paging => true

  end
end
