class Investment < ActiveRecord::Base
  belongs_to :investment_type

  validates_presence_of :name
  validates_uniqueness_of :name
  validates_numericality_of :mu
  validates_numericality_of :sigma


end
