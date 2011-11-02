class Consumer < ActiveRecord::Base


  #we will create a a method to create consumers based on dealers
  #This method will have an argument as market id

  def self.create_consumers_from_dealers(market_id)
    #first step is to find market
    @market=Market.find(market_id)
    #then find all the dealers in that market
    @dealers=@market.dealers

    #for all dealers generate all consumers
    @dealers.each do |dealer|
      #each consumer of each dealer
      dealer.catchment_of_consumers.times do |consumer|
        @consumer=Consumer.new
        #now we generate random number to assign a consumer category for each consumer
        #currently we use a random number
        min=ConsumerCategory.first.id
        max=ConsumerCategory.last.id
        category_id=ConsumerCategory.all.to_a.shuffle!.first.id
        @consumer.consumer_category_id=category_id
        #we thus assign category to each consumer
        @consumer.dealer_id=dealer.id
        #we assign dealer id as current dealer to the consumer

        #we now assign probability of purchase to each  consumer
        #this depends upon consumercategory and decision parameters
        #we define below a case where we use only consumercategory

        case @consumer.consumer_category_id
          when 1
            @consumer.probability_of_purchase=60+rand(20) #range 60-80
          when 2
            @consumer.probability_of_purchase=40+rand(20) #range 40-60
          when 3
            @consumer.probability_of_purchase=20+rand(20) #range 20-40
          else
            @consumer.probability_of_purchase=80+rand(20) #range 80-100


        end

        #we now decide on final decision of the consumer
        a_random_number=rand(100)
        if a_random_number < @consumer.probability_of_purchase
          @consumer.final_decision=true
        else
          @consumer.final_decision=false
        end


        @consumer_category=ConsumerCategory.find(category_id)
        r=Random.new

        @consumer.personal_taste_index=r.rand(@consumer_category.personal_taste_range)
        @consumer.price_index=r.rand(@consumer_category.price_range)
        @consumer.dealer_push_index=r.rand(@consumer_category.dealer_push_range)
        @consumer.media_push_index=r.rand(@consumer_category.media_push_range)

        @consumer.save!
        #we finally save the consumer
      end

    end


  end


  def self.take_final_decision(consumer_id)
    #first find the consumer whose decision has to be modelled
    @consumer=Consumer.find(consumer_id)
    #find the dealer which the consumer belongs to
    @dealer=Dealer.find(@consumer.dealer_id)
    #find all brands
    @brands=Brand.all

    #to take a final decision , we will calculate a score for all the brands and the consumer will buy the brand whose score is highest

    #@dealer_score=Array.new
    #@price_score=Array.new
    #@media_score=Array.new
    @final_score=Array.new

    #now lets calculate score for each brand
    @brands.each do |brand|
      #first get the dealer score:
      @dealer_score = DealerPushIndex.find_by_brand_id_and_dealer_id(brand.id, @dealer.id).push_index_value
      #now the price score
      @price_score = brand.price_per_unit

      #now the media score
      #media is a type of expense and options are "yes" and "no"...so if expense_option_id==1 then its "yes" else its "no"
      @player_media_plans_for_this_round=PlayerRoundExpense.find_all_by_brand_id(brand.id)
      @media_type_expense=ExpenseType.find_by_name("Media")
      total_media=0
      @player_media_plans_for_this_round.each do |expense|
        if Expense.find(expense.expense_id).expense_type_id==@media_type_expense.id
          total_media=total_media+ExpenseOption.find(expense_option_id).amount
        end
      end
      @media_score = total_media

      #now we calculate final score and decide the brand which consumer will buy finally
      @final_score << @consumer.price_index*@price_score+@consumer.media_push_index*@media_score+@consumer.dealer_push_index*@dealer_score


    end

    @selected_brand_index=@final_score.index(@final_score.max)


#now if the weight-age of personal taste for a consumer is higher than sum of others,, then consumer will follow his/her heart else other factors come into the picture
    if (@consumer.personal_taste_index > 25)
      #the case when personal taste is higher than everything...
      x=rand(@brands.count)
      @selected_brand=Brand.find(@brands[x])

    else
      @selected_brand=Brand.find(@brands[@selected_brand_index])

    end
    @consumer.brand_id=@selected_brand.id
    @consumer.save!

  end

end
