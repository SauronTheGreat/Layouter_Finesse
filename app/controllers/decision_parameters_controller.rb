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
        # now the model  is decided so we proceed to give values to constants used in this model
        format.html { redirect_to define_constant_value_path(:decision_parameter_id=>@decision_parameter.id) }
        #format.html { redirect_to @decision_parameter, notice: 'Decision parameter was successfully updated.' }
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

  #we are defining this method to set the values of the constant associated with the mathematical model for this decision parameter
  def define_constant_value
    @decision_parameter=DecisionParameter.find(params[:decision_parameter_id])
    @mathematical_model=MathematicalModel.find(@decision_parameter.mathematical_model_id)
    @constants=@mathematical_model.mathematical_model_constants
    @constants_values=Array.new(@constants.count) { MathematicalModelConstantValue.new }


  end

  #we use this method to set the values in the DB which come from the form
  def set_constant_value
    @constants_values = params[:constants_values].values.collect { |constant_value| MathematicalModelConstantValue.new(constant_value) }

    @constants_values.each do |constant_value|
      constant_value.save!

    end
    redirect_to define_variable_values_path(:decision_parameter_id=>@constants_values[0].decision_parameter_id)


  end

  #here we present a form to let user(admin) define the variables used in the equations
  def define_variable_values

    @decision_parameter=DecisionParameter.find(params[:decision_parameter_id])
    @mathematical_model=MathematicalModel.find(@decision_parameter.mathematical_model_id)
    @variables=@mathematical_model.mathematical_model_variables
    @variables_values=Array.new(@variables.count) { MathematicalModelVariableValue.new }

  end

  #we use this method to set the values in the DB which come from the form
  def set_variable_values

    @variables_values = params[:variables_values].values.collect { |variable_value| MathematicalModelVariableValue.new(variable_value) }
    @variables_values.each do |variable_value|
      variable_value.save!

    end
    redirect_to root_path
  end

  #this method allows us to show all details of a decision parameter
  def view_details
    @decision_parameter=DecisionParameter.find(params[:decision_parameter_id])
    @mathematical_model=MathematicalModel.find(@decision_parameter.mathematical_model_id)
    @constants=@mathematical_model.mathematical_model_constants
    @variables=@mathematical_model.mathematical_model_variables





  end


end
