class ExpensesController < ApplicationController
  # GET /expenses
  # GET /expenses.json

  def index
    @expenses = Expense.all
    @expense_types=ExpenseType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @expenses }
    end
  end

  # GET /expenses/1
  # GET /expenses/1.json
  def show
    @expense = Expense.find(params[:id])

    render :layout => false
    #respond_to do |format|
    #  format.html # show.html.erb
    #  format.json { render json: @expense }
    #end
  end

  # GET /expenses/new
  # GET /expenses/new.json
  def new
    @expense = Expense.new
    render :layout => false

  end

  # GET /expenses/1/edit
  def edit
    @expense = Expense.find(params[:id])
    render :layout => false
  end

  # POST /expenses
  # POST /expenses.json
  def create
    @expense = Expense.new(params[:expense])

    respond_to do |format|
      if @expense.save
        #now we redirect to enter the value of all the expense options
        format.html { redirect_to expenses_path }
        #  format.html { redirect_to @expense, notice: 'Expense was successfully created.' }
        format.json { render json: @expense, status: :created, location: @expense }
      else
        format.html { render action: "new" }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /expenses/1
  # PUT /expenses/1.json
  def update
    @expense = Expense.find(params[:id])

    respond_to do |format|
      if @expense.update_attributes(params[:expense])
        format.html { redirect_to expenses_path }
        #format.html { redirect_to @expense, notice: 'Expense was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expenses/1
  # DELETE /expenses/1.json
  def destroy
    @expense = Expense.find(params[:id])
    @expense.destroy

    respond_to do |format|
      format.html { redirect_to expenses_url }
      format.json { head :ok }
    end
  end

  def view_expenses
    @expense_type=ExpenseType.find(params[:expense_type_id])
    @expenses=@expense_type.expenses


  end
end
