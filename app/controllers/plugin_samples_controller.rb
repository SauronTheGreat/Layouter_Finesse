class PluginSamplesController < ApplicationController
  # GET /plugin_samples
  # GET /plugin_samples.json
  def index
    @plugin_samples = PluginSample.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @plugin_samples }
    end
  end

  # GET /plugin_samples/1
  # GET /plugin_samples/1.json
  def show
    @plugin_sample = PluginSample.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @plugin_sample }
    end
  end

  # GET /plugin_samples/new
  # GET /plugin_samples/new.json
  def new
    @plugin_sample = PluginSample.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @plugin_sample }
    end
  end

  # GET /plugin_samples/1/edit
  def edit
    @plugin_sample = PluginSample.find(params[:id])
  end

  # POST /plugin_samples
  # POST /plugin_samples.json
  def create
    @plugin_sample = PluginSample.new(params[:plugin_sample])

    respond_to do |format|
      if @plugin_sample.save
        format.html { redirect_to @plugin_sample, :notice => 'Plugin sample was successfully created.' }
        format.json { render :json => @plugin_sample, :status => :created, :location => @plugin_sample }
      else
        format.html { render :action => "new" }
        format.json { render :json => @plugin_sample.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /plugin_samples/1
  # PUT /plugin_samples/1.json
  def update
    @plugin_sample = PluginSample.find(params[:id])

    respond_to do |format|
      if @plugin_sample.update_attributes(params[:plugin_sample])
        format.html { redirect_to @plugin_sample, :notice => 'Plugin sample was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @plugin_sample.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /plugin_samples/1
  # DELETE /plugin_samples/1.json
  def destroy
    @plugin_sample = PluginSample.find(params[:id])
    @plugin_sample.destroy

    respond_to do |format|
      format.html { redirect_to plugin_samples_url }
      format.json { head :ok }
    end
  end
end
