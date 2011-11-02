class AddInitiatedToSimulation < ActiveRecord::Migration
  def change
    add_column :simulations, :initiated, :boolean
  end
end
