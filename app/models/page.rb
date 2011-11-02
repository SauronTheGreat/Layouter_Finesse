class Page < ActiveRecord::Base
  attr_accessible :action_name,:controller_name
  has_one :page_layout, :dependent => :destroy
end
