class DealerCategory < ActiveRecord::Base
  has_many :dealers,:dependent => :destroy

  validates_presence_of :name
  validates_uniqueness_of :name
end
