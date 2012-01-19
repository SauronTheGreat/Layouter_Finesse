class ProductParameter < ActiveRecord::Base
  belongs_to :product

  #validations
  validates_presence_of :value
  validates_numericality_of :value



end
