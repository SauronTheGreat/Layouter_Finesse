class RoundMediaPlansController < ApplicationController
  # GET /round_media_plans
  # GET /round_media_plans.json
  def index
    @round_media_plans = RoundMediaPlan.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @round_media_plans }
    end
  end

  # GET /round_media_plans/1
  # GET /round_media_plans/1.json
  def show
    @round_media_plan = RoundMediaPlan.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @round_media_plan }
    end
  end

  # GET /round_media_plans/new
  # GET /round_media_plans/new.json
  def new
    @round_media_plan = RoundMediaPlan.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @round_media_plan }
    end
  end

  # GET /round_media_plans/1/edit
  def edit
    @round_media_plan = RoundMediaPlan.find(params[:id])
  end

  # POST /round_media_plans
  # POST /round_media_plans.json
  def create
    @round_media_plan = RoundMediaPlan.new(params[:round_media_plan])

    respond_to do |format|
      if @round_media_plan.save
        format.html { redirect_to @round_media_plan, notice: 'Round media plan was successfully created.' }
        format.json { render json: @round_media_plan, status: :created, location: @round_media_plan }
      else
        format.html { render action: "new" }
        format.json { render json: @round_media_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /round_media_plans/1
  # PUT /round_media_plans/1.json
  def update
    @round_media_plan = RoundMediaPlan.find(params[:id])

    respond_to do |format|
      if @round_media_plan.update_attributes(params[:round_media_plan])
        format.html { redirect_to @round_media_plan, notice: 'Round media plan was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @round_media_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /round_media_plans/1
  # DELETE /round_media_plans/1.json
  def destroy
    @round_media_plan = RoundMediaPlan.find(params[:id])
    @round_media_plan.destroy

    respond_to do |format|
      format.html { redirect_to round_media_plans_url }
      format.json { head :ok }
    end
  end
end
