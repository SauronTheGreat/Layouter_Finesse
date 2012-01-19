class FacilitatorGroup < ActiveRecord::Base

  belongs_to :facilitator
  has_many :student_groups
  has_many :facilitator_group_users
  has_many :users ,:through => :facilitator_group_users

  #validations

  validates_presence_of :name ,:message => "name cannot be blank"
  validates_uniqueness_of :name,:message => "this name has already been taken"

  def self.create_my_group(facilitator_id)
    @facilitator=Facilitator.find(facilitator_id)
    @facilitator_group=FacilitatorGroup.new
    @facilitator_group.name=User.find(@facilitator.user_id).full_name
    @facilitator_group.facilitator_id=facilitator_id
    @facilitator_group.save!

  end

end
