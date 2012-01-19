class FacilitatorGroupsController < ApplicationController
  # GET /facilitator_groups
  # GET /facilitator_groups.json
  before_filter :allow_only_facilitator
  def index
    @facilitator=Facilitator.find_by_user_id(current_user.id)

    @facilitator_groups =@facilitator.facilitator_groups

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @facilitator_groups }
    end
  end

  # GET /facilitator_groups/1
  # GET /facilitator_groups/1.json
  def show
    @facilitator_group = FacilitatorGroup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @facilitator_group }
    end
  end

  # GET /facilitator_groups/new
  # GET /facilitator_groups/new.json
  def new
    @facilitator=Facilitator.find_by_user_id(current_user.id)
    @facilitator_group = FacilitatorGroup.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @facilitator_group }
    end
  end

  # GET /facilitator_groups/1/edit
  def edit
    @facilitator=Facilitator.find_by_user_id(current_user.id)
    @facilitator_group = FacilitatorGroup.find(params[:id])
  end

  # POST /facilitator_groups
  # POST /facilitator_groups.json
  def create
    @facilitator_group = FacilitatorGroup.new(params[:facilitator_group])

    respond_to do |format|
      if @facilitator_group.save
        format.html { redirect_to @facilitator_group, notice: 'Facilitator group was successfully created.' }
        format.json { render json: @facilitator_group, status: :created, location: @facilitator_group }
      else
        format.html { render action: "new" }
        format.json { render json: @facilitator_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /facilitator_groups/1
  # PUT /facilitator_groups/1.json
  def update
    @facilitator_group = FacilitatorGroup.find(params[:id])

    respond_to do |format|
      if @facilitator_group.update_attributes(params[:facilitator_group])
        format.html { redirect_to @facilitator_group, notice: 'Facilitator group was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @facilitator_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /facilitator_groups/1
  # DELETE /facilitator_groups/1.json
  def destroy
    @facilitator_group = FacilitatorGroup.find(params[:id])
    @facilitator_group.destroy

    respond_to do |format|
      format.html { redirect_to facilitator_groups_url }
      format.json { head :ok }
    end
  end
end
