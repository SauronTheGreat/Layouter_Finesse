class LoanTypesController < ApplicationController
  # GET /loan_types
  # GET /loan_types.json
  def index
    @loan_types = LoanType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @loan_types }
    end
  end

  # GET /loan_types/1
  # GET /loan_types/1.json
  def show
    @loan_type = LoanType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @loan_type }
    end
  end

  # GET /loan_types/new
  # GET /loan_types/new.json
  def new
    @loan_type = LoanType.new

    render :layout => false
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @loan_type }
    end
  end

  # GET /loan_types/1/edit
  def edit
    @loan_type = LoanType.find(params[:id])
    render :layout => false
  end

  # POST /loan_types
  # POST /loan_types.json
  def create
    @loan_type = LoanType.new(params[:loan_type])

    respond_to do |format|
      if @loan_type.save
        format.html { redirect_to loan_types_path, notice: 'Loan type was successfully created.' }
        format.json { render json: @loan_type, status: :created, location: @loan_type }
      else
        format.html { render action: "new" }
        format.json { render json: @loan_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /loan_types/1
  # PUT /loan_types/1.json
  def update
    @loan_type = LoanType.find(params[:id])

    respond_to do |format|
      if @loan_type.update_attributes(params[:loan_type])
        format.html { redirect_to loan_types_path, notice: 'Loan type was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @loan_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /loan_types/1
  # DELETE /loan_types/1.json
  def destroy
    @loan_type = LoanType.find(params[:id])
    @loan_type.destroy

    respond_to do |format|
      format.html { redirect_to loan_types_url }
      format.json { head :ok }
    end
  end
end
