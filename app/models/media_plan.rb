class MediaPlan < ActiveRecord::Base
  has_many :media_plan_details, :dependent => :destroy

  validates_uniqueness_of :name
  validates_presence_of :name

  before_destroy :validate_destroy

  def validate_destroy
    if self.registered_as_expense?
      @expense=Expense.find_by_source_id(self.id)
      @expense.destroy


    end

  end
end

