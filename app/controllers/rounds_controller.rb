class RoundsController < ApplicationController
  # GET /rounds
  # GET /rounds.json


  layout 'welcome'

  def index

    @simulation=Simulation.find(params[:simulation_id])
    @rounds = @simulation.rounds


    #for expenses
    @expense_types=ExpenseType.all

    @round_expense = RoundExpense.new
    @expenses=Expense.all
    @round_expenses=Array.new(Expense.all.count) { RoundExpense.new }
    @set_of_round_expenses=Array.new
    @rounds.each do |round|
      @set_of_round_expenses[round.id] =Array.new(Expense.all.count) { RoundExpense.new }

    end

    #for investments

    @round_investment = RoundInvestment.new
    @investments=Investment.all
    @round_investments=Array.new(@investments.count) { RoundInvestment.new }
    @set_of_round_investments=Array.new
    @rounds.each do |round|
      @set_of_round_investments[round.id] = Array.new(@investments.count) { RoundInvestment.new }

    end

    #for loans

    @round_loan = RoundLoan.new
    @loans=Loan.all
    @round_loans=Array.new(@loans.count) { RoundLoan.new }
    @set_of_round_loans=Array.new
    @rounds.each do |round|
      @set_of_round_loans[round.id]= Array.new(@loans.count) { RoundLoan.new }

    end


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @rounds }
    end
  end

  # GET /rounds/1
  # GET /rounds/1.json
  def show
    @round = Round.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @round }
    end
  end

  # GET /rounds/new
  # GET /rounds/new.json
  def new
    @round = Round.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @round }
    end
  end

  # GET /rounds/1/edit
  def edit
    @round = Round.find(params[:id])
  end

  # POST /rounds
  # POST /rounds.json
  def create


    @simulation=Simulation.find(params[:simulation_id])
    @rounds=@simulation.rounds


    @rounds.each do |round|
      #for expenses
      if round.number > 0
        @round_expenses = params["set_of_round_expenses"][round.id.to_s].values.collect { |round_expense| RoundExpense.new(round_expense) }
        @round_expenses.each do |round_expense|
          if round_expense.expense_id!=0
            if !round_expense.save
              render action: "index"
            end

          end
        end


        #for investments
        @round_investments = params["set_of_round_investments"][round.id.to_s].values.collect { |round_investment| RoundInvestment.new(round_investment) }
        @round_investments.each do |round_investment|
          if round_investment.investment_id!=0
            if !round_investment.save
              render action: "index"
            end
          end
        end

        #for loans
        @round_loans = params["set_of_round_loans"][round.id.to_s].values.collect { |round_loan| RoundLoan.new(round_loan) }
        @round_loans.each do |round_loan|
          if round_loan.loan_id!=0

            if !round_loan.save
              render action: "index"
            end
          end
        end
      end
    end

    respond_to do |format|

      format.html { redirect_to simulations_path, notice: 'Round was successfully created.' }
      format.json { render json: @round, status: :created, location: @round }

      #format.html { render action: "new" }
      #format.json { render json: @round.errors, status: :unprocessable_entity }

    end
  end

  # PUT /rounds/1
  # PUT /rounds/1.json
  def update
    @round = Round.find(params[:id])

    respond_to do |format|
      if @round.update_attributes(params[:round])
        format.html { redirect_to @round, notice: 'Round was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @round.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rounds/1
  # DELETE /rounds/1.json
  def destroy
    @round = Round.find(params[:id])
    @round.destroy

    respond_to do |format|
      format.html { redirect_to rounds_url }
      format.json { head :ok }
    end
  end


  def populate_rate_of_interest
    @round=Round.find(params[:round_id])


  end

  def set_rate_of_interest
    @round=Round.find(params[:round_id])
    @round.rate_of_interest=params[:rate_of_interest]
    if @round.save!
      redirect_to rounds_path(:simulation_id=>@round.simulation_id)
      # redirect_to simulation_path(Simulation.find(@round.simulation_id))
    end


  end


  def populate_depreciation
    @round=Round.find(params[:round_id])
  end


  def set_depreciation

    @round=Round.find(params[:round_id])
    @round.depreciation=params[:depreciation]
    if @round.save!
      redirect_to rounds_path(:simulation_id=>@round.simulation_id)
      # redirect_to simulation_path(Simulation.find(@round.simulation_id))
    end


  end


end
