class ChildrenController < ApplicationController

  before_filter :find_all_children
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @child in the line below:
    present(@page)
  end

  def show
    @child = Child.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @child in the line below:
    present(@page)
  end

  def new
    @child = Child.new
  end

  def create
    @child = Child.new(params[:child_registration])
    if @child.save
      redirect_to @child
    else
      render action: 'index'
    end
  end

protected

  def find_all_children
    @children = Child.order('position ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/children").first
  end

end
