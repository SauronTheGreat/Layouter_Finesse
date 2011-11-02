class MarketConsumerCategoriesController < ApplicationController
  # GET /market_consumer_categories
  # GET /market_consumer_categories.json
  def index
    @market_consumer_categories = MarketConsumerCategory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @market_consumer_categories }
    end
  end

  # GET /market_consumer_categories/1
  # GET /market_consumer_categories/1.json
  def show
    @market_consumer_category = MarketConsumerCategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @market_consumer_category }
    end
  end

  # GET /market_consumer_categories/new
  # GET /market_consumer_categories/new.json
  def new
    @market_consumer_category = MarketConsumerCategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @market_consumer_category }
    end
  end

  # GET /market_consumer_categories/1/edit
  def edit
    @market_consumer_category = MarketConsumerCategory.find(params[:id])
  end

  # POST /market_consumer_categories
  # POST /market_consumer_categories.json
  def create
    @market_consumer_category = MarketConsumerCategory.new(params[:market_consumer_category])

    respond_to do |format|
      if @market_consumer_category.save
        format.html { redirect_to @market_consumer_category, notice: 'Market consumer category was successfully created.' }
        format.json { render json: @market_consumer_category, status: :created, location: @market_consumer_category }
      else
        format.html { render action: "new" }
        format.json { render json: @market_consumer_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /market_consumer_categories/1
  # PUT /market_consumer_categories/1.json
  def update
    @market_consumer_category = MarketConsumerCategory.find(params[:id])

    respond_to do |format|
      if @market_consumer_category.update_attributes(params[:market_consumer_category])
        format.html { redirect_to @market_consumer_category, notice: 'Market consumer category was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @market_consumer_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /market_consumer_categories/1
  # DELETE /market_consumer_categories/1.json
  def destroy
    @market_consumer_category = MarketConsumerCategory.find(params[:id])
    @market_consumer_category.destroy

    respond_to do |format|
      format.html { redirect_to market_consumer_categories_url }
      format.json { head :ok }
    end
  end
end
