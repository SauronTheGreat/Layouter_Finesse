class CreatePluginSamples < ActiveRecord::Migration
  def change
    create_table :plugin_samples do |t|
      t.string :name
      t.text :description
      t.text :script_markup
      t.text :html_markup
      t.text :lesson

      t.timestamps
    end
  end
end
