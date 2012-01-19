Feature: Factories of the world
  In order to provide facotries
  for production of pproducts
  I want to provide factory facility


#table :factory
#only a super admin can create a factory

  Scenario: superadmin creates a factory with valid data
#success

  Scenario: any user other than super admin attempts to create a new factory
#an error message must appear

  Scenario: superadmin creates a factory with existing name
#validation error


  Scenario: superadmin creates a factory with any of the attribute missing
#validation error

  Scenario: superadmin creates a factory with a number field as string
#the number fields are :
#  number_of_employees
#   :number_of_shifts
#   :cost_to_build
#   :cost_to_run
#   :capacity
#   :price
#   :production_time_per_unit

#here he must get a validation error

########################factory expenses###############################

#table : expenses

#expense of type factory can only be created by system

  Scenario: any user attempts to create a expense of type factory
#he should be redirected to home page with an error message

  Scenario: superadmin creates a factory and the expense is created of type factory

  Scenario:each expense of type factory has 2 options one is 0 and other is price of the factory




########################factory employees###############################

#table : employees

  Scenario: superadmin creates a factory and initiates employees


