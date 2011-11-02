class PlayerRoundInvestmentsController < ApplicationController
  # GET /player_round_investments
  # GET /player_round_investments.json
  def index
    @player_round_investments = PlayerRoundInvestment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @player_round_investments }
    end
  end

  # GET /player_round_investments/1
  # GET /player_round_investments/1.json
  def show
    @player_round_investment = PlayerRoundInvestment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @player_round_investment }
    end
  end

  # GET /player_round_investments/new
  # GET /player_round_investments/new.json
  def new
    @player=Player.find(params[:player_id])
    @round=Round.find(params[:round_id])
    @round_investments=@round.round_investments
     @brand=Brand.find(params[:brand_id])
    @player_round_investments=Array.new(@round_investments.count) { PlayerRoundInvestment.new }


    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @player_round_investment }
    end
  end

  # GET /player_round_investments/1/edit
  def edit
    @player_round_investment = PlayerRoundInvestment.find(params[:id])
  end

  # POST /player_round_investments
  # POST /player_round_investments.json
  def create

    @player_round_investments = params[:player_round_investments].values.collect{ |player_round_investment| PlayerRoundInvestment.new(player_round_investment) }

        @player_round_investments.each do |player_round_investment|
          player_round_investment.save!
        end


    respond_to do |format|
      if @player_round_investments.all?(&:valid?)
        format.html {redirect_to root_path}
        #format.html { redirect_to @player_round_investment, notice: 'Player round investment was successfully created.' }
        format.json { render json: @player_round_investment, status: :created, location: @player_round_investment }
      else
        format.html { render action: "new" }
        format.json { render json: @player_round_investment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /player_round_investments/1
  # PUT /player_round_investments/1.json
  def update
    @player_round_investment = PlayerRoundInvestment.find(params[:id])

    respond_to do |format|
      if @player_round_investment.update_attributes(params[:player_round_investment])
        format.html { redirect_to @player_round_investment, notice: 'Player round investment was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @player_round_investment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /player_round_investments/1
  # DELETE /player_round_investments/1.json
  def destroy
    @player_round_investment = PlayerRoundInvestment.find(params[:id])
    @player_round_investment.destroy

    respond_to do |format|
      format.html { redirect_to player_round_investments_url }
      format.json { head :ok }
    end
  end
end
