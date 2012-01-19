class AddVisibleToRoundExpenses < ActiveRecord::Migration
  def change
    add_column :round_expenses, :visible, :boolean,:default=>true
  end
end
