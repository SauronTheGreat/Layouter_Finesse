class SimulationsController < ApplicationController
  # GET /simulations
  # GET /simulations.json

  before_filter :check_for_products


  def check_for_products
    if !Product.all.any?
      redirect_to root_path, :alert=>"No Product is created.Please contact your administrator"
    end
  end

  def index
    @facilitator=Facilitator.find_by_user_id(current_user.id)

    @simulations = @facilitator.simulations

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @simulations }
    end
  end

  # GET /simulations/1
  # GET /simulations/1.json
  def show
    @simulation = Simulation.find(params[:id])
    @decision_parameters=@simulation.simulation_decision_parameters
    @markets=@simulation.simulation_markets
    @facilitator=Facilitator.find_by_user_id(current_user.id)
    @student_groups=StudentGroup.all.collect { |sg| [sg.name, sg.id] }

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @simulation }
    end
  end

  # GET /simulations/new
  # GET /simulations/new.json
  def new
    @facilitator=Facilitator.find_by_user_id(current_user.id)
    @student_groups=StudentGroup.all.collect { |sg| [sg.name, sg.id] }

    @simulation = Simulation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @simulation }
    end
  end

  # GET /simulations/1/edit
  def edit
    @facilitator=Facilitator.find_by_user_id(current_user.id)
    @simulation = Simulation.find(params[:id])
  end

  # POST /simulations
  # POST /simulations.json
  def create
    @simulation = Simulation.new(params[:simulation])


    respond_to do |format|
      if @simulation.save
        #   Player.create_players_from_student_group(@simulation.id)
        format.html { redirect_to simulations_path, notice: 'Simulation was successfully created.' }
        format.json { render json: @simulation, status: :created, location: @simulation }
      else
        format.html { render action: "new" }
        format.json { render json: @simulation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /simulations/1
  # PUT /simulations/1.json
  def update
    @simulation = Simulation.find(params[:id])

    respond_to do |format|
      if @simulation.update_attributes(params[:simulation])
        format.html { redirect_to @simulation, notice: 'Simulation was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @simulation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /simulations/1
  # DELETE /simulations/1.json
  def destroy
    @simulation = Simulation.find(params[:id])
    @simulation.destroy

    respond_to do |format|
      format.html { redirect_to simulations_url }
      format.json { head :ok }
    end
  end

  def get_student_group
    @simulation=Simulation.find(params[:simulation_id])
    @student_groups=StudentGroup.all.collect { |sg| [sg.name, sg.id] }

  end

  def set_student_group
    @simulation=Simulation.find(params[:simulation_id])
    @simulation.student_group_id=params[:student_group_id]
    @simulation.save!
    redirect_to simulation_path(@simulation)
  end

  def initiate_simulation
    @simulation=Simulation.find(params[:simulation_id])
    @round=Round.find(params[:round_id])

    @active_round=ActiveRound.new
    @active_round.simulation_id=@simulation.id
    @active_round.round_id=@round.id


    @active_round.save!


    if @round.calculated==false
      @markets=@simulation.simulation_markets
      @markets.each do |market|
        Dealer.create_dealers_of_world(market.market_id, @round.id)
        #  Dealer.create_national_dealer_preferences()
        Dealer.all.each do |dealer|
          DealerPreference.populate_dealer_preferences(dealer.id)
        end
        Consumer.create_consumer_from_markets(market.market_id, @round.id)
        Vendor.create_vendors_from_market(market.market_id, @simulation.id)
      end
      #Factory.all.each do |factory|
      #  Factory.set_vendors(@simulation.id, factory.id)
      #
      #end

      SimulationMarket.all.each do |market|
        @factories=Factory.find_all_by_market_id(market.id)
        @factories.each do |factory|
          Factory.set_vendors(@simulation.id, factory.id)
        end
      end


      @simulation.initiated=true
      @simulation.save!
    end

  end


  def select_initiate_simulation
    @simulation=Simulation.find(params[:simulation_id])
    @rounds=@simulation.rounds


  end

  def initiate_round_calculation
    @simulation=Simulation.find(params[:simulation_id])
    @round=Round.find(params[:round_id])
    DealerPushIndex.destroy_all
    Player.create_brand_for_ai_player(@simulation.id, @round.id)
    Player.ai_player_decision(@simulation.id, @round.id)

    @dealers=Dealer.where('round_id=?', @round.id).each do |dealer|
      DealerPushIndex.populate_dealer_indices(dealer.id, @simulation.id)
    end


    Consumer.take_buying_decision(@simulation.id, @round.id)

    Consumer.take_final_decision(@simulation.id, @round.id)


    Player.where('last_played = ?', @round.id).each do |player|
      PlayerFinancial.calculate_player_financials(@round.id, player.id)
    end

    @active_round=ActiveRound.find_by_round_id(@round.id)
    @active_round.delete
    @round.calculated=true
    @round.save

    redirect_to root_path

  end
end
