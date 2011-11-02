class MathematicalModelInputsController < ApplicationController
  # GET /mathematical_model_inputs
  # GET /mathematical_model_inputs.json
  def index
    @mathematical_model_inputs = MathematicalModelInput.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mathematical_model_inputs }
    end
  end

  # GET /mathematical_model_inputs/1
  # GET /mathematical_model_inputs/1.json
  def show
    @mathematical_model_input = MathematicalModelInput.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mathematical_model_input }
    end
  end

  # GET /mathematical_model_inputs/new
  # GET /mathematical_model_inputs/new.json
  def new
    @mathematical_model_input = MathematicalModelInput.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mathematical_model_input }
    end
  end

  # GET /mathematical_model_inputs/1/edit
  def edit
    @mathematical_model_input = MathematicalModelInput.find(params[:id])
  end

  # POST /mathematical_model_inputs
  # POST /mathematical_model_inputs.json
  def create
    @mathematical_model_input = MathematicalModelInput.new(params[:mathematical_model_input])

    respond_to do |format|
      if @mathematical_model_input.save
        format.html { redirect_to @mathematical_model_input, notice: 'Mathematical model input was successfully created.' }
        format.json { render json: @mathematical_model_input, status: :created, location: @mathematical_model_input }
      else
        format.html { render action: "new" }
        format.json { render json: @mathematical_model_input.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mathematical_model_inputs/1
  # PUT /mathematical_model_inputs/1.json
  def update
    @mathematical_model_input = MathematicalModelInput.find(params[:id])

    respond_to do |format|
      if @mathematical_model_input.update_attributes(params[:mathematical_model_input])
        format.html { redirect_to @mathematical_model_input, notice: 'Mathematical model input was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @mathematical_model_input.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mathematical_model_inputs/1
  # DELETE /mathematical_model_inputs/1.json
  def destroy
    @mathematical_model_input = MathematicalModelInput.find(params[:id])
    @mathematical_model_input.destroy

    respond_to do |format|
      format.html { redirect_to mathematical_model_inputs_url }
      format.json { head :ok }
    end
  end
end
