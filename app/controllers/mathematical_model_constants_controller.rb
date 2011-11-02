class MathematicalModelConstantsController < ApplicationController
  # GET /mathematical_model_constants
  # GET /mathematical_model_constants.json
  def index
    @mathematical_model_constants = MathematicalModelConstant.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mathematical_model_constants }
    end
  end

  # GET /mathematical_model_constants/1
  # GET /mathematical_model_constants/1.json
  def show
    @mathematical_model_constant = MathematicalModelConstant.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mathematical_model_constant }
    end
  end

  # GET /mathematical_model_constants/new
  # GET /mathematical_model_constants/new.json
  def new
    #we are using the multiple objects method since we will provide a form to enter names of all constants simultaneously
    @mathematical_model=MathematicalModel.find(params[:mathematical_model_id])
    @mathematical_model_constants=Array.new(@mathematical_model.number_of_constants) { MathematicalModelConstant.new }

    #@mathematical_model_constant = MathematicalModelConstant.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mathematical_model_constant }
    end
  end

  # GET /mathematical_model_constants/1/edit
  def edit
    @mathematical_model_constant = MathematicalModelConstant.find(params[:id])
  end

  # POST /mathematical_model_constants
  # POST /mathematical_model_constants.json
  def create
    #here we get collection of object rather than a single object
    @mathematical_model_constants = params[:mathematical_model_constants].values.collect { |constant| MathematicalModelConstant.new(constant) }

    @mathematical_model_constants.each do |mmc|
      mmc.save!
    end

    #@mathematical_model_constant = MathematicalModelConstant.new(params[:mathematical_model_constant])

    respond_to do |format|
      if @mathematical_model_constants.all?(&:valid?)
     # if @mathematical_model_constant.save
        # now we go and take variable names
        format.html{ redirect_to new_mathematical_model_variable_path(:mathematical_model_id=>@mathematical_model_constants[0].mathematical_model_id)}
      #  format.html { redirect_to @mathematical_model_constant, notice: 'Mathematical model constant was successfully created.' }
        format.json { render json: @mathematical_model_constant, status: :created, location: @mathematical_model_constant }
      else
        format.html { render action: "new" }
        format.json { render json: @mathematical_model_constant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mathematical_model_constants/1
  # PUT /mathematical_model_constants/1.json
  def update
    @mathematical_model_constant = MathematicalModelConstant.find(params[:id])

    respond_to do |format|
      if @mathematical_model_constant.update_attributes(params[:mathematical_model_constant])
        format.html { redirect_to @mathematical_model_constant, notice: 'Mathematical model constant was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @mathematical_model_constant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mathematical_model_constants/1
  # DELETE /mathematical_model_constants/1.json
  def destroy
    @mathematical_model_constant = MathematicalModelConstant.find(params[:id])
    @mathematical_model_constant.destroy

    respond_to do |format|
      format.html { redirect_to mathematical_model_constants_url }
      format.json { head :ok }
    end
  end
end
