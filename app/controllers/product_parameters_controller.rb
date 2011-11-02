class ProductParametersController < ApplicationController
  # GET /product_parameters
  # GET /product_parameters.json
  def index
    @product_parameters = ProductParameter.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @product_parameters }
    end
  end

  # GET /product_parameters/1
  # GET /product_parameters/1.json
  def show
    @product_parameter = ProductParameter.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product_parameter }
    end
  end

  # GET /product_parameters/new
  # GET /product_parameters/new.json
  def new
    @product=Product.find(params[:product_id])
    @product_parameters = Array.new(@product.number_of_parameters){ProductParameter.new}

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product_parameter }
    end
  end

  # GET /product_parameters/1/edit
  def edit
    @product_parameter = ProductParameter.find(params[:id])
  end

  # POST /product_parameters
  # POST /product_parameters.json
  def create
    #@product_parameter = ProductParameter.new(params[:product_parameter])

    @product_parameters = params[:product_parameters].values.collect { |parameter| ProductParameter.new(parameter) }

       @product_parameters.each do |pp|
         pp.save!
       end


    respond_to do |format|
      if @product_parameters.all?(&:valid?)
        format.html {redirect_to root_path}
       # format.html { redirect_to @product_parameter, notice: 'Product parameter was successfully created.' }
        format.json { render json: @product_parameter, status: :created, location: @product_parameter }
      else
        format.html { render action: "new" }
        format.json { render json: @product_parameter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /product_parameters/1
  # PUT /product_parameters/1.json
  def update
    @product_parameter = ProductParameter.find(params[:id])

    respond_to do |format|
      if @product_parameter.update_attributes(params[:product_parameter])
        format.html { redirect_to @product_parameter, notice: 'Product parameter was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @product_parameter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_parameters/1
  # DELETE /product_parameters/1.json
  def destroy
    @product_parameter = ProductParameter.find(params[:id])
    @product_parameter.destroy

    respond_to do |format|
      format.html { redirect_to product_parameters_url }
      format.json { head :ok }
    end
  end
end
