class StudentGroup < ActiveRecord::Base

  belongs_to :facilitator_group
  has_many :student_group_users,:dependent => :destroy
  has_many :players,:dependent => :destroy
end
