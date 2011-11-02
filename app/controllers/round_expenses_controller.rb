class RoundExpensesController < ApplicationController
  # GET /round_expenses
  # GET /round_expenses.json
  def index
    @round_expenses = RoundExpense.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @round_expenses }
    end
  end

  # GET /round_expenses/1
  # GET /round_expenses/1.json
  def show
    @round_expense = RoundExpense.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @round_expense }
    end
  end

  # GET /round_expenses/new
  # GET /round_expenses/new.json
  def new
    @round=Round.find(params[:round_id])
    @round_expense = RoundExpense.new


    @included_expenses=@round.round_expenses
   @included_expenses_ids=Array.new
    @included_expenses.each do |expense|
      @included_expenses_ids << expense.expense_id

    end


    #this is the array we need to display in drop down
    @expense_list=Expense.all.collect{|expense| if @included_expenses_ids.include?(expense.id)==false then [expense.name,expense.id] end}.compact


    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @round_expense }
    end
  end

  # GET /round_expenses/1/edit
  def edit
    @round_expense = RoundExpense.find(params[:id])
  end

  # POST /round_expenses
  # POST /round_expenses.json
  def create
    @round_expense = RoundExpense.new(params[:round_expense])

    respond_to do |format|
      if @round_expense.save
        format.html{redirect_to new_round_expense_path(:round_id=>@round_expense.round_id)}
        format.html { redirect_to @round_expense, notice: 'Round expense was successfully created.' }
        format.json { render json: @round_expense, status: :created, location: @round_expense }
      else
        format.html { render action: "new" }
        format.json { render json: @round_expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /round_expenses/1
  # PUT /round_expenses/1.json
  def update
    @round_expense = RoundExpense.find(params[:id])

    respond_to do |format|
      if @round_expense.update_attributes(params[:round_expense])
        format.html { redirect_to @round_expense, notice: 'Round expense was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @round_expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /round_expenses/1
  # DELETE /round_expenses/1.json
  def destroy
    @round_expense = RoundExpense.find(params[:id])
    @round_expense.destroy

    respond_to do |format|
      format.html { redirect_to round_expenses_url }
      format.json { head :ok }
    end
  end
end
