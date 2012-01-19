class Constant < ActiveRecord::Base
  #validations
  validates_uniqueness_of :name, :message => "This Constant name already exists"
  validates_presence_of :name, :message => "Please enter constant name"

  validates_presence_of :value, :message => "Please enter constant value"
  validates_numericality_of :value, :message => "Please enter valid constant value"

  validates_format_of :name, :with => /^[a-zA-Z]/,
                      :message => "Please enter a valid constant name"

end
