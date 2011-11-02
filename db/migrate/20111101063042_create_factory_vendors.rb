class CreateFactoryVendors < ActiveRecord::Migration
  def change
    create_table :factory_vendors do |t|
      t.integer :vendor_id
      t.integer :factory_id

      t.timestamps
    end
  end
end
