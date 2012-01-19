Feature: Dealers of the world
  In order to provide dealers of the world
  to the players and consumers
  I want to design dealers

  Scenario: Any user tries to access the dealer resource
# he should be redirected to root path and see the message you do not have permissions to perform this action
#validations

  Scenario: a  dealer is created without a dealer category being assigned
# an error message should be seen

  Scenario: a  dealer is created without a market
# an error message should be seen

  Scenario: a  dealer is created without a catchment of consumers
# an error message should be seen

  Scenario: a  dealer is created without a name
# an error message should be seen

  Scenario: a  dealer is created with existing  name
# an error message should be seen


  Scenario: catchment of consumers of national dealers must be higher that that of catchment of dealers for local dealers

################################dealers categories##########################################

#only super admin can CRUD dealer category

  Scenario: any user other than super admin tries to access dealer category resource
# he should be redirected to root path and see the message you do not have permissions to perform this action

  Scenario: super admin creates a new dealer category
#success

  Scenario: super admin edits a  dealer category
#success

  Scenario: super admin views a  dealer category
#success

  Scenario: super admin deletes a  dealer category
#success


Scenario: superadmin creates a new dealer category with name missing

