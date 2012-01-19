class InvestmentType < ActiveRecord::Base
  has_many :investments,:dependent => :destroy
   validates_presence_of :name
  validates_uniqueness_of :name
end
