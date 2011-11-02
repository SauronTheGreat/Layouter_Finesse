class LayoutTheme < ActiveRecord::Base
  attr_accessible :name, :number
  has_one :page_layout, :dependent=>:destroy
end
