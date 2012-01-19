class Vendor < ActiveRecord::Base

  #we write a method to initialize vendors
  #this method is called when simulation is initiated

  def self.create_vendors_from_market(market_id, simulation_id)
    @market=Market.find(market_id)
    @simulation=Simulation.find(simulation_id)
    @product=Product.find(@simulation.product_id)
    @product_parameters=@product.product_parameters
    @raw_material_ids=Array.new
    @product_parameters.each do |parameter|
      @raw_material_ids << parameter.raw_material_id
    end
    @raw_material_ids.shuffle!
    count=@raw_material_ids.count-1
    i=0
    @market.catchment_of_vendors.times do |vendor|
      @vendor=Vendor.new
      @vendor.market_id=market_id
      @vendor.raw_material_id=@raw_material_ids[i]
      @vendor.name="Vendor#{i}"
      @vendor.save!
      i=i+1
      if i==@raw_material_ids.count
        i=0
        @raw_material_ids.shuffle!
      end

    end


  end

end
