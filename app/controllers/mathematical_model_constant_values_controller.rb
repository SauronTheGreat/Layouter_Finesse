class MathematicalModelConstantValuesController < ApplicationController
  # GET /mathematical_model_constant_values
  # GET /mathematical_model_constant_values.json
  def index
    @mathematical_model_constant_values = MathematicalModelConstantValue.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mathematical_model_constant_values }
    end
  end

  # GET /mathematical_model_constant_values/1
  # GET /mathematical_model_constant_values/1.json
  def show
    @mathematical_model_constant_value = MathematicalModelConstantValue.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mathematical_model_constant_value }
    end
  end

  # GET /mathematical_model_constant_values/new
  # GET /mathematical_model_constant_values/new.json
  def new
    @mathematical_model_constant_value = MathematicalModelConstantValue.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mathematical_model_constant_value }
    end
  end

  # GET /mathematical_model_constant_values/1/edit
  def edit
    @mathematical_model_constant_value = MathematicalModelConstantValue.find(params[:id])
  end

  # POST /mathematical_model_constant_values
  # POST /mathematical_model_constant_values.json
  def create
    @mathematical_model_constant_value = MathematicalModelConstantValue.new(params[:mathematical_model_constant_value])

    respond_to do |format|
      if @mathematical_model_constant_value.save
        format.html { redirect_to @mathematical_model_constant_value, notice: 'Mathematical model constant value was successfully created.' }
        format.json { render json: @mathematical_model_constant_value, status: :created, location: @mathematical_model_constant_value }
      else
        format.html { render action: "new" }
        format.json { render json: @mathematical_model_constant_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mathematical_model_constant_values/1
  # PUT /mathematical_model_constant_values/1.json
  def update
    @mathematical_model_constant_value = MathematicalModelConstantValue.find(params[:id])

    respond_to do |format|
      if @mathematical_model_constant_value.update_attributes(params[:mathematical_model_constant_value])
        format.html { redirect_to @mathematical_model_constant_value, notice: 'Mathematical model constant value was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @mathematical_model_constant_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mathematical_model_constant_values/1
  # DELETE /mathematical_model_constant_values/1.json
  def destroy
    @mathematical_model_constant_value = MathematicalModelConstantValue.find(params[:id])
    @mathematical_model_constant_value.destroy

    respond_to do |format|
      format.html { redirect_to mathematical_model_constant_values_url }
      format.json { head :ok }
    end
  end
end
