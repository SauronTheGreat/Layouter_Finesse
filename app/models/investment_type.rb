class InvestmentType < ActiveRecord::Base
  has_many :investments,:dependent => :destroy
end
