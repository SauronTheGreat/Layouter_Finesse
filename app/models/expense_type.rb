class ExpenseType < ActiveRecord::Base
  has_many :expenses
  validates_presence_of :name
  validates_uniqueness_of :name

  before_destroy :validate_destroy
  def validate_destroy
    if Expense.find_by_expense_type_id(self.id).nil?
       return true
    else
      return false
    end

  end
end
