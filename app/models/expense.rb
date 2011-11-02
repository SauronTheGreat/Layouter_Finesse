class Expense < ActiveRecord::Base
  #relationships
  has_many :expense_options
  belongs_to :expense_type


  # a class method which can be called by any class to create an expense
  def self.create_expense(type_of_expense, name, *options)
    @expense=Expense.new
    @expense.expense_type_id=type_of_expense
    @expense.name=name
    @expense.number_of_options=options.count
    @expense.save!
    ExpenseOption.create_expense_options_from_expense(@expense.id,*options)


  end
end
