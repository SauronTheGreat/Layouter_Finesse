class Round < ActiveRecord::Base

  belongs_to :simulation
  has_many :round_expenses, :dependent => :destroy
  has_many :round_environmental_parameters, :dependent => :destroy
  has_many :round_investments, :dependent => :destroy
  has_many :round_loans,:dependent => :destroy
  has_many :round_media_plans,:dependent => :destroy

  #this method creates the number of rounds, specified in the simulation
  def self.create_rounds(simulation_id)
    @simulation=Simulation.find(simulation_id)
    @simulation.max_rounds.times do |round|
      @round=Round.new
      @round.simulation_id=@simulation.id
      @round.number=round+1
      @round.save!
    end


  end

end
