class MarketDistance < ActiveRecord::Base


  # after_save :call_distance
  # after_create :call_distance

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


  #north to south--3214km
  #east to west--2993km

  def self. calculate_market_distances
    MarketDistance.destroy_all
    @markets=Market.all
    @markets.each do |source_market|
      @markets.each do |target_market|
        @market_distance=MarketDistance.new
        @market_distance.source_market_id=source_market.id
        @market_distance.target_market_id=target_market.id
        @market_distance.distance=Math.sqrt((target_market.positionx-source_market.positionx)*(target_market.positionx-source_market.positionx)*3.124*3.214+(target_market.positiony-source_market.positiony)*(target_market.positiony-source_market.positiony)*2.993*2.993)
        @market_distance.save!
      end
    end
  end


  #validations
  validates_numericality_of :distance, :message => "Not a number"

end
