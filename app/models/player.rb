class Player < ActiveRecord::Base
  belongs_to :game
  belongs_to :student_group
  belongs_to :simulation
  has_many :brands,:dependent => :destroy

  #this method create all players in the student group
  def self.create_players_from_student_group(simulation_id)

    @simulation=Simulation.find(simulation_id)
    @student_group=StudentGroup.find(@simulation.student_group_id)

    @student_group_users=@student_group.student_group_users
    @round=Round.find_by_simulation_id_and_number(@simulation.id, 1)
    @student_group_users.each do |sguser|
      @player=Player.new
      @player.student_group_id=@student_group.id
      @player.student_group_user_id=sguser.id
      @player.simulation_id=simulation_id
      @player.save!
      PlayerFinancial.create_financials_for_player(@round.id, @player.id)


    end


  end
end
