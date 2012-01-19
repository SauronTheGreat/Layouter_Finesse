class Product < ActiveRecord::Base
  has_attached_file :product_image

  validate :check_parameters

  def check_parameters
    @parameters=self.product_parameters
    total=0
    @parameters.each do |parameter|
      total=total+parameter.value
    end
    if total!=100
      errors.add :product_parameters,("Parameters sum is not equal to  100")

    end
  end


  has_many :product_parameters
  accepts_nested_attributes_for :product_parameters, :allow_destroy => true

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

  #validations

  validates_presence_of :name
  validates_presence_of :mentality_parameter_id
  validates_presence_of :mfg_cost
  #validates_presence_of :number_of_parameters
  validates_presence_of :weight

  validates_numericality_of :mentality_parameter_id
  validates_numericality_of :mfg_cost
  #validates_numericality_of :number_of_parameters
  validates_numericality_of :weight

  validates_uniqueness_of :name


end
