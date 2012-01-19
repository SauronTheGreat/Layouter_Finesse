class JqueryThemesController < ApplicationController
  # GET /jquery_themes
  # GET /jquery_themes.json
  def index
    @jquery_themes = JqueryTheme.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @jquery_themes }
    end
  end

  # GET /jquery_themes/1
  # GET /jquery_themes/1.json
  def show
    @jquery_theme = JqueryTheme.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @jquery_theme }
    end
  end

  # GET /jquery_themes/new
  # GET /jquery_themes/new.json
  def new
    @jquery_theme = JqueryTheme.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @jquery_theme }
    end
  end

  # GET /jquery_themes/1/edit
  def edit
    @jquery_theme = JqueryTheme.find(params[:id])
  end

  # POST /jquery_themes
  # POST /jquery_themes.json
  def create
    @jquery_theme = JqueryTheme.new(params[:jquery_theme])

    respond_to do |format|
      if @jquery_theme.save
        format.html { redirect_to @jquery_theme, :notice => 'Jquery theme was successfully created.' }
        format.json { render :json => @jquery_theme, :status => :created, :location => @jquery_theme }
      else
        format.html { render :action => "new" }
        format.json { render :json => @jquery_theme.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /jquery_themes/1
  # PUT /jquery_themes/1.json
  def update
    @jquery_theme = JqueryTheme.find(params[:id])

    respond_to do |format|
      if @jquery_theme.update_attributes(params[:jquery_theme])
        format.html { redirect_to @jquery_theme, :notice => 'Jquery theme was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @jquery_theme.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /jquery_themes/1
  # DELETE /jquery_themes/1.json
  def destroy
    @jquery_theme = JqueryTheme.find(params[:id])
    @jquery_theme.destroy

    respond_to do |format|
      format.html { redirect_to jquery_themes_url }
      format.json { head :ok }
    end
  end
end
