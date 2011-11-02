class CreateLayoutThemes < ActiveRecord::Migration
  def self.up
    create_table :layout_themes do |t|
      t.string :name
      t.integer :number
      t.timestamps
    end
  end

  def self.down
    drop_table :layout_themes
  end
end
