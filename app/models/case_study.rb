class CaseStudy < ActiveRecord::Base
  belongs_to :facilitator
  validates_presence_of :name
  validates_uniqueness_of :name

end
