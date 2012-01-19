class RoundEnvironmentalParametersController < ApplicationController
  # GET /round_environmental_parameters
  # GET /round_environmental_parameters.json
  def index
    @round_environmental_parameters = RoundEnvironmentalParameter.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @round_environmental_parameters }
    end
  end

  # GET /round_environmental_parameters/1
  # GET /round_environmental_parameters/1.json
  def show
    @round_environmental_parameter = RoundEnvironmentalParameter.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @round_environmental_parameter }
    end
  end

  # GET /round_environmental_parameters/new
  # GET /round_environmental_parameters/new.json
  def new
    @round=Round.find(params[:round_id])
    @round_environmental_parameter = RoundEnvironmentalParameter.new

    @included_parameters=@round.round_environmental_parameters
    @included_parameters_ids=Array.new
    @included_parameters.each do |parameter|
      @included_parameters_ids << parameter.environmental_parameter_id
    end

    @environmental_parameter_list=EnvironmentalParameter.all.collect{|parameter| if @included_parameters_ids.include?(parameter.id)==false then [parameter.name,parameter.id] end}.compact


    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @round_environmental_parameter }
    end
  end

  # GET /round_environmental_parameters/1/edit
  def edit
    @round_environmental_parameter = RoundEnvironmentalParameter.find(params[:id])
  end

  # POST /round_environmental_parameters
  # POST /round_environmental_parameters.json
  def create
    @round_environmental_parameter = RoundEnvironmentalParameter.new(params[:round_environmental_parameter])

    respond_to do |format|
      if @round_environmental_parameter.save
        format.html {redirect_to new_round_environmental_parameter_path(:round_id=>@round_environmental_parameter.round_id)}
       # format.html { redirect_to @round_environmental_parameter, notice: 'Round environmental parameter was successfully created.' }
        format.json { render json: @round_environmental_parameter, status: :created, location: @round_environmental_parameter }
      else
        format.html { render action: "new" }
        format.json { render json: @round_environmental_parameter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /round_environmental_parameters/1
  # PUT /round_environmental_parameters/1.json
  def update
    @round_environmental_parameter = RoundEnvironmentalParameter.find(params[:id])

    respond_to do |format|
      if @round_environmental_parameter.update_attributes(params[:round_environmental_parameter])
        format.html { redirect_to @round_environmental_parameter, notice: 'Round environmental parameter was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @round_environmental_parameter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /round_environmental_parameters/1
  # DELETE /round_environmental_parameters/1.json
  def destroy
    @round_environmental_parameter = RoundEnvironmentalParameter.find(params[:id])
    @round_environmental_parameter.destroy

    respond_to do |format|
      format.html { redirect_to round_environmental_parameters_url }
      format.json { head :ok }
    end
  end
end
