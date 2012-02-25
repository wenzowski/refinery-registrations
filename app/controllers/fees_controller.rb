class FeesController < ApplicationController

  before_filter :find_all_fees
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @fee in the line below:
    present(@page)
  end

  def show
    @fee = Fee.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @fee in the line below:
    present(@page)
  end

protected

  def find_all_fees
    @fees = Fee.order('position ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/fees").first
  end

end
