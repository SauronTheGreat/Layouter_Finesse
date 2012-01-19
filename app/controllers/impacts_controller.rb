class ImpactsController < ApplicationController
  # GET /impacts
  # GET /impacts.json
  def index
    @impacts = Impact.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @impacts }
    end
  end

  # GET /impacts/1
  # GET /impacts/1.json
  def show
    @impact = Impact.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @impact }
    end
  end

  # GET /impacts/new
  # GET /impacts/new.json
  def new
    @impact = Impact.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @impact }
    end
  end

  # GET /impacts/1/edit
  def edit
    @impact = Impact.find(params[:id])
    render :layout => false
  end

  # POST /impacts
  # POST /impacts.json
  def create
    @impact = Impact.new(params[:impact])

    respond_to do |format|
      if @impact.save
        format.html { redirect_to impacts_path, notice: 'Impact was successfully created.' }
        format.json { render json: @impact, status: :created, location: @impact }
      else
        format.html { render action: "new" }
        format.json { render json: @impact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /impacts/1
  # PUT /impacts/1.json
  def update
    @impact = Impact.find(params[:id])

    respond_to do |format|
      if @impact.update_attributes(params[:impact])
        format.html { redirect_to impacts_path, notice: 'Impact was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @impact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /impacts/1
  # DELETE /impacts/1.json
  def destroy
    @impact = Impact.find(params[:id])
    @impact.destroy

    respond_to do |format|
      format.html { redirect_to impacts_url }
      format.json { head :ok }
    end
  end
end
