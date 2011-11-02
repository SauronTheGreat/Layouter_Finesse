class MathematicalModelVariablesController < ApplicationController
  # GET /mathematical_model_variables
  # GET /mathematical_model_variables.json
  def index
    @mathematical_model_variables = MathematicalModelVariable.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mathematical_model_variables }
    end
  end

  # GET /mathematical_model_variables/1
  # GET /mathematical_model_variables/1.json
  def show
    @mathematical_model_variable = MathematicalModelVariable.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mathematical_model_variable }
    end
  end

  # GET /mathematical_model_variables/new
  # GET /mathematical_model_variables/new.json
  def new
   # @mathematical_model_variable = MathematicalModelVariable.new

     #we are using the multiple objects method since we will provide a form to enter names of all constants simultaneously
    @mathematical_model=MathematicalModel.find(params[:mathematical_model_id])
    @mathematical_model_variables=Array.new(@mathematical_model.number_of_variables) { MathematicalModelVariable.new }


    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mathematical_model_variable }
    end
  end

  # GET /mathematical_model_variables/1/edit
  def edit
    @mathematical_model_variable = MathematicalModelVariable.find(params[:id])
  end

  # POST /mathematical_model_variables
  # POST /mathematical_model_variables.json
  def create
   # @mathematical_model_variable = MathematicalModelVariable.new(params[:mathematical_model_variable])
     @mathematical_model_variables = params[:mathematical_model_variables].values.collect { |variable| MathematicalModelVariable.new(variable) }

     @mathematical_model_variables.each do |mmv|
       mmv.save!
     end

    respond_to do |format|

      #if @mathematical_model_variable.save
        if @mathematical_model_variables.all?(&:valid?)
          format.html {redirect_to root_path}
        #format.html { redirect_to @mathematical_model_variable, notice: 'Mathematical model variable was successfully created.' }
        format.json { render json: @mathematical_model_variable, status: :created, location: @mathematical_model_variable }
      else
        format.html { render action: "new" }
        format.json { render json: @mathematical_model_variable.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mathematical_model_variables/1
  # PUT /mathematical_model_variables/1.json
  def update
    @mathematical_model_variable = MathematicalModelVariable.find(params[:id])

    respond_to do |format|
      if @mathematical_model_variable.update_attributes(params[:mathematical_model_variable])
        format.html { redirect_to @mathematical_model_variable, notice: 'Mathematical model variable was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @mathematical_model_variable.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mathematical_model_variables/1
  # DELETE /mathematical_model_variables/1.json
  def destroy
    @mathematical_model_variable = MathematicalModelVariable.find(params[:id])
    @mathematical_model_variable.destroy

    respond_to do |format|
      format.html { redirect_to mathematical_model_variables_url }
      format.json { head :ok }
    end
  end
end
