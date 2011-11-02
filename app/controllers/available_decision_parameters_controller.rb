class AvailableDecisionParametersController < ApplicationController
  # GET /available_decision_parameters
  # GET /available_decision_parameters.json
  def index
    @available_decision_parameters = AvailableDecisionParameter.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @available_decision_parameters }
    end
  end

  # GET /available_decision_parameters/1
  # GET /available_decision_parameters/1.json
  def show
    @available_decision_parameter = AvailableDecisionParameter.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @available_decision_parameter }
    end
  end

  # GET /available_decision_parameters/new
  # GET /available_decision_parameters/new.json
  def new
    @available_decision_parameter = AvailableDecisionParameter.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @available_decision_parameter }
    end
  end

  # GET /available_decision_parameters/1/edit
  def edit
    @available_decision_parameter = AvailableDecisionParameter.find(params[:id])
  end

  # POST /available_decision_parameters
  # POST /available_decision_parameters.json
  def create
    @available_decision_parameter = AvailableDecisionParameter.new(params[:available_decision_parameter])

    respond_to do |format|
      if @available_decision_parameter.save
        format.html { redirect_to @available_decision_parameter, notice: 'Available decision parameter was successfully created.' }
        format.json { render json: @available_decision_parameter, status: :created, location: @available_decision_parameter }
      else
        format.html { render action: "new" }
        format.json { render json: @available_decision_parameter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /available_decision_parameters/1
  # PUT /available_decision_parameters/1.json
  def update
    @available_decision_parameter = AvailableDecisionParameter.find(params[:id])

    respond_to do |format|
      if @available_decision_parameter.update_attributes(params[:available_decision_parameter])
        format.html { redirect_to @available_decision_parameter, notice: 'Available decision parameter was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @available_decision_parameter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /available_decision_parameters/1
  # DELETE /available_decision_parameters/1.json
  def destroy
    @available_decision_parameter = AvailableDecisionParameter.find(params[:id])
    @available_decision_parameter.destroy

    respond_to do |format|
      format.html { redirect_to available_decision_parameters_url }
      format.json { head :ok }
    end
  end
end
