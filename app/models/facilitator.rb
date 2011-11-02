class Facilitator < ActiveRecord::Base

  #relationships
  belongs_to :client
  has_many :facilitator_groups,:dependent => :destroy
  has_many :case_studies,:dependent => :destroy
  has_many :simulations,:dependent => :destroy
  has_many :games,:dependent => :destroy
end
