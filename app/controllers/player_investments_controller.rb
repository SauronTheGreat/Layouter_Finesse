class PlayerInvestmentsController < ApplicationController
  # GET /player_investments
  # GET /player_investments.json
  def index
    @player_investments = PlayerInvestment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @player_investments }
    end
  end

  # GET /player_investments/1
  # GET /player_investments/1.json
  def show
    @player_investment = PlayerInvestment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @player_investment }
    end
  end

  # GET /player_investments/new
  # GET /player_investments/new.json
  def new
    @player_investment = PlayerInvestment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @player_investment }
    end
  end

  # GET /player_investments/1/edit
  def edit
    @player_investment = PlayerInvestment.find(params[:id])
  end

  # POST /player_investments
  # POST /player_investments.json
  def create
    @player_investment = PlayerInvestment.new(params[:player_investment])

    respond_to do |format|
      if @player_investment.save
        format.html { redirect_to @player_investment, notice: 'Player investment was successfully created.' }
        format.json { render json: @player_investment, status: :created, location: @player_investment }
      else
        format.html { render action: "new" }
        format.json { render json: @player_investment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /player_investments/1
  # PUT /player_investments/1.json
  def update
    @player_investment = PlayerInvestment.find(params[:id])

    respond_to do |format|
      if @player_investment.update_attributes(params[:player_investment])
        format.html { redirect_to @player_investment, notice: 'Player investment was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @player_investment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /player_investments/1
  # DELETE /player_investments/1.json
  def destroy
    @player_investment = PlayerInvestment.find(params[:id])
    @player_investment.destroy

    respond_to do |format|
      format.html { redirect_to player_investments_url }
      format.json { head :ok }
    end
  end
end
