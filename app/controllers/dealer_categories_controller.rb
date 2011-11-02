class DealerCategoriesController < ApplicationController
  # GET /dealer_categories
  # GET /dealer_categories.json
  def index
    @dealer_categories = DealerCategory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @dealer_categories }
    end
  end

  # GET /dealer_categories/1
  # GET /dealer_categories/1.json
  def show
    @dealer_category = DealerCategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @dealer_category }
    end
  end

  # GET /dealer_categories/new
  # GET /dealer_categories/new.json
  def new
    @dealer_category = DealerCategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @dealer_category }
    end
  end

  # GET /dealer_categories/1/edit
  def edit
    @dealer_category = DealerCategory.find(params[:id])
  end

  # POST /dealer_categories
  # POST /dealer_categories.json
  def create
    @dealer_category = DealerCategory.new(params[:dealer_category])

    respond_to do |format|
      if @dealer_category.save
        format.html { redirect_to @dealer_category, notice: 'Dealer category was successfully created.' }
        format.json { render json: @dealer_category, status: :created, location: @dealer_category }
      else
        format.html { render action: "new" }
        format.json { render json: @dealer_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /dealer_categories/1
  # PUT /dealer_categories/1.json
  def update
    @dealer_category = DealerCategory.find(params[:id])

    respond_to do |format|
      if @dealer_category.update_attributes(params[:dealer_category])
        format.html { redirect_to @dealer_category, notice: 'Dealer category was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @dealer_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dealer_categories/1
  # DELETE /dealer_categories/1.json
  def destroy
    @dealer_category = DealerCategory.find(params[:id])
    @dealer_category.destroy

    respond_to do |format|
      format.html { redirect_to dealer_categories_url }
      format.json { head :ok }
    end
  end
end
