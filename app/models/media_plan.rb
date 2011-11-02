class MediaPlan < ActiveRecord::Base
  has_many :media_plan_details, :dependent => :destroy
end

