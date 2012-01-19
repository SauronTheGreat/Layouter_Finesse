class RoundInvestmentsController < ApplicationController
  # GET /round_investments
  # GET /round_investments.json
  def index
    @round_investments = RoundInvestment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @round_investments }
    end
  end

  # GET /round_investments/1
  # GET /round_investments/1.json
  def show
    @round_investment = RoundInvestment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @round_investment }
    end
  end

  # GET /round_investments/new
  # GET /round_investments/new.json
  def new
    @round=Round.find(params[:round_id])
    @round_investment = RoundInvestment.new
    @included_investments=@round.round_investments
    @included_investment_ids=Array.new
    @included_investments.each do |investment|
      @included_investment_ids << investment.investment_id
    end


    @investment_list=Investment.all.collect{|investment| if @included_investment_ids.include?(investment.id)==false then [investment.name,investment.id] end}.compact

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @round_investment }
    end
  end

  # GET /round_investments/1/edit
  def edit
    @round_investment = RoundInvestment.find(params[:id])
  end

  # POST /round_investments
  # POST /round_investments.json
  def create
    @round_investment = RoundInvestment.new(params[:round_investment])

    respond_to do |format|
      if @round_investment.save
        format.html{redirect_to new_round_investment_path(:round_id=>@round_investment.round_id)}
       # format.html { redirect_to @round_investment, notice: 'Round investment was successfully created.' }
        format.json { render json: @round_investment, status: :created, location: @round_investment }
      else
        format.html { render action: "new" }
        format.json { render json: @round_investment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /round_investments/1
  # PUT /round_investments/1.json
  def update
    @round_investment = RoundInvestment.find(params[:id])

    respond_to do |format|
      if @round_investment.update_attributes(params[:round_investment])
        format.html { redirect_to @round_investment, notice: 'Round investment was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @round_investment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /round_investments/1
  # DELETE /round_investments/1.json
  def destroy
    @round_investment = RoundInvestment.find(params[:id])
    @round_investment.destroy

    respond_to do |format|
      format.html { redirect_to round_investments_url }
      format.json { head :ok }
    end
  end
end
