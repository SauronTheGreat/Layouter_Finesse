class PlayerRoundLoansController < ApplicationController
  # GET /player_round_loans
  # GET /player_round_loans.json
  def index
    @player_round_loans = PlayerRoundLoan.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @player_round_loans }
    end
  end

  # GET /player_round_loans/1
  # GET /player_round_loans/1.json
  def show
    @player_round_loan = PlayerRoundLoan.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @player_round_loan }
    end
  end

  # GET /player_round_loans/new
  # GET /player_round_loans/new.json
  def new

    @player=Player.find(params[:player_id])
    @round=Round.find(params[:round_id])
    @round_loans=@round.round_loans
    @brand=Brand.find(params[:brand_id])


    @player_round_loans =Array.new(@round_loans.count) { PlayerRoundLoan.new }

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @player_round_loan }
    end
  end

  # GET /player_round_loans/1/edit
  def edit
    @player_round_loan = PlayerRoundLoan.find(params[:id])
  end

  # POST /player_round_loans
  # POST /player_round_loans.json
  def create
    @player_round_loans = params[:player_round_loans].values.collect { |player_round_loan| PlayerRoundLoan.new(player_round_loan) }

    @player_round_loans.each do |player_round_loan|
      player_round_loan.save!
    end

#    @player_round_loan = PlayerRoundLoan.new(params[:player_round_loan])

    respond_to do |format|
      if @player_round_loans.all?(&:valid?)
        @round=Round.find(@player_round_loans[0].round_id)
        @round.played=true
        @round.save!
       # format.html { redirect_to new_player_round_investment_path(:player_id=>@player_round_loans[0].player_id, :round_id=>@player_round_loans[0].round_id, :brand_id=>@player_round_loans[0].brand_id) }
        format.html {redirect_to root_path}
        #format.html { redirect_to @player_round_loan, notice: 'Player round loan was successfully created.' }
        format.json { render json: @player_round_loan, status: :created, location: @player_round_loan }
      else
        format.html { render action: "new" }
        format.json { render json: @player_round_loan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /player_round_loans/1
  # PUT /player_round_loans/1.json
  def update
    @player_round_loan = PlayerRoundLoan.find(params[:id])

    respond_to do |format|
      if @player_round_loan.update_attributes(params[:player_round_loan])
        format.html { redirect_to @player_round_loan, notice: 'Player round loan was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @player_round_loan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /player_round_loans/1
  # DELETE /player_round_loans/1.json
  def destroy
    @player_round_loan = PlayerRoundLoan.find(params[:id])
    @player_round_loan.destroy

    respond_to do |format|
      format.html { redirect_to player_round_loans_url }
      format.json { head :ok }
    end
  end
end
