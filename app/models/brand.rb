class Brand < ActiveRecord::Base
  belongs_to :player
  belongs_to :simulation
end
