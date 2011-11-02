class PlayerFinancial < ActiveRecord::Base


  #we create a method where all financials for a player are populated
  def self.create_financials_for_player(round_id, player_id)
    @player_financial=PlayerFinancial.new
    @default=DefaultPlayerDatum.first
    @player_financial.fixed_assets=@default.fixed_assets
    @player_financial.investments=@default.investments
    @player_financial.inventory=@default.inventory
    @player_financial.cash=@default.cash
    @player_financial.long_term_loans=@default.long_term_loans
    @player_financial.short_term_loans=@default.short_term_loans
    @player_financial.net_worth=@default.net_worth
    @player_financial.income=@default.income
    @player_financial.cogs=@default.cogs
    @player_financial.employee_cost=@default.employee_cost
    @player_financial.sga=@default.sga
    @player_financial.ebitda=@default.ebitda
    @player_financial.interest=@default.interest
    @player_financial.investment_income=@default.investment_income
    @player_financial.depreciation=@default.depreciation
    @player_financial.pbt=@default.pbt
    @player_financial.tax=@default.tax
    @player_financial.pat=@default.pat
    @player_financial.player_id=player_id
    @player_financial.round_id=round_id-1
    @player_financial.save!


  end

  #the argument is to pass current round and player id
  def self.calculate_sga(round_id, player_id)
    #sga is essentially total of media expenses and channel expenses
    @media_expense_category=ExpenseType.find_by_name("HR")
    @channel_expense_category=ExpenseType.find_by_name("Channel")
    @factory_expense_category=ExpenseType.find_by_name("Factory")

    @expenses=PlayerRoundExpense.find_all_by_player_id_and_round_id(player_id, round_id)
    media_total=0
    channel_total=0
    logistics_total=0
    @expenses.each do |expense|
      if ExpenseType.find(Expense.find(expense.expense_id).expense_type_id).id==@media_expense_category.id
        media_total=media_total+ExpenseOption.find(expense.expense_option_id).amount

      elsif ExpenseType.find(Expense.find(expense.expense_id).expense_type_id).id==@channel_expense_category.id
        channel_total = channel_total+ExpenseOption.find(expense.expense_option_id).amount
      elsif ExpenseType.find(Expense.find(expense.expense_id).expense_type_id).id==@factory_expense_category.id
        logistics_total=logistics_total+Factory.find_by_name(Expense.find(expense.expense_id).name).factory_vendors.sum("distance")

      end
    end

    total_sga=media_total+channel_total+logistics_total
    return total_sga

  end

  def self.calculate_total_employee_cost(round_id, player_id)

    @player_expenses=PlayerRoundExpense.find_all_by_player_id_and_round_id(player_id, round_id)
    @factories=Array.new
    @factory_expense_category=ExpenseType.find_by_name("Factory")
    @player_expenses.each do |expense|
      if ExpenseType.find(Expense.find(expense.expense_id).expense_type_id).id==@factory_expense_category.id
        @factories << Factory.find_by_name(Expense.find(expense.expense_id).name)
      end
    end
    @employee_categories=EmployeeCategory.all
         total=0
    @factories.each do |factory|
      #@employees=factory.employees
      #now we calculate total salaries given
      sum=0
      #@employees.each do |employee|
      #  sum=sum+EmployeeCategory.find(employee.employee_category_id).base_salary
      #end

      @employee_categories.each do |category|
        x=category.employees.count
        salary=category.base_salary
        sum=sum+salary*x
      end

      @hr_expense_type=ExpenseType.find_by_name("HR")
      hr_total=0

      @expenses=PlayerRoundExpense.find_all_by_player_id_and_round_id(player_id, round_id)
      @expenses.each do |expense|
        if ExpenseType.find(Expense.find(expense.expense_id).expense_type_id).id==@hr_expense_type.id
          hr_total=hr_total+ExpenseOption.find(expense.expense_option_id).amount

        end
      end

      factory.total_employee_cost=sum+hr_total
      factory.save!
      total =total+factory.total_employee_cost
    end

     return total


  end


  def self.calculate_total_sales(player_id)
    #here we calculate the total sales for each brand in the market.
    #we get the total sales by calculating the following for each brand:
    #number of consumers buying that brand.
    #annual consumption of the category the consumer belongs to
    #adding up yearly consumption overall...
    #multiplying it by price per unit

    @brands=Brand.find_all_by_player_id(player_id)
    @sales=0
    @brands.each do |brand|

      total=0
      ConsumerCategory.all.each do |consumer_category|

        @no_of_consumers=Consumer.find_all_by_brand_id_and_consumer_category_id(brand.id, consumer_category.id).count

        total=total+consumer_category.annual_consumption*brand.price_per_unit*@no_of_consumers

      end
      @sales = @sales+total

    end
    return @sales
  end

  def self.calculate_short_term_loans(round_id, player_id)
    #we use this method to return the amount of short term loans taken by the player for current round
    @short_loan_type=LoanType.find_by_name("Short")
    @player_round_loans=PlayerRoundLoan.find_all_by_player_id_and_round_id(player_id, round_id)
    @total_short_loan=0

    @player_round_loans.each do |player_round_loan|
      if Loan.find(player_round_loan.loan_id).loan_type_id==@short_loan_type.id
        @total_short_loan=@total_short_loan+player_round_loan.amount


      end

    end

    if @total_short_loan.nil?
      return 0
    else
      return @total_short_loan
    end


  end


  def self.calculate_long_term_loans(round_id, player_id)
    #we use this method to return the amount of long term loans taken by the player for current round
    @short_loan_type=LoanType.find_by_name("Long")
    @player_round_loans=PlayerRoundLoan.find_all_by_player_id_and_round_id(player_id, round_id)
    @total_short_loan=0

    @player_round_loans.each do |player_round_loan|
      if Loan.find(player_round_loan.loan_id).loan_type_id==@short_loan_type.id
        @total_long_loan=@total_loan_loan+player_round_loan.amount


      end

    end

    if @total_long_loan.nil?
      return 0
    else
      return @total_long_loan
    end


  end

  def self.calculate_total_cogs(player_id)
    @simulation=Simulation.find(Player.find(player_id).simulation_id)
    @product=Product.find(@simulation.product_id)
    return @product.mfg_cost
  end


  def self.calculate_interest_cost(round_id, player_id)
    #this is summation amount of each loan * tenure( 1 year)* rate of interest/100

    @player_round_loans=PlayerRoundLoan.find_all_by_player_id_and_round_id(player_id, round_id)
    @total=0
    @player_round_loans.each do |player_round_loans|
      @total=@total+player_round_loans.amount*Round.find(round_id).rate_of_interest
    end
    @total=@total/100
    return @total
  end

  def self.calculate_fixed_assets(round_id, player_id)
    #this helps us to find total fixed assets acquired this year
    @factories=PlayerRoundExpense.find_all_by_player_id_and_round_id(player_id, round_id)
    @total=0
    @factories.each do |expense|
      @total=@total+Factory.find_by_name(Expense.find(expense.expense_id).name).price
    end

    return @total
  end

  def self.calculate_investment_income(round_id, player_id)
    #we use this to calculate income we have by investments

    @player_round_investments=PlayerRoundInvestment.find_all_by_player_id_and_round_id(player_id, round_id)
    @total=0
    @player_round_investments.each do |investment|
      @total=@total+investment.amount*(RoundInvestment.find_by_round_id_and_investment_id(round_id, investment.investment_id).roi)
    end
    @total=@total/100
    return @total

  end

  def self.calculate_player_financials(round_id, player_id)
    @depreciation=Round.find(round_id).depreciation
    if (@depreciation.nil?)
      @depreciation=10
    end
    @tax_rate=Simulation.find(Player.find(player_id).simulation_id).tax_rate
    #we use this to calculate depreciation
    @prev_player_financial=PlayerFinancial.find_by_player_id_and_round_id(player_id, round_id-1)
    #this indentifies the previous financial record


    @player_financial=PlayerFinancial.new
    @player_financial.round_id=round_id
    @player_financial.player_id=player_id


    sga= PlayerFinancial.calculate_sga(round_id, player_id)
    employee_cost=PlayerFinancial.calculate_total_employee_cost(round_id, player_id)
    income=PlayerFinancial.calculate_total_sales(player_id)
    short_term_loans=PlayerFinancial.calculate_short_term_loans(round_id, player_id)
    long_term_loans=PlayerFinancial.calculate_long_term_loans(round_id, player_id)
    cogs=PlayerFinancial.calculate_total_cogs(player_id)
    interest=PlayerFinancial.calculate_interest_cost(round_id, player_id)
    depreciation=@prev_player_financial.fixed_assets*@depreciation/100
    fixed_assets=@prev_player_financial.fixed_assets+PlayerFinancial.calculate_fixed_assets(round_id, player_id)
    investment_income=PlayerFinancial.calculate_investment_income(round_id, player_id)

    #now we make calculations for derived attributes....
    ebitda=income-cogs-employee_cost-sga
    pbt=ebitda-interest+investment_income-depreciation
    tax=pbt*@tax_rate/100
    net_worth=@prev_player_financial.total_assets-long_term_loans-short_term_loans
    pat=pbt-tax


    @player_financial.sga= sga
    @player_financial.employee_cost=employee_cost
    @player_financial.income=income
    @player_financial.short_term_loans=short_term_loans
    @player_financial.long_term_loans=long_term_loans
    @player_financial.cogs=cogs
    @player_financial.interest=interest
    @player_financial.depreciation=depreciation
    @player_financial.fixed_assets=depreciation
    @player_financial.investment_income=investment_income

    #now we make calculations for derived attributes....
    @player_financial.ebitda=ebitda
    @player_financial.pbt=pbt
    @player_financial.tax=tax
    @player_financial.net_worth=net_worth
    @player_financial.pat=pat
    @player_financial.save!


  end
end