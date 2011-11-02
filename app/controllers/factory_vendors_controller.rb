class FactoryVendorsController < ApplicationController
  # GET /factory_vendors
  # GET /factory_vendors.json
  def index
    @factory_vendors = FactoryVendor.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @factory_vendors }
    end
  end

  # GET /factory_vendors/1
  # GET /factory_vendors/1.json
  def show
    @factory_vendor = FactoryVendor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @factory_vendor }
    end
  end

  # GET /factory_vendors/new
  # GET /factory_vendors/new.json
  def new
    @factory_vendor = FactoryVendor.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @factory_vendor }
    end
  end

  # GET /factory_vendors/1/edit
  def edit
    @factory_vendor = FactoryVendor.find(params[:id])
  end

  # POST /factory_vendors
  # POST /factory_vendors.json
  def create
    @factory_vendor = FactoryVendor.new(params[:factory_vendor])

    respond_to do |format|
      if @factory_vendor.save
        format.html { redirect_to @factory_vendor, notice: 'Factory vendor was successfully created.' }
        format.json { render json: @factory_vendor, status: :created, location: @factory_vendor }
      else
        format.html { render action: "new" }
        format.json { render json: @factory_vendor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /factory_vendors/1
  # PUT /factory_vendors/1.json
  def update
    @factory_vendor = FactoryVendor.find(params[:id])

    respond_to do |format|
      if @factory_vendor.update_attributes(params[:factory_vendor])
        format.html { redirect_to @factory_vendor, notice: 'Factory vendor was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @factory_vendor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /factory_vendors/1
  # DELETE /factory_vendors/1.json
  def destroy
    @factory_vendor = FactoryVendor.find(params[:id])
    @factory_vendor.destroy

    respond_to do |format|
      format.html { redirect_to factory_vendors_url }
      format.json { head :ok }
    end
  end
end
