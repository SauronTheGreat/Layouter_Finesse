class DecisionParametersController < ApplicationController
  # GET /decision_parameters
  # GET /decision_parameters.json
  def index
    @decision_parameters = DecisionParameter.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @decision_parameters }
    end
  end

  # GET /decision_parameters/1
  # GET /decision_parameters/1.json
  def show
    @decision_parameter = DecisionParameter.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @decision_parameter }
    end
  end

  # GET /decision_parameters/new
  # GET /decision_parameters/new.json
  def new
    @decision_parameter = DecisionParameter.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @decision_parameter }
    end
  end

  # GET /decision_parameters/1/edit
  def edit
    @decision_parameter = DecisionParameter.find(params[:id])
  end

  # POST /decision_parameters
  # POST /decision_parameters.json
  def create
    @decision_parameter = DecisionParameter.new(params[:decision_parameter])

    respond_to do |format|
      if @decision_parameter.save
        format.html { redirect_to @decision_parameter, notice: 'Decision parameter was successfully created.' }
        format.json { render json: @decision_parameter, status: :created, location: @decision_parameter }
      else
        format.html { render action: "new" }
        format.json { render json: @decision_parameter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /decision_parameters/1
  # PUT /decision_parameters/1.json
  def update
    @decision_parameter = DecisionParameter.find(params[:id])

    respond_to do |format|
      if @decision_parameter.update_attributes(params[:decision_parameter])
        format.html { redirect_to @decision_parameter, notice: 'Decision parameter was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @decision_parameter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /decision_parameters/1
  # DELETE /decision_parameters/1.json
  def destroy
    @decision_parameter = DecisionParameter.find(params[:id])
    @decision_parameter.destroy

    respond_to do |format|
      format.html { redirect_to decision_parameters_url }
      format.json { head :ok }
    end
  end
end
