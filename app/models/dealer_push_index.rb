class DealerPushIndex < ActiveRecord::Base

  #here we define a method to populate push indices for each brand for each dealer
  #This method is called during round calculation

  def self.populate_dealer_indices(dealer_id)
    #@dealer=Dealer.find(dealer_id)
    #@preferences=@dealer.dealer_preferences
    @brands=Brand.all
    @expense_type_id=ExpenseType.find_by_name("Channel").id
    # @active_round=ActiveRound.first.round_id
    if ActiveRound.first.nil?
      @active_round=1
    else
      @active_round=ActiveRound.first.round_id

    end

    @push_indices =Array.new

    @brands.each do |brand|
      push_index=0
      @dealer_push_index=DealerPushIndex.new
      @dealer_push_index.dealer_id=dealer_id
      @dealer_push_index.brand_id=brand.id
      @brand_expenses=PlayerRoundExpense.find_all_by_brand_id_and_round_id(brand.id, @active_round)
      @brand_expenses.each do |expense|
        if Expense.find(expense.expense_id).expense_type_id==@expense_type_id
          value=ExpenseOption.find(expense.expense_option_id).amount
          preferred_value=DealerPreference.find_by_dealer_id_and_expense_id(dealer_id, expense.expense_id).index
          push_index=push_index+value*preferred_value
        end
      end
      @push_indices << push_index
      @dealer_push_index.push_index_value=push_index
      @dealer_push_index.save!

    end


  end


end
