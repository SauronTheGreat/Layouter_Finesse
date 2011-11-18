class Player < ActiveRecord::Base
  belongs_to :game
  belongs_to :student_group
  belongs_to :simulation
  has_many :brands, :dependent => :destroy

  #this method create all players in the student group
  def self.create_players_from_student_group(simulation_id)

    @simulation=Simulation.find(simulation_id)
    @student_group=StudentGroup.find(@simulation.student_group_id)

    @student_group_users=@student_group.student_group_users
    @round=Round.find_by_simulation_id_and_number(@simulation.id, 0)
    @student_group_users.each do |sguser|
      @player=Player.new
      @player.student_group_id=@student_group.id
      @player.student_group_user_id=sguser.id
      @player.simulation_id=simulation_id
      @player.save!
      PlayerFinancial.create_financials_for_player(@round.id, @player.id)


    end

    #now we create the AI players
    4.times do |i|
      @player=Player.new
      @player.student_group_id=1000
      @player.student_group_user_id=1000
      @player.simulation_id=simulation_id
      @player.save!
      PlayerFinancial.create_financials_for_player(@round.id, @player.id)

    end


  end

  def self.create_brand_for_ai_player(simulation_id, round_id)

    @round=Round.find(round_id)
    @ai_players=Player.find_all_by_student_group_id_and_simulation_id(1000, simulation_id)


    @ai_players.each do |ai_player|
      #@prev_ai_players_brands=Brand.find_all_by_player_id(ai_player.id)
      #@prev_ai_players_brands.destroy_all
      Brand.destroy_all(["player_id=?", ai_player.id])

      @brand=Brand.new
      @brand.player_id=ai_player.id
      @brand.name="Brand_#{ai_player.id}"
      @brand.price_per_unit=1000
      @brand.save!

    end


  end

  def self.ai_player_decision(simulation_id, round_id)
    @round=Round.find(round_id)
    @ai_players=Player.find_all_by_student_group_id_and_simulation_id(1000, simulation_id)


    @ai_players.each do |ai_player|
      @my_brands=Brand.find_all_by_player_id(ai_player.id)

      @expenses=RoundExpense.find_all_by_round_id(round_id)
      @expenses.each do |expense|
        if expense.visible?
          @options=Expense.find(expense.expense_id).expense_options
          x=rand(@options.size)
          @player_round_expense=PlayerRoundExpense.new
          @player_round_expense.player_id=ai_player.id
          @player_round_expense.round_id=@round.id
          @player_round_expense.expense_id=expense.expense_id
          @player_round_expense.expense_option_id=@options[x].id
          @player_round_expense.brand_id=@my_brands[rand(@my_brands.size)].id
          @player_round_expense.save!
        end
      end

    end

  end
end
