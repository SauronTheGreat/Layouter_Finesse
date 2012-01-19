class DealerPushIndicesController < ApplicationController
  # GET /dealer_push_indices
  # GET /dealer_push_indices.json
  def index
    @dealer_push_indices = DealerPushIndex.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @dealer_push_indices }
    end
  end

  # GET /dealer_push_indices/1
  # GET /dealer_push_indices/1.json
  def show
    @dealer_push_index = DealerPushIndex.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @dealer_push_index }
    end
  end

  # GET /dealer_push_indices/new
  # GET /dealer_push_indices/new.json
  def new
    @dealer_push_index = DealerPushIndex.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @dealer_push_index }
    end
  end

  # GET /dealer_push_indices/1/edit
  def edit
    @dealer_push_index = DealerPushIndex.find(params[:id])
  end

  # POST /dealer_push_indices
  # POST /dealer_push_indices.json
  def create
    @dealer_push_index = DealerPushIndex.new(params[:dealer_push_index])

    respond_to do |format|
      if @dealer_push_index.save
        format.html { redirect_to @dealer_push_index, notice: 'Dealer push index was successfully created.' }
        format.json { render json: @dealer_push_index, status: :created, location: @dealer_push_index }
      else
        format.html { render action: "new" }
        format.json { render json: @dealer_push_index.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /dealer_push_indices/1
  # PUT /dealer_push_indices/1.json
  def update
    @dealer_push_index = DealerPushIndex.find(params[:id])

    respond_to do |format|
      if @dealer_push_index.update_attributes(params[:dealer_push_index])
        format.html { redirect_to @dealer_push_index, notice: 'Dealer push index was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @dealer_push_index.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dealer_push_indices/1
  # DELETE /dealer_push_indices/1.json
  def destroy
    @dealer_push_index = DealerPushIndex.find(params[:id])
    @dealer_push_index.destroy

    respond_to do |format|
      format.html { redirect_to dealer_push_indices_url }
      format.json { head :ok }
    end
  end
end
