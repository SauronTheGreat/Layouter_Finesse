class EmployeeCategory < ActiveRecord::Base
  has_many :employees,:dependent => :destroy
end
