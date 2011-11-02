class Market < ActiveRecord::Base

  has_many :dealers  ,:dependent => :destroy
  belongs_to :simulation

  before_save :populate_local_dealers
  before_update :populate_local_dealers

  #a method to create number of dealers(local) in a market based on number of consumers for that market, k and a

  def populate_local_dealers
    dealer_category=DealerCategory.find_by_name("National")

    n=Dealer.find_all_by_dealer_category_id(dealer_category.id).count
    #this is the number of national dealers
    a=Constant.find_by_name("a").value.to_i
    k=Constant.find_by_name("k").value.to_i
    #these are the constants that superadmin defines
    #let l denote number of local dealers
    l=(no_of_consumers-n*k)/k
    #simple formula to calculate dealer catchment
    self.catchment_of_dealers=l


  end


end
