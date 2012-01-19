class BrandSelectionParametersController < ApplicationController
  # GET /brand_selection_parameters
  # GET /brand_selection_parameters.json
  def index
    @brand_selection_parameters = BrandSelectionParameter.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @brand_selection_parameters }
    end
  end

  # GET /brand_selection_parameters/1
  # GET /brand_selection_parameters/1.json
  def show
    @brand_selection_parameter = BrandSelectionParameter.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @brand_selection_parameter }
    end
  end

  # GET /brand_selection_parameters/new
  # GET /brand_selection_parameters/new.json
  def new
    @brand_selection_parameter = BrandSelectionParameter.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @brand_selection_parameter }
    end
  end

  # GET /brand_selection_parameters/1/edit
  def edit
    @brand_selection_parameter = BrandSelectionParameter.find(params[:id])
  end

  # POST /brand_selection_parameters
  # POST /brand_selection_parameters.json
  def create
    @brand_selection_parameter = BrandSelectionParameter.new(params[:brand_selection_parameter])

    respond_to do |format|
      if @brand_selection_parameter.save
        format.html { redirect_to @brand_selection_parameter, notice: 'Brand selection parameter was successfully created.' }
        format.json { render json: @brand_selection_parameter, status: :created, location: @brand_selection_parameter }
      else
        format.html { render action: "new" }
        format.json { render json: @brand_selection_parameter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /brand_selection_parameters/1
  # PUT /brand_selection_parameters/1.json
  def update
    @brand_selection_parameter = BrandSelectionParameter.find(params[:id])

    respond_to do |format|
      if @brand_selection_parameter.update_attributes(params[:brand_selection_parameter])
        format.html { redirect_to @brand_selection_parameter, notice: 'Brand selection parameter was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @brand_selection_parameter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /brand_selection_parameters/1
  # DELETE /brand_selection_parameters/1.json
  def destroy
    @brand_selection_parameter = BrandSelectionParameter.find(params[:id])
    @brand_selection_parameter.destroy

    respond_to do |format|
      format.html { redirect_to brand_selection_parameters_url }
      format.json { head :ok }
    end
  end
end
