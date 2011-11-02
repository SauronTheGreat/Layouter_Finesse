class FactoriesController < ApplicationController
  # GET /factories
  # GET /factories.json
  def index
    @factories = Factory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @factories }
    end
  end

  # GET /factories/1
  # GET /factories/1.json
  def show
    @factory = Factory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @factory }
    end
  end

  # GET /factories/new
  # GET /factories/new.json
  def new
    @factory = Factory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @factory }
    end
  end

  # GET /factories/1/edit
  def edit
    @factory = Factory.find(params[:id])
  end

  # POST /factories
  # POST /factories.json
  def create
    @factory = Factory.new(params[:factory])

    respond_to do |format|
      if @factory.save
        #when the factory is saved, the corresponding expense will be created...with help of cod in model
        format.html { redirect_to @factory, notice: 'Factory was successfully created.' }
        format.json { render json: @factory, status: :created, location: @factory }
      else
        format.html { render action: "new" }
        format.json { render json: @factory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /factories/1
  # PUT /factories/1.json
  def update
    @factory = Factory.find(params[:id])

    respond_to do |format|
      if @factory.update_attributes(params[:factory])
        format.html { redirect_to @factory, notice: 'Factory was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @factory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /factories/1
  # DELETE /factories/1.json
  def destroy
    @factory = Factory.find(params[:id])
    @factory.destroy

    respond_to do |format|
      format.html { redirect_to factories_url }
      format.json { head :ok }
    end
  end
end
