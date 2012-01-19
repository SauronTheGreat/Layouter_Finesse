class Loan < ActiveRecord::Base
  belongs_to :loan_type
   validates_presence_of :name
  validates_uniqueness_of :name
end
