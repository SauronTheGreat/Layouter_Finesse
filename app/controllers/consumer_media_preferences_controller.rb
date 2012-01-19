class ConsumerMediaPreferencesController < ApplicationController
  # GET /consumer_media_preferences
  # GET /consumer_media_preferences.json
  def index
    @consumer_media_preferences = ConsumerMediaPreference.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @consumer_media_preferences }
    end
  end

  # GET /consumer_media_preferences/1
  # GET /consumer_media_preferences/1.json
  def show
    @consumer_media_preference = ConsumerMediaPreference.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @consumer_media_preference }
    end
  end

  # GET /consumer_media_preferences/new
  # GET /consumer_media_preferences/new.json
  def new
    @consumer_media_preference = ConsumerMediaPreference.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @consumer_media_preference }
    end
  end

  # GET /consumer_media_preferences/1/edit
  def edit
    @consumer_media_preference = ConsumerMediaPreference.find(params[:id])
  end

  # POST /consumer_media_preferences
  # POST /consumer_media_preferences.json
  def create
    @consumer_media_preference = ConsumerMediaPreference.new(params[:consumer_media_preference])

    respond_to do |format|
      if @consumer_media_preference.save
        format.html { redirect_to @consumer_media_preference, notice: 'Consumer media preference was successfully created.' }
        format.json { render json: @consumer_media_preference, status: :created, location: @consumer_media_preference }
      else
        format.html { render action: "new" }
        format.json { render json: @consumer_media_preference.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /consumer_media_preferences/1
  # PUT /consumer_media_preferences/1.json
  def update
    @consumer_media_preference = ConsumerMediaPreference.find(params[:id])

    respond_to do |format|
      if @consumer_media_preference.update_attributes(params[:consumer_media_preference])
        format.html { redirect_to @consumer_media_preference, notice: 'Consumer media preference was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @consumer_media_preference.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /consumer_media_preferences/1
  # DELETE /consumer_media_preferences/1.json
  def destroy
    @consumer_media_preference = ConsumerMediaPreference.find(params[:id])
    @consumer_media_preference.destroy

    respond_to do |format|
      format.html { redirect_to consumer_media_preferences_url }
      format.json { head :ok }
    end
  end
end
