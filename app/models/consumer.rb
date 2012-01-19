class Consumer < ActiveRecord::Base

  belongs_to :consumer_category
  belongs_to :dealer


  #validations

  validates_presence_of :consumer_category_id
  validates_presence_of :personal_taste_index
  validates_presence_of :media_push_index
  validates_presence_of :round_id


  validates_presence_of :price_index
  validates_presence_of :dealer_push_index
  validates_presence_of :dealer_id


# attr_accessible :dealer_id

#we will create a a method to create consumers based on dealers
#This method will have an argument as market id

#
#def self.create_consumers_from_dealers(market_id)
#  #first step is to find market
#  @market=Market.find(market_id)
#  #then find all the dealers in that market
#  @dealers=@market.dealers
#
#
#  #for all dealers generate all consumers
#  @dealers.each do |dealer|
#    #each consumer of each dealer
#    dealer.catchment_of_consumers.times do |i|
#      @consumer=Consumer.new
#      #now we generate random number to assign a consumer category for each consumer
#      #currently we use a random number
#      min=ConsumerCategory.first.id
#      max=ConsumerCategory.last.id
#      category_id=ConsumerCategory.all.to_a.shuffle!.first.id
#      @consumer.consumer_category_id=category_id
#      #we thus assign category to each consumer
#      @consumer.dealer_id=dealer.id
#      #we assign dealer id as current dealer to the consumer
#
#      #we now assign probability of purchase to each  consumer
#      #this depends upon consumercategory and decision parameters
#      #we define below a case where we use only consumercategory
#
#      case @consumer.consumer_category_id
#        when 1
#          @consumer.probability_of_purchase=60+rand(20) #range 60-80
#        when 2
#          @consumer.probability_of_purchase=40+rand(20) #range 40-60
#        when 3
#          @consumer.probability_of_purchase=20+rand(20) #range 20-40
#        else
#          @consumer.probability_of_purchase=80+rand(20) #range 80-100
#
#
#      end
#
#      #we now decide on final decision of the consumer
#      a_random_number=rand(100)
#      if a_random_number < @consumer.probability_of_purchase
#        @consumer.final_decision=true
#      else
#        @consumer.final_decision=false
#      end
#
#
#      @consumer_category=ConsumerCategory.find(category_id)
#      r=Random.new
#
#      @consumer.personal_taste_index=r.rand(@consumer_category.personal_taste_range)
#      @consumer.price_index=r.rand(@consumer_category.price_range)
#      @consumer.dealer_push_index=r.rand(@consumer_category.dealer_push_range)
#      @consumer.media_push_index=r.rand(@consumer_category.media_push_range)
#      @consumer.disposable_salary=r.rand(@consumer_category.disposable_salary_range)
#      @consumer.save!
#      #we finally save the consumer
#    end
#
#  end
#
#
#end


#this method creates consumers from the market
#it is called when we initiate the simulation
  def self.create_consumer_from_markets(market_id, round_id)
    @market=Market.find(market_id)

    total_consumers=@market.no_of_consumers
    #find total consumers from the market
    @market_demographics=@market.market_demographics
    @dealers=@market.dealers.where('round_id=?', round_id)
    #get all the dealers....all dealers will get the catchment_of_consumers number of consumers

    #@dealers_consumers=Array.new
    #@dealers.each_with_index do |dealer, index|
    #  # @dealers_consumers[index]=Array.new
    #  #@dealers_consumers[dealer.id]=dealer.catchment_of_consumers
    #  @dealers_consumers << dealer.id
    #end
    #@dealers_consumers.collect!{|x| if x.nil? then  0 else x end}

    #
    #@dealers_consumers.each do |dealer|
    #  @dealer=Dealer.find(dealer)
    #  @dealer.catchment_of_consumers.times do |i|
    #    @consumer=Consumer.new
    #    min=ConsumerCategory.first.id
    #    max=ConsumerCategory.last.id
    #    category_id=ConsumerCategory.all.to_a.shuffle!.first.id
    #    @consumer.consumer_category_id=category_id
    #    @consumer_category=ConsumerCategory.find(category_id)
    #    #@consumer.consumer_category_id=@consumer_category.id
    #    r=Random.new
    #
    #    #this populates data from consumer category
    #    @consumer.personal_taste_index=r.rand(@consumer_category.personal_taste_range)
    #    @consumer.price_index=r.rand(@consumer_category.price_range)
    #    @consumer.dealer_push_index=r.rand(@consumer_category.dealer_push_range)
    #    @consumer.media_push_index=r.rand(@consumer_category.media_push_range)
    #    @consumer.disposable_salary=r.rand(@consumer_category.disposable_salary_range)
    #
    #    @consumer.save!
    #
    #
    #  end
    #
    #
    #end


    @market_demographics.each do |category|
      #this indicates the proportion of each consumer category in the market
      proportion=total_consumers*category.proportion/100
      proportion.times do |i|
        @consumer=Consumer.new

        @consumer_category=ConsumerCategory.find(category.consumer_category_id)
        @consumer.consumer_category_id=@consumer_category.id
        r=Random.new

        #this populates data from consumer category
        @consumer.personal_taste_index=r.rand(@consumer_category.personal_taste_range)
        @consumer.price_index=r.rand(@consumer_category.price_range)
        @consumer.dealer_push_index=r.rand(@consumer_category.dealer_push_range)
        @consumer.media_push_index=r.rand(@consumer_category.media_push_range)
        @consumer.disposable_salary=r.rand(@consumer_category.disposable_salary_range)
        @consumer.round_id=round_id

        #now lets decide the dealer for this consumer

        #r=rand(@dealers_consumers.size)
        #@dealers_consumers.size.times do
        #  if @dealers_consumers[r].last>0
        #    @consumer.dealer_id=@dealers_consumers[r].index(@dealers_consumers[r].last)
        #    @dealers_consumers[r][@consumer.dealer_id]=@dealers_consumers[r][@consumer.dealer_id]-1
        #    break
        #  else
        #    r=rand(@dealers_consumers.size)
        #    next
        #
        #  end
        #end

        #now dealer is done

        @consumer.dealer_id=0
        #rest attributes will have to be done later
        @consumer.save!


      end

    end


    @dealers.each do |dealer|
      Consumer.where(['dealer_id = ? ', 0]).limit(dealer.catchment_of_consumers).update_all(:dealer_id=>dealer.id)

    end


  end


  #this method helps us to decide whether consumer wil buy or not...
  #it is called when we initiate round results
  def self.take_buying_decision(simulation_id, round_id)
    #carry this out for all consumers


    #we select brand with least price
    @simulation=Simulation.find(simulation_id)
    @product=Product.find(@simulation.product_id)
    @players=@simulation.players.where('last_played > ?', 0)
    @brands=Array.new
    @players.each do |player|
      @brands << player.brands
    end


#    @brands.collect!{|a| a[0].class}
    @brands.sort! { |a, b| a[0].price_per_unit <=> b[0].price_per_unit }

    @markets=@simulation.simulation_markets
    @dealers=Array.new
    @markets.each do |market|
      @dealers<< Market.find(market.market_id).dealers.where('round_id=?', round_id)

    end


    @consumers=Array.new
    @dealers.each do |dealer|
      @consumers << dealer[0].consumers
    end
    @consumers.flatten!


    # @brands=@brands.sort_by(&:price_per_unit)
    @consumers.each do |consumer|

      #disposable income are onbtained from the particular consumer
      disposable_income=consumer.disposable_salary
      @consumer_category=ConsumerCategory.find(consumer.consumer_category_id)
      @mentality=Mentality.find(@consumer_category.mentality_id)
      @mentality_rankings=@mentality.mentality_rankings.sort_by(&:index)
      #these are the preferences of spendings for that consumer

      #we find the simulation we are working...
      r=Random.new

      @mentality_rankings.each do |mentality_ranking|

        if (@product.mentality_parameter_id==mentality_ranking.mentality_parameter_id)
          if disposable_income > @brands[0][0].price_per_unit
            @decision=1
          else
            @decision=0
          end
          break
        end

        if mentality_ranking.range_value.class==Fixnum
          disposable_income=disposable_income-mentality_ranking.range_value
        else
          disposable_income=disposable_income-(disposable_income*r.rand(mentality_ranking.range_value))

        end


      end

      if @decision==1
        if (@product.mentality_parameter_id==1 or @product.mentality_parameter_id==2 or @product.mentality_parameter_id==3)

          consumer.probability_of_purchase=100
          consumer.save!
        elsif (@product.mentality_parameter_id==4 or @product.mentality_parameter_id==5 or @product.mentality_parameter_id==6)
          consumer.probability_of_purchase=75
        else
          consumer.probability_of_purchase=50
        end


      else
        consumer.probability_of_purchase=0
        consumer.final_decision=0
      end
      if rand(100)<consumer.probability_of_purchase
        consumer.final_decision=1
      else
        consumer.final_decision=0

      end

      consumer.save!
    end
  end


  #in this method, the consumer actually takes the decision of what brand to buy
  def self.take_final_decision(simulation_id, round_id)
    #first find simulation under the scanner...
    @simulation=Simulation.find(simulation_id)
    @players=@simulation.players

    #first find the consumer whose decision has to be modelled

    @markets=@simulation.simulation_markets
    @dealers=Array.new

    @markets.each do |market|
      @dealers<<Market.find(market.market_id).dealers.where('round_id=?', round_id)

    end

    @consumers=Array.new

    @dealers.each_with_index do |dealer|
      dealer.each do |d|
        @consumers << d.consumers

      end
    end
    @consumers.flatten!


    @final_brands=Array.new
    @consumers.each do |consumer|

      if consumer.final_decision==1

        #  @consumer=Consumer.find(consumer_id)
        #find the dealer which the consumer belongs to
        @dealer=Dealer.find(consumer.dealer_id)
        #find all brands belonging to the current simulation

        @final_score=Array.new

        #now lets calculate score for each brand
        @players.each do |player|

          @brands=player.brands
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
                total_media=total_media+ExpenseOption.find(expense.expense_option_id).amount
              end
            end
            @media_score = total_media

            #now we calculate final score and decide the brand which consumer will buy finally
            @final_score[brand.id] = consumer.price_index*@price_score+consumer.media_push_index*@media_score+consumer.dealer_push_index*@dealer_score
            @final_brands<<@brands
          end
        end


        @final_score.collect! { |x|
          if x.nil? then
            x=0
          else
            x
          end }

        @selected_brand_index=@final_score.index(@final_score.max)


#

        @brands=@final_brands


#now if the weight-age of personal taste for a consumer is higher than sum of others,, then consumer will follow his/her heart else other factors come into the picture
        if (consumer.personal_taste_index > 25)
          #the case when personal taste is higher than everything...
          x=rand(@brands.count)

          @selected_brand=Brand.find(@brands[x])[0].id

        else
          @selected_brand=Brand.find(@selected_brand_index).id

        end
        #if @selected_brand[0].nil?
        #
        #  return @selected_brand[0]
        #end


        consumer.brand_id=@selected_brand

        consumer.no_of_units=rand(100)
        consumer.save!

      end

    end
  end
end


