class PageLayoutsController < ApplicationController
  def index
    @page_layouts = PageLayout.all
  end

  def show
    @page_layout = PageLayout.find(params[:id])
  end

  def new
    @page=Page.new
    @page.controller_name=params[:controller_name]
    @page.action_name=params[:action_name]
    unless Page.first(:conditions => ['controller_name=? and action_name=?',params[:controller_name],params[:action_name]])
       @page.save
    end
    @page_layout = PageLayout.new
    @page_layout.page=@page
  end

  def create
    @page_layout = PageLayout.new(params[:page_layout])
    if @page_layout.save
      redirect_to edit_page_layout_path(@page_layout,:page_id=>@page_layout.page.id), :notice => "Successfully created page layout."
    else
      render :action => 'new'
    end
  end

  def edit
    @page=Page.find(params[:page_id])
    @page_layout = PageLayout.find(params[:id])
  end

  def update
    @page_layout = PageLayout.find(params[:id])
    @page_id=@page_layout.page.id

    if @page_layout.update_attributes(params[:page_layout])
      @layout_page_layout=PageLayout.find_by_page_id(3)
      @layout_page_layout.layout_theme_id=@page_layout.layout_theme_id
      @layout_page_layout.save!

      redirect_to edit_page_layout_path(:page_id=>@page_id,:path=>params[:path]), :notice => "Successfully changed page layout."
    else
      render :action => 'edit', :notice => "Unable to change page layout."
      #redirect_to params[:path]
    end
  end

  def destroy
    @page_layout = PageLayout.find(params[:id])
    @page_layout.destroy
    redirect_to page_layouts_url, :notice => "Successfully destroyed page layout."
  end

end
