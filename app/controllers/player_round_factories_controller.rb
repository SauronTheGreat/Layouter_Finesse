class PlayerRoundFactoriesController < ApplicationController
  # GET /player_round_factories
  # GET /player_round_factories.json
  def index
    @player_round_factories = PlayerRoundFactory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @player_round_factories }
    end
  end

  # GET /player_round_factories/1
  # GET /player_round_factories/1.json
  def show
    @player_round_factory = PlayerRoundFactory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @player_round_factory }
    end
  end

  # GET /player_round_factories/new
  # GET /player_round_factories/new.json
  def new
    @player_round_factory = PlayerRoundFactory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @player_round_factory }
    end
  end

  # GET /player_round_factories/1/edit
  def edit
    @player_round_factory = PlayerRoundFactory.find(params[:id])
  end

  # POST /player_round_factories
  # POST /player_round_factories.json
  def create
    @player_round_factory = PlayerRoundFactory.new(params[:player_round_factory])

    respond_to do |format|
      if @player_round_factory.save
        format.html { redirect_to @player_round_factory, notice: 'Player round factory was successfully created.' }
        format.json { render json: @player_round_factory, status: :created, location: @player_round_factory }
      else
        format.html { render action: "new" }
        format.json { render json: @player_round_factory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /player_round_factories/1
  # PUT /player_round_factories/1.json
  def update
    @player_round_factory = PlayerRoundFactory.find(params[:id])

    respond_to do |format|
      if @player_round_factory.update_attributes(params[:player_round_factory])
        format.html { redirect_to @player_round_factory, notice: 'Player round factory was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @player_round_factory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /player_round_factories/1
  # DELETE /player_round_factories/1.json
  def destroy
    @player_round_factory = PlayerRoundFactory.find(params[:id])
    @player_round_factory.destroy

    respond_to do |format|
      format.html { redirect_to player_round_factories_url }
      format.json { head :ok }
    end
  end
end
