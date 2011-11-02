class FacilitatorGroup < ActiveRecord::Base

  belongs_to :facilitator
  has_many :student_groups
end
