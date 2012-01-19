class CreatePageLayouts < ActiveRecord::Migration
  def self.up
    create_table :page_layouts do |t|
      t.integer :page_id
      t.integer :layout_theme_id
      t.integer :font_theme_id
      t.string :font_weight
      t.integer :font_size
      t.boolean :theme_active
      t.timestamps
    end
  end

  def self.down
    drop_table :page_layouts
  end
end
