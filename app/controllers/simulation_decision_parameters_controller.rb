class SimulationDecisionParametersController < ApplicationController
  # GET /simulation_decision_parameters
  # GET /simulation_decision_parameters.json
  def index
    @simulation_decision_parameters = SimulationDecisionParameter.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @simulation_decision_parameters }
    end
  end

  # GET /simulation_decision_parameters/1
  # GET /simulation_decision_parameters/1.json
  def show
    @simulation_decision_parameter = SimulationDecisionParameter.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @simulation_decision_parameter }
    end
  end

  # GET /simulation_decision_parameters/new
  # GET /simulation_decision_parameters/new.json
  def new
    @simulation=Simulation.find(params[:simulation_id])
    @simulation_decision_parameters=Array.new(DecisionParameter.all.count) { SimulationDecisionParameter.new }
    @decision_parameters=DecisionParameter.all

    @simulation_parameters_ids=Array.new
    @present_parameters=SimulationDecisionParameter.find_all_by_simulation_id(@simulation.id)
    @present_parameters.each do |simulation_parameter|
      @simulation_parameters_ids << simulation_parameter.decision_parameter_id

    end


    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @simulation_decision_parameter }
    end
  end

  # GET /simulation_decision_parameters/1/edit
  def edit
    @simulation_decision_parameter = SimulationDecisionParameter.find(params[:id])
  end

  # POST /simulation_decision_parameters
  # POST /simulation_decision_parameters.json
  def create

    @simulation_decision_parameters = params[:simulation_decision_parameters].values.collect { |sdp| SimulationDecisionParameter.new(sdp) }
    @decision_parameters=DecisionParameter.all

    @simulation=Simulation.find(@simulation_decision_parameters[0].simulation_id)
     SimulationDecisionParameter.destroy @simulation.simulation_decision_parameters(&:id)


    @simulation_decision_parameters.each_with_index do |sdp, index|
      if sdp.decision_parameter_id!=0
        sdp.decision_parameter_id=@decision_parameters[index].id
        sdp.save!
      end
    end


    #@simulation_decision_parameter = SimulationDecisionParameter.new(params[:simulation_decision_parameter])

    respond_to do |format|
      if @simulation_decision_parameters.all?(&:valid?)
        format.html { redirect_to simulation_path(Simulation.find(@simulation_decision_parameters[0].simulation_id)) }
        #format.html { redirect_to @simulation_decision_parameter, notice: 'Simulation decision parameter was successfully created.' }
        format.json { render json: @simulation_decision_parameter, status: :created, location: @simulation_decision_parameter }
      else
        format.html { render action: "new" }
        format.json { render json: @simulation_decision_parameter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /simulation_decision_parameters/1
  # PUT /simulation_decision_parameters/1.json
  def update
    @simulation_decision_parameter = SimulationDecisionParameter.find(params[:id])

    respond_to do |format|
      if @simulation_decision_parameter.update_attributes(params[:simulation_decision_parameter])
        format.html { redirect_to @simulation_decision_parameter, notice: 'Simulation decision parameter was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @simulation_decision_parameter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /simulation_decision_parameters/1
  # DELETE /simulation_decision_parameters/1.json
  def destroy
    @simulation_decision_parameter = SimulationDecisionParameter.find(params[:id])
    @simulation_decision_parameter.destroy

    respond_to do |format|
      format.html { redirect_to simulation_decision_parameters_url }
      format.json { head :ok }
    end
  end
end
