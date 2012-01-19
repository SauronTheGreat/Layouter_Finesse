class ConsumerCategoriesController < ApplicationController
  # GET /consumer_categories
  # GET /consumer_categories.json
  def index
    @consumer_categories = ConsumerCategory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @consumer_categories }
    end
  end

  # GET /consumer_categories/1
  # GET /consumer_categories/1.json
  def show
    @consumer_category = ConsumerCategory.find(params[:id])


    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @consumer_category }
    end
  end

  # GET /consumer_categories/new
  # GET /consumer_categories/new.json
  def new
    @consumer_category = ConsumerCategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @consumer_category }
    end
  end

  # GET /consumer_categories/1/edit
  def edit
    @consumer_category = ConsumerCategory.find(params[:id])
    render :layout => false
  end

  # POST /consumer_categories
  # POST /consumer_categories.json
  def create
    @consumer_category = ConsumerCategory.new(params[:consumer_category])

    respond_to do |format|
      if @consumer_category.save
        format.html { redirect_to @consumer_category, notice: 'Consumer category was successfully created.' }
        format.json { render json: @consumer_category, status: :created, location: @consumer_category }
      else
        format.html { render action: "new" }
        format.json { render json: @consumer_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /consumer_categories/1
  # PUT /consumer_categories/1.json
  def update
    @consumer_category = ConsumerCategory.find(params[:id])

    respond_to do |format|
      if @consumer_category.update_attributes(params[:consumer_category])
        format.html { redirect_to @consumer_category, notice: 'Consumer category was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @consumer_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /consumer_categories/1
  # DELETE /consumer_categories/1.json
  def destroy
    @consumer_category = ConsumerCategory.find(params[:id])
    @consumer_category.destroy

    respond_to do |format|
      format.html { redirect_to consumer_categories_url }
      format.json { head :ok }
    end
  end
end
