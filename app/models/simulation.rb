class Simulation < ActiveRecord::Base
  belongs_to :facilitator
  has_many :simulation_decision_parameters, :dependent => :destroy
  has_many :simulation_markets, :dependent => :destroy
  has_many :rounds, :dependent => :destroy
  has_many :markets, :dependent => :destroy
  has_many :players, :dependent => :destroy

  after_save :create_rounds
  # a method to create specified number of rounds
  def create_rounds
    Round.create_rounds(id)


  end
end
