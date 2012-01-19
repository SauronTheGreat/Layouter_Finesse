class RawMaterial < ActiveRecord::Base

  #validations
  validates_presence_of :name
  validates_presence_of :price_per_kg
  validates_numericality_of :price_per_kg
  validates_uniqueness_of :name ,:message => "Yoy have chosen the same raw material twice"


end
