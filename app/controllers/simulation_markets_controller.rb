class SimulationMarketsController < ApplicationController
  # GET /simulation_markets
  # GET /simulation_markets.json
  def index

    @simulation_markets = SimulationMarket.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @simulation_markets }
    end
  end

  # GET /simulation_markets/1
  # GET /simulation_markets/1.json
  def show
    @simulation_market = SimulationMarket.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @simulation_market }
    end
  end

  # GET /simulation_markets/new
  # GET /simulation_markets/new.json
  def new
    @simulation=Simulation.find(params[:simulation_id])
    @markets=Market.all
    @simulation_markets=Array.new(Market.all.count) { SimulationMarket.new }
    @simulation_markets_ids=Array.new
    @present_markets=SimulationMarket.find_all_by_simulation_id(@simulation.id)
    @present_markets.each do |simulation_market|
      @simulation_markets_ids << simulation_market.market_id

    end

    #@simulation_market = SimulationMarket.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @simulation_market }
    end
  end

  # GET /simulation_markets/1/edit
  def edit
    @simulation_market = SimulationMarket.find(params[:id])
  end

  # POST /simulation_markets
  # POST /simulation_markets.json
  def create

    #@simulation_market = SimulationMarket.new(params[:simulation_market])
    @simulation_markets = params[:simulation_markets].values.collect { |smarket| SimulationMarket.new(smarket) }
    @markets=Market.all
    @simulation=Simulation.find(@simulation_markets[0].simulation_id)
   SimulationMarket.destroy @simulation.simulation_markets(&:id)


    @simulation_markets.each_with_index do |sm, index|
      if sm.market_id!=0
        sm.market_id=@markets[index].id
        sm.save!
      end
    end


    respond_to do |format|
      if @simulation_markets.all?(&:valid?)
        format.html { redirect_to simulation_path(Simulation.find(@simulation_markets[0].simulation_id)) }
        #format.html { redirect_to @simulation_market, notice: 'Simulation market was successfully created.' }
        format.json { render json: @simulation_market, status: :created, location: @simulation_market }
      else
        format.html { render action: "new" }
        format.json { render json: @simulation_market.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /simulation_markets/1
  # PUT /simulation_markets/1.json
  def update
    @simulation_market = SimulationMarket.find(params[:id])

    respond_to do |format|
      if @simulation_market.update_attributes(params[:simulation_market])
        format.html { redirect_to @simulation_market, notice: 'Simulation market was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @simulation_market.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /simulation_markets/1
  # DELETE /simulation_markets/1.json
  def destroy
    @simulation_market = SimulationMarket.find(params[:id])
    @simulation_market.destroy

    respond_to do |format|
      format.html { redirect_to simulation_markets_url }
      format.json { head :ok }
    end
  end
end
