class MediaPlanDetailsController < ApplicationController
  # GET /media_plan_details
  # GET /media_plan_details.json
  def index
    @media_plan_details = MediaPlanDetail.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @media_plan_details }
    end
  end

  # GET /media_plan_details/1
  # GET /media_plan_details/1.json
  def show
    @media_plan_detail = MediaPlanDetail.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @media_plan_detail }
    end
  end

  # GET /media_plan_details/new
  # GET /media_plan_details/new.json
  def new
    @media_plan_detail = MediaPlanDetail.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @media_plan_detail }
    end
  end

  # GET /media_plan_details/1/edit
  def edit
    @media_plan_detail = MediaPlanDetail.find(params[:id])
  end

  # POST /media_plan_details
  # POST /media_plan_details.json
  def create
    @media_plan_detail = MediaPlanDetail.new(params[:media_plan_detail])

    respond_to do |format|
      if @media_plan_detail.save
        format.html{ redirect_to :controller => 'media_plans',:action=>'show',:id=>@media_plan_detail.media_plan_id}
      #  format.html { redirect_to @media_plan_detail, notice: 'Media plan detail was successfully created.' }
        format.json { render json: @media_plan_detail, status: :created, location: @media_plan_detail }
      else
        format.html { render action: "new" }
        format.json { render json: @media_plan_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /media_plan_details/1
  # PUT /media_plan_details/1.json
  def update
    @media_plan_detail = MediaPlanDetail.find(params[:id])

    respond_to do |format|
      if @media_plan_detail.update_attributes(params[:media_plan_detail])
        format.html { redirect_to @media_plan_detail, notice: 'Media plan detail was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @media_plan_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /media_plan_details/1
  # DELETE /media_plan_details/1.json
  def destroy
    @media_plan_detail = MediaPlanDetail.find(params[:id])
    @media_plan_detail.destroy

    respond_to do |format|
      format.html { redirect_to media_plan_details_url }
      format.json { head :ok }
    end
  end
end
