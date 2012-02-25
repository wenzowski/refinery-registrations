class EducationalStagesController < ApplicationController

  before_filter :find_all_educational_stages
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @educational_stage in the line below:
    present(@page)
  end

  def show
    @educational_stage = EducationalStage.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @educational_stage in the line below:
    present(@page)
  end

protected

  def find_all_educational_stages
    @educational_stages = EducationalStage.order('position ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/educational_stages").first
  end

end
