class Hrincentive < ActiveRecord::Base
  after_save :create_hr_expense

  def create_hr_expense
    @expense_type=ExpenseType.find_by_name("HR")

    Expense.create_expense(@expense_type.id,name)
  end
end

