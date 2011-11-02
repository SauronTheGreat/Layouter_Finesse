class FontThemesController < ApplicationController
  # GET /font_themes
  # GET /font_themes.json
  def index
    @font_themes = FontTheme.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @font_themes }
    end
  end

  # GET /font_themes/1
  # GET /font_themes/1.json
  def show
    @font_theme = FontTheme.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @font_theme }
    end
  end

  # GET /font_themes/new
  # GET /font_themes/new.json
  def new
    @font_theme = FontTheme.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @font_theme }
    end
  end

  # GET /font_themes/1/edit
  def edit
    @font_theme = FontTheme.find(params[:id])
  end

  # POST /font_themes
  # POST /font_themes.json
  def create
    @font_theme = FontTheme.new(params[:font_theme])

    respond_to do |format|
      if @font_theme.save
        format.html { redirect_to @font_theme, :notice => 'Font theme was successfully created.' }
        format.json { render :json => @font_theme, :status => :created, :location => @font_theme }
      else
        format.html { render :action => "new" }
        format.json { render :json => @font_theme.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /font_themes/1
  # PUT /font_themes/1.json
  def update
    @font_theme = FontTheme.find(params[:id])

    respond_to do |format|
      if @font_theme.update_attributes(params[:font_theme])
        format.html { redirect_to @font_theme, :notice => 'Font theme was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @font_theme.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /font_themes/1
  # DELETE /font_themes/1.json
  def destroy
    @font_theme = FontTheme.find(params[:id])
    @font_theme.destroy

    respond_to do |format|
      format.html { redirect_to font_themes_url }
      format.json { head :ok }
    end
  end
end
