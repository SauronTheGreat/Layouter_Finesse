class Medium < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :cost
  validates_numericality_of :cost



end
