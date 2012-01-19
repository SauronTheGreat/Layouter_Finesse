class EnvironmentalParametersController < ApplicationController
  # GET /environmental_parameters
  # GET /environmental_parameters.json
  def index
    @environmental_parameters = EnvironmentalParameter.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @environmental_parameters }
    end
  end

  # GET /environmental_parameters/1
  # GET /environmental_parameters/1.json
  def show
    @environmental_parameter = EnvironmentalParameter.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @environmental_parameter }
    end
  end

  # GET /environmental_parameters/new
  # GET /environmental_parameters/new.json
  def new
    @environmental_parameter = EnvironmentalParameter.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @environmental_parameter }
    end
  end

  # GET /environmental_parameters/1/edit
  def edit
    @environmental_parameter = EnvironmentalParameter.find(params[:id])
  end

  # POST /environmental_parameters
  # POST /environmental_parameters.json
  def create
    @environmental_parameter = EnvironmentalParameter.new(params[:environmental_parameter])

    respond_to do |format|
      if @environmental_parameter.save
        format.html { redirect_to @environmental_parameter, notice: 'Environmental parameter was successfully created.' }
        format.json { render json: @environmental_parameter, status: :created, location: @environmental_parameter }
      else
        format.html { render action: "new" }
        format.json { render json: @environmental_parameter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /environmental_parameters/1
  # PUT /environmental_parameters/1.json
  def update
    @environmental_parameter = EnvironmentalParameter.find(params[:id])

    respond_to do |format|
      if @environmental_parameter.update_attributes(params[:environmental_parameter])
        format.html { redirect_to @environmental_parameter, notice: 'Environmental parameter was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @environmental_parameter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /environmental_parameters/1
  # DELETE /environmental_parameters/1.json
  def destroy
    @environmental_parameter = EnvironmentalParameter.find(params[:id])
    @environmental_parameter.destroy

    respond_to do |format|
      format.html { redirect_to environmental_parameters_url }
      format.json { head :ok }
    end
  end
end
