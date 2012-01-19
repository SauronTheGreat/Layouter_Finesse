class MathematicalModelsController < ApplicationController
  # GET /mathematical_models
  # GET /mathematical_models.json
  def index
    @mathematical_models = MathematicalModel.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mathematical_models }
    end
  end

  # GET /mathematical_models/1
  # GET /mathematical_models/1.json
  def show
    @mathematical_model = MathematicalModel.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mathematical_model }
    end
  end

  # GET /mathematical_models/new
  # GET /mathematical_models/new.json
  def new
    @mathematical_model = MathematicalModel.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mathematical_model }
    end
  end

  # GET /mathematical_models/1/edit
  def edit
    @mathematical_model = MathematicalModel.find(params[:id])
  end

  # POST /mathematical_models
  # POST /mathematical_models.json
  def create
    @mathematical_model = MathematicalModel.new(params[:mathematical_model])

    respond_to do |format|
      if @mathematical_model.save
        format.html { redirect_to @mathematical_model, notice: 'Mathematical model was successfully created.' }
        format.json { render json: @mathematical_model, status: :created, location: @mathematical_model }
      else
        format.html { render action: "new" }
        format.json { render json: @mathematical_model.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mathematical_models/1
  # PUT /mathematical_models/1.json
  def update
    @mathematical_model = MathematicalModel.find(params[:id])

    respond_to do |format|
      if @mathematical_model.update_attributes(params[:mathematical_model])
        format.html { redirect_to @mathematical_model, notice: 'Mathematical model was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @mathematical_model.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mathematical_models/1
  # DELETE /mathematical_models/1.json
  def destroy
    @mathematical_model = MathematicalModel.find(params[:id])
    @mathematical_model.destroy

    respond_to do |format|
      format.html { redirect_to mathematical_models_url }
      format.json { head :ok }
    end
  end
end
