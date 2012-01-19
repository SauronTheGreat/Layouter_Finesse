class CreateColorThemes < ActiveRecord::Migration
  def self.up
    create_table :color_themes do |t|
      t.string :back_color
      t.string :main_color
      t.string :highlight_color
      t.string :header_color
      t.string :header_text_color
      t.string :navigation_panel_color
      t.string :extra_panel_color
      t.string :footer_panel_color
      t.string :text_color
      t.string :link_color
      t.string :link_color_hover
      t.integer :icon_theme
      t.integer :jquery_theme
      t.boolean :rounded_corners
      t.timestamps
    end
  end

  def self.down
    drop_table :color_themes
  end
end
