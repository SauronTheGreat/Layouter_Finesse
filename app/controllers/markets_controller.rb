class MarketsController < ApplicationController
  # GET /markets
  # GET /markets.json

  before_filter :allow_only_superadmin, :except => 'show'
  layout nil

  #layout 'application',:except => ['edit','new']


  def index
    @markets = Market.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @markets }
    end
  end

  # GET /markets/1
  # GET /markets/1.json
  def show
    @market = Market.find(params[:id])


    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @market.to_json }
    end
  end

  # GET /markets/new
  # GET /markets/new.json
  def new

    @market = Market.new


    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @market }
    end
  end

  # GET /markets/1/edit
  def edit
    @market = Market.find(params[:id])
  end

  # POST /markets
  # POST /markets.json
  def create

    @market = Market.new(params[:market])

    respond_to do |format|
      if @market.save
        #  format.html { redirect_to @market, notice: 'Market was successfully created.' }
        format.html { redirect_to view_map_path, notice: 'Market was successfully created.' }

        format.json { render json: @market, status: :created, location: @market }
      else
        format.html { render action: "new" }
        format.json { render json: @market.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /markets/1
  # PUT /markets/1.json
  def update
    @market = Market.find(params[:id])

    respond_to do |format|
      if @market.update_attributes(params[:market])
        # format.html { redirect_to @market, notice: 'Market was successfully updated.' }
        format.html { redirect_to view_map_path, notice: 'Market was successfully created.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @market.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /markets/1
  # DELETE /markets/1.json
  def destroy
    @market = Market.find(params[:id])
    @market_from_distances=MarketDistance.find_all_by_source_market_id(@market.id)
    @market_to_distances=MarketDistance.find_all_by_target_market_id(@market.id)
    MarketDistance.destroy_all(['source_market_id=?', @market.id])
    MarketDistance.destroy_all(['target_market_id=?', @market.id])


    #@market_from_distances.delete_all
    #@market_to_distances.delete_all


    @market.destroy

    respond_to do |format|
      format.html { redirect_to markets_url }
      format.json { head :ok }
    end
  end

  def view_distances
    @market=Market.find(params[:market_id])
    @market_distances=MarketDistance.find_all_by_source_market_id(params[:market_id])
  end

  def view_maps

    if params[:market_id].nil?
      @market=Market.new
    else

      @market=Market.find(params[:market_id])
    end
    @markets=Market.all
    render :layout => 'general_layout'


  end

  def set_location
    @market=Market.find(params[:market_id])
    @market.positionx=params[:positionx]
    @market.positiony=params[:positiony]
    if @market.save!
      redirect_to markets_path
    end


  end

end
