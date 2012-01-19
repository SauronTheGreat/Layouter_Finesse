class Dealer < ActiveRecord::Base


  #validations
  validates_presence_of :market_id
 # validates_presence_of :catchment_of_consumers
  validates_presence_of :dealer_category_id
  validates_presence_of :name

 # validates_uniqueness_of :name





  belongs_to :market
  belongs_to :dealer_category
  has_many :dealer_preferences, :dependent => :destroy
  has_many :consumers,:dependent => :destroy


  #we have to write a method which will be invoked to create dealers for each market , when game is initiated

  #we pass the market id as an argument
  def self.create_dealers_of_world(market_id,round_id)
    @market=Market.find(market_id)


    total_consumers=@market.no_of_consumers
    a=Constant.find_by_name("a").value
    dealer_category=DealerCategory.find_by_name("National")
    @category=DealerCategory.find_by_name("Local")
    @national_dealers=Dealer.find_all_by_dealer_category_id(dealer_category.id)

    n=Dealer.find_all_by_dealer_category_id(dealer_category.id).count
    #this is the number of national dealers
    l=@market.catchment_of_dealers-@national_dealers.count
    #this is number of local dealers

    consumer_per_dealer=total_consumers/(a*n+l)
    #this decides number of consumers  per dealer


    remaining_consumers=total_consumers-consumer_per_dealer*l

    @national_dealers.each_with_index do |national_dealer,index|
      @dealer=Dealer.new
      @dealer.market_id=@market.id
      @dealer.name="National"+"#{index+1}+#{@market.name}"
      @dealer.catchment_of_consumers=remaining_consumers/@national_dealers.count
      @dealer.dealer_category_id=dealer_category.id
      @dealer.round_id=round_id
      @dealer.save!



    end


    l.times do |dealer|
      #create a new dealer object as assign them properties
      @dealer=Dealer.new
      @dealer.market_id=@market.id
      @dealer.name="Local"+"#{dealer+1}+#{@market.name}"

      #now we decide how much consumer_catchment is to be given for each local dealer
      @dealer.catchment_of_consumers=consumer_per_dealer
      @dealer.dealer_category_id=@category.id
      @dealer.round_id=round_id
      @dealer.save!


    end


  end


end
