class Factory < ActiveRecord::Base


  #validation

  validates_presence_of :name
  validates_presence_of :market_id
  validates_presence_of :number_of_employees
  validates_presence_of :number_of_shifts
  validates_presence_of :cost_to_build
  validates_presence_of :cost_to_run
  validates_presence_of :capacity
  validates_presence_of :production_time_per_unit
  validates_presence_of :price

  validates_uniqueness_of :name


  validates_numericality_of :number_of_employees
  validates_numericality_of :number_of_shifts
  validates_numericality_of :cost_to_build
  validates_numericality_of :cost_to_run
  validates_numericality_of :capacity
  validates_numericality_of :price
  validates_numericality_of :production_time_per_unit


  has_many :employees, :dependent => :destroy
  has_many :factory_vendors, :dependent => :destroy


  after_create :initiate_employees, :create_factory_expense


  def create_factory_expense
    @expense_type=ExpenseType.find_by_name("Factory")

    Expense.create_expense(@expense_type.id, name, 0, price, self.id)
  end


  def initiate_employees
    Employee.create_employee_by_factory(self.id)
  end


#this is a method we need to set the vendors that the factory will buy raw material from
#each factory will have a vendor with least distance
  def self.set_vendors(simulation_id, factory_id)

    @factory=Factory.find(factory_id)
    @simulation=Simulation.find(simulation_id)
    @product=Product.find(@simulation.product_id)
    @product_parameters=@product.product_parameters
    @raw_materials=Array.new
    @product_parameters.each do |parameter|
      @raw_materials << RawMaterial.find(parameter.raw_material_id)
    end

    #we now have list of all raw materials required
    #now we scan through all the raw materials and see which is the closest vendor selling that material
    @vendors=Vendor.all
    #this is the list of all vendors

    @vendor_list=Array.new
    @vendor_distances=Array.new
    @raw_materials.each do |raw_material|
      #for each raw material

      #first find all the vendors who sell this particular raw material
      @vendor_list=@vendors.collect { |v|
        if v.raw_material_id==raw_material.id then
          v
        else
          nil
        end }.compact
      #now calculate distance from each vendor

      min=10000
      #here we calculate the market distances for each vendor and find out who is the closest
      @vendor_list.each do |vendor_list|
        if (vendor_list.market_id==@factory.market_id)
          @selected_vendor_id=vendor_list.id
        else
          distance=MarketDistance.find_by_source_market_id_and_target_market_id(@factory.market_id, vendor_list.market_id).distance
          if min > distance
            min= distance
            @selected_vendor_id=vendor_list.id
          end


        end

      end

      @factory_vendor=FactoryVendor.new
      @factory_vendor.factory_id=@factory.id
      @factory_vendor.vendor_id=@selected_vendor_id
      @factory_vendor.distance=min
      @factory_vendor.save!


    end


  end


end




