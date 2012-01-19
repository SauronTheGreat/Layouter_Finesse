class ConsumerBrandSelectionParametersController < ApplicationController
  # GET /consumer_brand_selection_parameters
  # GET /consumer_brand_selection_parameters.json
  def index
    @consumer_brand_selection_parameters = ConsumerBrandSelectionParameter.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @consumer_brand_selection_parameters }
    end
  end

  # GET /consumer_brand_selection_parameters/1
  # GET /consumer_brand_selection_parameters/1.json
  def show
    @consumer_brand_selection_parameter = ConsumerBrandSelectionParameter.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @consumer_brand_selection_parameter }
    end
  end

  # GET /consumer_brand_selection_parameters/new
  # GET /consumer_brand_selection_parameters/new.json
  def new
    @consumer_brand_selection_parameter = ConsumerBrandSelectionParameter.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @consumer_brand_selection_parameter }
    end
  end

  # GET /consumer_brand_selection_parameters/1/edit
  def edit
    @consumer_brand_selection_parameter = ConsumerBrandSelectionParameter.find(params[:id])
  end

  # POST /consumer_brand_selection_parameters
  # POST /consumer_brand_selection_parameters.json
  def create
    @consumer_brand_selection_parameter = ConsumerBrandSelectionParameter.new(params[:consumer_brand_selection_parameter])

    respond_to do |format|
      if @consumer_brand_selection_parameter.save
        format.html { redirect_to @consumer_brand_selection_parameter, notice: 'Consumer brand selection parameter was successfully created.' }
        format.json { render json: @consumer_brand_selection_parameter, status: :created, location: @consumer_brand_selection_parameter }
      else
        format.html { render action: "new" }
        format.json { render json: @consumer_brand_selection_parameter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /consumer_brand_selection_parameters/1
  # PUT /consumer_brand_selection_parameters/1.json
  def update
    @consumer_brand_selection_parameter = ConsumerBrandSelectionParameter.find(params[:id])

    respond_to do |format|
      if @consumer_brand_selection_parameter.update_attributes(params[:consumer_brand_selection_parameter])
        format.html { redirect_to @consumer_brand_selection_parameter, notice: 'Consumer brand selection parameter was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @consumer_brand_selection_parameter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /consumer_brand_selection_parameters/1
  # DELETE /consumer_brand_selection_parameters/1.json
  def destroy
    @consumer_brand_selection_parameter = ConsumerBrandSelectionParameter.find(params[:id])
    @consumer_brand_selection_parameter.destroy

    respond_to do |format|
      format.html { redirect_to consumer_brand_selection_parameters_url }
      format.json { head :ok }
    end
  end
end
