class ColorThemesController < ApplicationController

  layout 'application', :except => [:jquery_sample, :icon_sample]

  def index
    @color_themes = ColorTheme.all
  end

  def show
    @color_theme = ColorTheme.find(params[:id])
  end

  def new
    @color_theme = ColorTheme.new
  end

  def create
    @color_theme = ColorTheme.new(params[:color_theme])
    if @color_theme.save
      redirect_to :action=>'edit', :notice => "Successfully created color theme."
    else
      render :action => 'new'
    end
  end

  def edit
    @color_theme = ColorTheme.find(params[:id])
  end

  def update
    @color_theme = ColorTheme.find(params[:id])
    if @color_theme.update_attributes(params[:color_theme])
      redirect_to :action => 'edit', :notice => "Successfully updated color theme."
    end
  end

  def destroy
    @color_theme = ColorTheme.find(params[:id])
    @color_theme.destroy
    redirect_to color_themes_url, :notice => "Successfully destroyed color theme."
  end

  def jquery_sample
    @theme_number=params[:theme]
  end

  def icon_sample
    @icon_theme=params[:theme]
  end

end
