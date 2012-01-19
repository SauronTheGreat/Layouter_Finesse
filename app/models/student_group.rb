class StudentGroup < ActiveRecord::Base

  belongs_to :facilitator_group
  has_many :student_group_users, :dependent => :destroy
  has_many :players, :dependent => :destroy

  #validations

  validates_presence_of :name, :message => "name cannot be blank"
  validates_uniqueness_of :name, :message => "this name has already been taken"

  def self.create_default_group(facilitator_id)
    @facilitator_group=FacilitatorGroup.find_by_facilitator_id(facilitator_id)
    @student_group=StudentGroup.new
    @student_group.name="StudentGroup#{User.find(Facilitator.find(facilitator_id).user_id).full_name}"
    @student_group.facilitator_group_id=@facilitator_group.id
    @student_group.save!

  end

end
