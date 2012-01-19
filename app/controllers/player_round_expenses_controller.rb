class PlayerRoundExpensesController < ApplicationController
  # GET /player_round_expenses
  # GET /player_round_expenses.json
  layout 'welcome'
  def index
    @player_round_expenses = PlayerRoundExpense.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @player_round_expenses }
    end
  end

  # GET /player_round_expenses/1
  # GET /player_round_expenses/1.json
  def show

    @player_round_expense = PlayerRoundExpense.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @player_round_expense }
    end
  end

  # GET /player_round_expenses/new
  # GET /player_round_expenses/new.json
  def new
    @player=Player.find(params[:player_id])
    @round=Round.find(params[:round_id])
    @round_expenses=@round.round_expenses.collect { |round_expense|
      if round_expense.visible==true then
        round_expense
      else
        nil
      end }.compact
    #render :text=> @round.round_expenses.collect{|re| if re.visible==true then "1" end}.compact
    #return
    @brand=Brand.find(params[:brand_id])

    @player_round_expenses=Array.new(@round_expenses.count) { PlayerRoundExpense.new }
    #@player_round_expense = PlayerRoundExpense.new


    #investments
    @player=Player.find(params[:player_id])
    @round=Round.find(params[:round_id])
    @round_investments=@round.round_investments
    @brand=Brand.find(params[:brand_id])
    @player_round_investments=Array.new(@round_investments.count) { PlayerRoundInvestment.new }


    #loans
    @player=Player.find(params[:player_id])
    @round=Round.find(params[:round_id])
    @round_loans=@round.round_loans
    @brand=Brand.find(params[:brand_id])


    @player_round_loans =Array.new(@round_loans.count) { PlayerRoundLoan.new }


    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @player_round_expense }
    end
  end

  # GET /player_round_expenses/1/edit
  def edit
    @player_round_expense = PlayerRoundExpense.find(params[:id])
  end

  # POST /player_round_expenses
  # POST /player_round_expenses.json
  def create




    @player_round_expenses = params[:player_round_expenses].values.collect { |player_round_expense| PlayerRoundExpense.new(player_round_expense) }
    @factory_expense_category=ExpenseType.find_by_name("Factory")
    @player_round_expenses.each do |player_round_expense|
      if ExpenseType.find(Expense.find(player_round_expense.expense_id).expense_type_id).id==@factory_expense_category.id
        factory=Factory.find_by_name(Expense.find(player_round_expense.expense_id).name)
        @player_round_factory=PlayerRoundFactory.new
        @player_round_factory.factory_id=factory.id
        @player_round_factory.player_id=player_round_expense.player_id
        @player_round_factory.save!

        @round_expense=RoundExpense.find_by_expense_id(player_round_expense.expense_id)
        @round_expense.visible=false
        @round_expense.save!

      end
      player_round_expense.save!
    end


    #saving player investments
    @player_round_investments = params[:player_round_investments].values.collect { |player_round_investment| PlayerRoundInvestment.new(player_round_investment) }

    if @player_round_investments.all?(&:valid?)
      @player_round_investments.each do |player_round_investment|
        player_round_investment.save!
      end
    end


    #saving player loans

    @player_round_loans = params[:player_round_loans].values.collect { |player_round_loan| PlayerRoundLoan.new(player_round_loan) }

    if @player_round_loans.all?(&:valid?)
      @player_round_loans.each do |player_round_loan|
        player_round_loan.save!
      end
    end

    @player=Player.find(@player_round_expenses[0].player_id)
    @player.last_played=ActiveRound.first.round_id
    @player.save!



    #@curr_round=Round.find(@player_round_expenses[0].round_id)
    #@prev_round=Round.find_by_number_and_simulation_id(@curr_round.number-1, @curr_round.simulation_id)
    #
    #@player_financial=PlayerFinancial.find_by_player_id_and_round_id(@player_round_expenses[0].player_id, @prev_round.id)


    #respond_to do |format|
    #  if @player_round_expenses.all?(&:valid?)
    #    #format.html { redirect_to @player_round_expense, notice: 'Player round expense was successfully created.' }
    #    if @player_financial.cash <= 0
    #      format.html { redirect_to new_player_round_loan_path(:player_id=>@player_round_expenses[0].player_id, :round_id=>@player_round_expenses[0].round_id, :brand_id=>@player_round_expenses[0].brand_id) }
    #    else
    #      format.html { redirect_to new_player_round_investment_path(:player_id=>@player_round_expenses[0].player_id, :round_id=>@player_round_expenses[0].round_id, :brand_id=>@player_round_expenses[0].brand_id) }
    #
    #    end
    #    format.json { render json: @player_round_expense, status: :created, location: @player_round_expense }
    #  else
    #    format.html { render action: "new" }
    #    format.json { render json: @player_round_expense.errors, status: :unprocessable_entity }
    #  end
    #end

    respond_to do |format|
    format.html {redirect_to root_path,:notice => "Decisions are successfully recorded"}
    end

  end

  # PUT /player_round_expenses/1
  # PUT /player_round_expenses/1.json
  def update
    @player_round_expense = PlayerRoundExpense.find(params[:id])

    respond_to do |format|
      if @player_round_expense.update_attributes(params[:player_round_expense])
        format.html { redirect_to @player_round_expense, notice: 'Player round expense was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @player_round_expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /player_round_expenses/1
  # DELETE /player_round_expenses/1.json
  def destroy
    @player_round_expense = PlayerRoundExpense.find(params[:id])
    @player_round_expense.destroy

    respond_to do |format|
      format.html { redirect_to player_round_expenses_url }
      format.json { head :ok }
    end
  end
end
