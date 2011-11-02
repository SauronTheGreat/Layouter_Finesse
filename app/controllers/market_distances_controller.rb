class MarketDistancesController < ApplicationController
  # GET /market_distances
  # GET /market_distances.json
  def index
    @market_distances = MarketDistance.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @market_distances }
    end
  end

  # GET /market_distances/1
  # GET /market_distances/1.json
  def show
    @market_distance = MarketDistance.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @market_distance }
    end
  end

  # GET /market_distances/new
  # GET /market_distances/new.json
  def new
    @market=Market.find(params[:market_id])
    @count=Market.all.count-1
    #exclude the market whose distance we are setting up
    @markets=MarketDistance.find_all_by_source_market_id(@market.id)
    #list all market distances whose source is the current market
    @count=@count-@markets.count
    #exclude all those markets
    @target_markets=Array.new
    @markets.each do |market_present|
      @target_markets << market_present.target_market_id
    end
    #an array containing all present markets

    @list_of_markets=Market.all.collect { |market|
      if market!=@market and @target_markets.include?(market.id)==false then
        [market.name, market.id]
      else
        next
      end }.compact

    #list of all markets whose distance from current market is not known


    @market_distances=Array.new(@count) { MarketDistance.new }
    #@market_distance = MarketDistance.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @market_distance }
    end
  end

  # GET /market_distances/1/edit
  def edit
    @market_distance = MarketDistance.find(params[:id])
  end

  # POST /market_distances
  # POST /market_distances.json
  def create
    # @market_distance = MarketDistance.new(params[:market_distance])

    @market_distances = params[:market_distances].values.collect { |distance| MarketDistance.new(distance) }

    @market_distances.each do |md|
      md.save!
      MarketDistance.make_balancing_distance(md.target_market_id, md.source_market_id, md.distance)
    end

    respond_to do |format|
      if @market_distances.all?(&:valid?)
        format.html { redirect_to root_path }
        #format.html { redirect_to @market_distance, notice: 'Market distance was successfully created.' }
        format.json { render json: @market_distance, status: :created, location: @market_distance }
      else
        format.html { render action: "new" }
        format.json { render json: @market_distance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /market_distances/1
  # PUT /market_distances/1.json
  def update
    @market_distance = MarketDistance.find(params[:id])

    respond_to do |format|
      if @market_distance.update_attributes(params[:market_distance])
        format.html { redirect_to @market_distance, notice: 'Market distance was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @market_distance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /market_distances/1
  # DELETE /market_distances/1.json
  def destroy
    @market_distance = MarketDistance.find(params[:id])
    @market_distance.destroy

    respond_to do |format|
      format.html { redirect_to market_distances_url }
      format.json { head :ok }
    end
  end

  def view_tabular_distances
    @markets=Market.all
    @distances=Array.new
    @markets.each_with_index do |market, index|
      @distances[index]=Array.new
    MarketDistance.find_all_by_source_market_id(market.id).each do |market_distance|
      if index==market.id
      @distances[index]<<0
      else
      @distances[index] << market_distance.distance
        end
    end
      @distances[index].insert(index,0)



    end


  end
end
