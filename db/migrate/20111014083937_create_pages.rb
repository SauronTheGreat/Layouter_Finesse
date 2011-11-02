class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.string :controller_name
      t.string :action_name
      t.timestamps
    end
  end

  def self.down
    drop_table :pages
  end
end
