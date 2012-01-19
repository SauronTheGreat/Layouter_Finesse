class PlayerRoundExpense < ActiveRecord::Base
  validates_presence_of :expense_option_id
end
