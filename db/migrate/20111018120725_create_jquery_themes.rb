class CreateJqueryThemes < ActiveRecord::Migration
  def change
    create_table :jquery_themes do |t|
      t.string :name
      t.integer :number

      t.timestamps
    end
  end
end
