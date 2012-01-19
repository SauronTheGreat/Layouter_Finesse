class LayoutThemesController < ApplicationController
  def index
    @layout_themes = LayoutTheme.all
  end

  def show
    @layout_theme = LayoutTheme.find(params[:id])
  end

  def new
    @layout_theme = LayoutTheme.new
  end

  def create
    @layout_theme = LayoutTheme.new(params[:layout_theme])
    if @layout_theme.save
      redirect_to @layout_theme, :notice => "Successfully created layout theme."
    else
      render :action => 'new'
    end
  end

  def edit
    @layout_theme = LayoutTheme.find(params[:id])
  end

  def update
    @layout_theme = LayoutTheme.find(params[:id])
    if @layout_theme.update_attributes(params[:layout_theme])
      redirect_to @layout_theme, :notice  => "Successfully updated layout theme."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @layout_theme = LayoutTheme.find(params[:id])
    @layout_theme.destroy
    redirect_to layout_themes_url, :notice => "Successfully destroyed layout theme."
  end
end
