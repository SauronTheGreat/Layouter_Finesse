class DealerPreference < ActiveRecord::Base
  belongs_to :dealer


  #here we create a method to populate preferences of each dealer

  def self.populate_dealer_preferences(dealer_id)

    @expenses_category=ExpenseType.find_by_name("Channel")
    @expenses=@expenses_category.expenses
    @expense_ids=Array.new
    @expenses.each do |expense|
      @expense_ids << expense.id
    end

    @expense_ids.shuffle!
    n=100
    x=0
    total=0
    @expense_ids.each_with_index do |id, index|


      @dealer_preference=DealerPreference.new
      @dealer_preference.dealer_id=dealer_id
      @dealer_preference.expense_id=id
      if index == @expense_ids.count-1
        @dealer_preference.index=n-total
      else
        @dealer_preference.index=rand(n-total)
      end
      @dealer_preference.save!
      total=total+@dealer_preference.index


    end


  end


end
