class HrincentivesController < ApplicationController
  # GET /hrincentives
  # GET /hrincentives.json
  def index
    @hrincentives = Hrincentive.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @hrincentives }
    end
  end

  # GET /hrincentives/1
  # GET /hrincentives/1.json
  def show
    @hrincentive = Hrincentive.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @hrincentive }
    end
  end

  # GET /hrincentives/new
  # GET /hrincentives/new.json
  def new
    @hrincentive = Hrincentive.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @hrincentive }
    end
  end

  # GET /hrincentives/1/edit
  def edit
    @hrincentive = Hrincentive.find(params[:id])
  end

  # POST /hrincentives
  # POST /hrincentives.json
  def create
    @hrincentive = Hrincentive.new(params[:hrincentive])

    respond_to do |format|
      if @hrincentive.save
        #@expense=Expense.new
        #@expense.name=@hrincentive.name
        #@type=ExpenseType.find_by_name("HR")
        #@expense.expense_type_id=@type.id
        #@expense.save!
        #now we redirect the admin to enter expense options
       # format.html {redirect_to edit_expense_path(@expense) }
        format.html { redirect_to @hrincentive, notice: 'Hrincentive was successfully created.' }
        format.json { render json: @hrincentive, status: :created, location: @hrincentive }
      else
        format.html { render action: "new" }
        format.json { render json: @hrincentive.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /hrincentives/1
  # PUT /hrincentives/1.json
  def update
    @hrincentive = Hrincentive.find(params[:id])

    respond_to do |format|
      if @hrincentive.update_attributes(params[:hrincentive])
        format.html { redirect_to @hrincentive, notice: 'Hrincentive was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @hrincentive.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hrincentives/1
  # DELETE /hrincentives/1.json
  def destroy
    @hrincentive = Hrincentive.find(params[:id])
    @hrincentive.destroy

    respond_to do |format|
      format.html { redirect_to hrincentives_url }
      format.json { head :ok }
    end
  end
end
