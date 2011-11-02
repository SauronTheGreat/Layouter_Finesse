class IconThemesController < ApplicationController
  # GET /icon_themes
  # GET /icon_themes.json
  def index
    @icon_themes = IconTheme.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @icon_themes }
    end
  end

  # GET /icon_themes/1
  # GET /icon_themes/1.json
  def show
    @icon_theme = IconTheme.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @icon_theme }
    end
  end

  # GET /icon_themes/new
  # GET /icon_themes/new.json
  def new
    @icon_theme = IconTheme.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @icon_theme }
    end
  end

  # GET /icon_themes/1/edit
  def edit
    @icon_theme = IconTheme.find(params[:id])
  end

  # POST /icon_themes
  # POST /icon_themes.json
  def create
    @icon_theme = IconTheme.new(params[:icon_theme])

    respond_to do |format|
      if @icon_theme.save
        format.html { redirect_to @icon_theme, :notice => 'Icon theme was successfully created.' }
        format.json { render :json => @icon_theme, :status => :created, :location => @icon_theme }
      else
        format.html { render :action => "new" }
        format.json { render :json => @icon_theme.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /icon_themes/1
  # PUT /icon_themes/1.json
  def update
    @icon_theme = IconTheme.find(params[:id])

    respond_to do |format|
      if @icon_theme.update_attributes(params[:icon_theme])
        format.html { redirect_to @icon_theme, :notice => 'Icon theme was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @icon_theme.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /icon_themes/1
  # DELETE /icon_themes/1.json
  def destroy
    @icon_theme = IconTheme.find(params[:id])
    @icon_theme.destroy

    respond_to do |format|
      format.html { redirect_to icon_themes_url }
      format.json { head :ok }
    end
  end
end
