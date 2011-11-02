class LoanType < ActiveRecord::Base
  has_many :loans,:dependent => :destroy
end
