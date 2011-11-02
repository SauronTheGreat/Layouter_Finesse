class RoundLoansController < ApplicationController
  # GET /round_loans
  # GET /round_loans.json
  def index
    @round_loans = RoundLoan.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @round_loans }
    end
  end

  # GET /round_loans/1
  # GET /round_loans/1.json
  def show
    @round_loan = RoundLoan.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @round_loan }
    end
  end

  # GET /round_loans/new
  # GET /round_loans/new.json
  def new
    @round=Round.find(params[:round_id])
    @round_loan = RoundLoan.new

    @included_loan_list=@round.round_loans
    @included_loan_list_ids=Array.new
    @included_loan_list.each do |list|
      @included_loan_list_ids << list.loan_id
    end

    @loan_list=Loan.all.collect{|loan| if @included_loan_list_ids.include?(loan.id)==false then [loan.name,loan.id] end }.compact

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @round_loan }
    end
  end

  # GET /round_loans/1/edit
  def edit
    @round_loan = RoundLoan.find(params[:id])
  end

  # POST /round_loans
  # POST /round_loans.json
  def create
    @round_loan = RoundLoan.new(params[:round_loan])

    respond_to do |format|
      if @round_loan.save
        format.html {redirect_to new_round_loan_path(:round_id=>@round_loan.round_id)}
        format.html { redirect_to @round_loan, notice: 'Round loan was successfully created.' }
        format.json { render json: @round_loan, status: :created, location: @round_loan }
      else
        format.html { render action: "new" }
        format.json { render json: @round_loan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /round_loans/1
  # PUT /round_loans/1.json
  def update
    @round_loan = RoundLoan.find(params[:id])

    respond_to do |format|
      if @round_loan.update_attributes(params[:round_loan])
        format.html { redirect_to @round_loan, notice: 'Round loan was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @round_loan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /round_loans/1
  # DELETE /round_loans/1.json
  def destroy
    @round_loan = RoundLoan.find(params[:id])
    @round_loan.destroy

    respond_to do |format|
      format.html { redirect_to round_loans_url }
      format.json { head :ok }
    end
  end
end
