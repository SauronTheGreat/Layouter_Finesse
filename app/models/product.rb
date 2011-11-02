class Product < ActiveRecord::Base
  has_many :product_parameters

  def self.calculate_mfg_cost
    @products=Product.all
    @products.each do |product|
      weight=product.weight
      @materials=product.product_parameters
      total_cost=0
      @materials.each do |material|
        price=RawMaterial.find(material.raw_material_id).price_per_kg
        amount=(material.value*weight)/100
        total_cost=total_cost+(price*amount)
      end
      product.mfg_cost=total_cost
      product.save!
    end
  end
end
