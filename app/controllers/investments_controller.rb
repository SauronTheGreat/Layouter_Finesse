class InvestmentsController < ApplicationController
  # GET /investments
  # GET /investments.json
  def index
    @investments = Investment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @investments }
    end
  end

  # GET /investments/1
  # GET /investments/1.json
  def show
    @investment = Investment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @investment }
    end
  end

  # GET /investments/new
  # GET /investments/new.json
  def new
    @investment = Investment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @investment }
    end
  end

  # GET /investments/1/edit
  def edit
    @investment = Investment.find(params[:id])
  end

  # POST /investments
  # POST /investments.json
  def create
    @investment = Investment.new(params[:investment])

    respond_to do |format|
      if @investment.save
        format.html { redirect_to @investment, notice: 'Investment was successfully created.' }
        format.json { render json: @investment, status: :created, location: @investment }
      else
        format.html { render action: "new" }
        format.json { render json: @investment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /investments/1
  # PUT /investments/1.json
  def update
    @investment = Investment.find(params[:id])

    respond_to do |format|
      if @investment.update_attributes(params[:investment])
        format.html { redirect_to @investment, notice: 'Investment was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @investment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /investments/1
  # DELETE /investments/1.json
  def destroy
    @investment = Investment.find(params[:id])
    @investment.destroy

    respond_to do |format|
      format.html { redirect_to investments_url }
      format.json { head :ok }
    end
  end
end
