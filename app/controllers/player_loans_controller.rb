class PlayerLoansController < ApplicationController
  # GET /player_loans
  # GET /player_loans.json
  def index
    @player_loans = PlayerLoan.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @player_loans }
    end
  end

  # GET /player_loans/1
  # GET /player_loans/1.json
  def show
    @player_loan = PlayerLoan.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @player_loan }
    end
  end

  # GET /player_loans/new
  # GET /player_loans/new.json
  def new
    @player_loan = PlayerLoan.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @player_loan }
    end
  end

  # GET /player_loans/1/edit
  def edit
    @player_loan = PlayerLoan.find(params[:id])
  end

  # POST /player_loans
  # POST /player_loans.json
  def create
    @player_loan = PlayerLoan.new(params[:player_loan])

    respond_to do |format|
      if @player_loan.save
        format.html { redirect_to @player_loan, notice: 'Player loan was successfully created.' }
        format.json { render json: @player_loan, status: :created, location: @player_loan }
      else
        format.html { render action: "new" }
        format.json { render json: @player_loan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /player_loans/1
  # PUT /player_loans/1.json
  def update
    @player_loan = PlayerLoan.find(params[:id])

    respond_to do |format|
      if @player_loan.update_attributes(params[:player_loan])
        format.html { redirect_to @player_loan, notice: 'Player loan was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @player_loan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /player_loans/1
  # DELETE /player_loans/1.json
  def destroy
    @player_loan = PlayerLoan.find(params[:id])
    @player_loan.destroy

    respond_to do |format|
      format.html { redirect_to player_loans_url }
      format.json { head :ok }
    end
  end
end
