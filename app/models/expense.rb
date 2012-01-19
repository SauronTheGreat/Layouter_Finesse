class Expense < ActiveRecord::Base
  #relationships
  has_many :expense_options, :dependent => :destroy
  belongs_to :expense_type

  validates_presence_of :name
  # validates_presence_of :summary
  validates_uniqueness_of :name


  accepts_nested_attributes_for :expense_options, :allow_destroy=>true


  # a class method which can be called by any class to create an expense
  def self.create_expense(type_of_expense, name, *options, source_id)
    @expense=Expense.new
    @expense.expense_type_id=type_of_expense
    @expense.name=name
    @expense.number_of_options=options.count
    @expense.source_id=source_id
    @expense.save!
    ExpenseOption.create_expense_options_from_expense(@expense.id, *options)
    return @expense


  end
end
