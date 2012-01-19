class MediaPlanDetail < ActiveRecord::Base
  belongs_to :media_plan

  before_save :get_amount
  def get_amount
    @media=Medium.find(media_id)
    price=@media.cost
    self.amount=price*no_of_unit
  end

end
