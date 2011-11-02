class DefaultPlayerDataController < ApplicationController
  # GET /default_player_data
  # GET /default_player_data.json
  def index
    @default_player_data = DefaultPlayerDatum.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @default_player_data }
    end
  end

  # GET /default_player_data/1
  # GET /default_player_data/1.json
  def show
    @default_player_datum = DefaultPlayerDatum.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @default_player_datum }
    end
  end

  # GET /default_player_data/new
  # GET /default_player_data/new.json
  def new
    @default_player_datum = DefaultPlayerDatum.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @default_player_datum }
    end
  end

  # GET /default_player_data/1/edit
  def edit
    @default_player_datum = DefaultPlayerDatum.find(params[:id])
  end

  # POST /default_player_data
  # POST /default_player_data.json
  def create
    @default_player_datum = DefaultPlayerDatum.new(params[:default_player_datum])

    respond_to do |format|
      if @default_player_datum.save
        format.html { redirect_to @default_player_datum, notice: 'Default player datum was successfully created.' }
        format.json { render json: @default_player_datum, status: :created, location: @default_player_datum }
      else
        format.html { render action: "new" }
        format.json { render json: @default_player_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /default_player_data/1
  # PUT /default_player_data/1.json
  def update
    @default_player_datum = DefaultPlayerDatum.find(params[:id])

    respond_to do |format|
      if @default_player_datum.update_attributes(params[:default_player_datum])
        format.html { redirect_to @default_player_datum, notice: 'Default player datum was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @default_player_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /default_player_data/1
  # DELETE /default_player_data/1.json
  def destroy
    @default_player_datum = DefaultPlayerDatum.find(params[:id])
    @default_player_datum.destroy

    respond_to do |format|
      format.html { redirect_to default_player_data_url }
      format.json { head :ok }
    end
  end
end
