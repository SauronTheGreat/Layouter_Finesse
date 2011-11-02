class PlayerFinancialsController < ApplicationController
  # GET /player_financials
  # GET /player_financials.json
  def index
    @player_financials = PlayerFinancial.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @player_financials }
    end
  end

  # GET /player_financials/1
  # GET /player_financials/1.json
  def show
    @player_financial = PlayerFinancial.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @player_financial }
    end
  end

  # GET /player_financials/new
  # GET /player_financials/new.json
  def new
    @player_financial = PlayerFinancial.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @player_financial }
    end
  end

  # GET /player_financials/1/edit
  def edit
    @player_financial = PlayerFinancial.find(params[:id])
  end

  # POST /player_financials
  # POST /player_financials.json
  def create
    @player_financial = PlayerFinancial.new(params[:player_financial])

    respond_to do |format|
      if @player_financial.save
        format.html { redirect_to @player_financial, notice: 'Player financial was successfully created.' }
        format.json { render json: @player_financial, status: :created, location: @player_financial }
      else
        format.html { render action: "new" }
        format.json { render json: @player_financial.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /player_financials/1
  # PUT /player_financials/1.json
  def update
    @player_financial = PlayerFinancial.find(params[:id])

    respond_to do |format|
      if @player_financial.update_attributes(params[:player_financial])
        format.html { redirect_to @player_financial, notice: 'Player financial was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @player_financial.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /player_financials/1
  # DELETE /player_financials/1.json
  def destroy
    @player_financial = PlayerFinancial.find(params[:id])
    @player_financial.destroy

    respond_to do |format|
      format.html { redirect_to player_financials_url }
      format.json { head :ok }
    end
  end
end
