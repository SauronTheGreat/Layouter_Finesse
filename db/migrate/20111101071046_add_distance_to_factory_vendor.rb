class AddDistanceToFactoryVendor < ActiveRecord::Migration
  def change
    add_column :factory_vendors, :distance, :integer
  end
end
