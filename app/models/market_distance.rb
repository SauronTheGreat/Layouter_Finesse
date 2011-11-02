class MarketDistance < ActiveRecord::Base


  # after_save :call_distance
  after_create :call_distance

  def call_distance


    @req=MarketDistance.first(:conditions => ['source_market_id = ? and target_market_id=? ', target_market_id, source_market_id])
    if @req.nil?
      MarketDistance.make_balancing_distance(target_market_id, source_market_id, distance)
    end
  end


  def self.make_balancing_distance(target_market_id, source_market_id, distance)
    @market_distance=MarketDistance.new
    @market_distance.source_market_id=target_market_id
    @market_distance.target_market_id=source_market_id
    @market_distance.distance=distance
    @market_distance.save!

  end
end
