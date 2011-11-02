class RawMaterialsController < ApplicationController
  # GET /raw_materials
  # GET /raw_materials.json
  def index
    @raw_materials = RawMaterial.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @raw_materials }
    end
  end

  # GET /raw_materials/1
  # GET /raw_materials/1.json
  def show
    @raw_material = RawMaterial.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @raw_material }
    end
  end

  # GET /raw_materials/new
  # GET /raw_materials/new.json
  def new
    @raw_material = RawMaterial.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @raw_material }
    end
  end

  # GET /raw_materials/1/edit
  def edit
    @raw_material = RawMaterial.find(params[:id])
  end

  # POST /raw_materials
  # POST /raw_materials.json
  def create
    @raw_material = RawMaterial.new(params[:raw_material])

    respond_to do |format|
      if @raw_material.save
        format.html { redirect_to @raw_material, notice: 'Raw material was successfully created.' }
        format.json { render json: @raw_material, status: :created, location: @raw_material }
      else
        format.html { render action: "new" }
        format.json { render json: @raw_material.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /raw_materials/1
  # PUT /raw_materials/1.json
  def update
    @raw_material = RawMaterial.find(params[:id])

    respond_to do |format|
      if @raw_material.update_attributes(params[:raw_material])
        format.html { redirect_to @raw_material, notice: 'Raw material was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @raw_material.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /raw_materials/1
  # DELETE /raw_materials/1.json
  def destroy
    @raw_material = RawMaterial.find(params[:id])
    @raw_material.destroy

    respond_to do |format|
      format.html { redirect_to raw_materials_url }
      format.json { head :ok }
    end
  end
end
