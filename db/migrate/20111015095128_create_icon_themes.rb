class CreateIconThemes < ActiveRecord::Migration
  def change
    create_table :icon_themes do |t|
      t.string :name
      t.integer :number

      t.timestamps
    end
  end
end
