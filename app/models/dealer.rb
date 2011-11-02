class Dealer < ActiveRecord::Base

  belongs_to :market
  has_many :dealer_preferences,:dependent => :destroy

  #we have to write a method which will be invoked to create dealers for each market , when game is initiated

  #we pass the market id as an argument
  def self.create_dealers_of_world(market_id)
    @market=Market.find(market_id)

    total_consumers=@market.no_of_consumers
    a=Constant.find_by_name("a").value
    dealer_category=DealerCategory.find_by_name("National")
    n=Dealer.find_all_by_dealer_category_id(dealer_category.id).count
    #this is the number of national dealers
    l=@market.catchment_of_dealers
    #this is number of local dealers

    consumer_per_dealer=total_consumers/(a*n+l)
    #this decides number of consumers  per dealer

    @category=DealerCategory.find_by_name("Local")
    l.times do |dealer|
      #create a new dealer object as assign them properties
      @dealer=Dealer.new
      @dealer.market_id=@market.id
      @dealer.name="Local"+"#{dealer+1}"

      #now we decide how much consumer_catchment is to be given for each local dealer
      @dealer.catchment_of_consumers=consumer_per_dealer
      @dealer.dealer_category_id=@category.id
      @dealer.save!
      DealerPreference.populate_dealer_preferences(@dealer.id)

    end


  end
end
