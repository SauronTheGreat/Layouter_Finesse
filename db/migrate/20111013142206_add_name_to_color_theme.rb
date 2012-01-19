class AddNameToColorTheme < ActiveRecord::Migration
  def change
    add_column :color_themes, :name, :string
  end
end
