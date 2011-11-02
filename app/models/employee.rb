class Employee < ActiveRecord::Base
  belongs_to :employee_category
  belongs_to :factory

  #we define a method here to generate employees as per data in factory
  #the argument is factory id

  def self.create_employee_by_factory(factory_id)
    @factory=Factory.find(factory_id)

    @factory.number_of_employees.times do |emp|
      min=EmployeeCategory.first.id
      max=EmployeeCategory.last.id
      target=min+rand(max-min)
      @employee=Employee.new
      @employee.employee_category_id=target
      @employee.factory_id=factory_id
      @employee.efficiency=rand(100)
      @employee.happiness_quotient=1
      @employee.effect_on_sales=@employee.efficiency*EmployeeCategory.find(target).base_effect_on_sales
      @employee.effect_on_quality_cost=@employee.efficiency*EmployeeCategory.find(target).base_effect_on_quality_cost
      @employee.cost=@employee.effect_on_sales+  @employee.effect_on_quality_cost
      @employee.save!


    end


  end


end
