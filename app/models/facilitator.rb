class Facilitator < ActiveRecord::Base

  #relationships
  belongs_to :client
  has_many :facilitator_groups,:dependent => :destroy
  has_many :case_studies,:dependent => :destroy
  has_many :simulations,:dependent => :destroy
  has_many :games,:dependent => :destroy

  after_save :create_facilitator_group

  def create_facilitator_group
    FacilitatorGroup.create_my_group(self.id)
    StudentGroup.create_default_group(self.id)

  end
end


