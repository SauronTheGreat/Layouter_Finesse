class ExpenseOption < ActiveRecord::Base
  belongs_to :expense

  #this is a method to create expense options from expense
  def self.create_expense_options_from_expense(expense_id, *options)
    options.count.times do |i|

      @expense_option=ExpenseOption.new
      @expense_option.expense_id=expense_id
      @expense_option.amount=options[i]
      @expense_option.save!


    end


  end
end


