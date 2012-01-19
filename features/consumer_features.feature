Feature: Consumers of the world
  In order to provide consumers
  to the players
  I want to create consumers


#################CREATION OF CONSUMERS###############################################

  Scenario: Any user tries to access the consumer resource
# he should be redirected to root path and see the message you do not have permissions to perform this action
#validations

  Scenario: a  consumer is created without a category being assigned
# an error message should be seen

  Scenario: a  consumer is created without a personal taste index
# an error message should be seen

  Scenario: a  consumer is created without a media push index
# an error message should be seen

  Scenario: a  consumer is created without a dealer push index
# an error message should be seen

  Scenario: a  consumer is created without a price index
# an error message should be seen

  Scenario: a  consumer is created without a dealer id
# an error message should be seen


########################################################################buying decision of  consumers################################################

#this is performed when round results are calculated

  Scenario: each consumers should have attribute 'final decision' as either 0 or 1 but cant be anything else

########################################################################final decision of  consumers################################################

#this is performed when round results are calculated


  Scenario: when final decision of consumer is 1 he has to select 1 brand

  Scenario: when final decision of consumer is 0 he cannot select any brand
