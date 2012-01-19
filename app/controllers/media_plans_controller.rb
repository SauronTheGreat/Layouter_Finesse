class MediaPlansController < ApplicationController
  # GET /media_plans
  # GET /media_plans.json
  def index
    @media_plans = MediaPlan.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @media_plans }
    end
  end

  # GET /media_plans/1
  # GET /media_plans/1.json
  def show
    @media_plan = MediaPlan.find(params[:id])
    @media_plan_detail=MediaPlanDetail.new
    @included_media=@media_plan.media_plan_details
    @included_media_ids=Array.new
    @included_media.each do |media|
      @included_media_ids << media.media_id
    end

    @media_list=Medium.all.collect { |media|
      if @included_media_ids.include?(media.id)==false then
        [media.name, media.id]
      end }.compact

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @media_plan }
    end
  end

  # GET /media_plans/new
  # GET /media_plans/new.json
  def new
    @media_plan = MediaPlan.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @media_plan }
    end
  end

  # GET /media_plans/1/edit
  def edit
    @media_plan = MediaPlan.find(params[:id])
    render :layout => false
  end

  # POST /media_plans
  # POST /media_plans.json
  def create
    @media_plan = MediaPlan.new(params[:media_plan])

    respond_to do |format|
      if @media_plan.save
        format.html { redirect_to media_plans_path, notice: 'Media plan was successfully created.' }
        format.json { render json: @media_plan, status: :created, location: @media_plan }
      else
        format.html { render action: "new" }
        format.json { render json: @media_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /media_plans/1
  # PUT /media_plans/1.json
  def update
    @media_plan = MediaPlan.find(params[:id])

    respond_to do |format|
      if @media_plan.update_attributes(params[:media_plan])
        format.html { redirect_to @media_plan, notice: 'Media plan was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @media_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /media_plans/1
  # DELETE /media_plans/1.json
  def destroy
    @media_plan = MediaPlan.find(params[:id])
    @media_plan.destroy

    respond_to do |format|
      format.html { redirect_to media_plans_path }
      format.json { head :ok }
    end
  end

  def finalize_media_plan

    @media_plan=MediaPlan.find(params[:media_plan_id])
    redirect_to media_plans_path

  end

  def remove_media_plan_detail
    @media_detail=MediaPlanDetail.find(params[:detail_id])
    @media_plan=MediaPlan.find(@media_detail.media_plan_id)
    if @media_detail.destroy
      redirect_to @media_plan, :notice => "Action successfully performed "
    else
      redirect_to @media_plan, :notice => "Action not performed "
    end
  end

  def register_as_expense

    @media_plan=MediaPlan.find(params["media_plan_id"])
    @media_plan.registered_as_expense=true
    @media_plan.save!
    @expense_type=ExpenseType.find_by_name("Media")
    @details=@media_plan.media_plan_details
    @expense=Expense.create_expense(@expense_type.id, @media_plan.name, 0, @details.sum("amount"), @media_plan.id)

    @expense.summary=params["summary"]
    @expense.save!
    redirect_to root_path

  end

end
