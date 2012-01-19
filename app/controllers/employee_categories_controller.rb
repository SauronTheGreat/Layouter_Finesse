class EmployeeCategoriesController < ApplicationController
  # GET /employee_categories
  # GET /employee_categories.json
  def index
    @employee_categories = EmployeeCategory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @employee_categories }
    end
  end

  # GET /employee_categories/1
  # GET /employee_categories/1.json
  def show
    @employee_category = EmployeeCategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @employee_category }
    end
  end

  # GET /employee_categories/new
  # GET /employee_categories/new.json
  def new
    @employee_category = EmployeeCategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @employee_category }
    end
  end

  # GET /employee_categories/1/edit
  def edit
    @employee_category = EmployeeCategory.find(params[:id])

    render :layout => false
  end

  # POST /employee_categories
  # POST /employee_categories.json
  def create
    @employee_category = EmployeeCategory.new(params[:employee_category])

    respond_to do |format|
      if @employee_category.save
        format.html { redirect_to employee_categories_path, notice: 'Employee category was successfully created.' }
        format.json { render json: @employee_category, status: :created, location: @employee_category }
      else
        format.html { render action: "new" }
        format.json { render json: @employee_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /employee_categories/1
  # PUT /employee_categories/1.json
  def update
    @employee_category = EmployeeCategory.find(params[:id])

    respond_to do |format|
      if @employee_category.update_attributes(params[:employee_category])
        format.html { redirect_to employee_categories_path, notice: 'Employee category was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @employee_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employee_categories/1
  # DELETE /employee_categories/1.json
  def destroy
    @employee_category = EmployeeCategory.find(params[:id])
    @employee_category.destroy

    respond_to do |format|
      format.html { redirect_to employee_categories_url }
      format.json { head :ok }
    end
  end
end
