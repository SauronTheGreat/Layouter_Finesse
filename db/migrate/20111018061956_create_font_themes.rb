class CreateFontThemes < ActiveRecord::Migration
  def change
    create_table :font_themes do |t|
      t.string :name

      t.timestamps
    end
  end
end
