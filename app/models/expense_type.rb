class ExpenseType < ActiveRecord::Base
  has_many :expenses
end
