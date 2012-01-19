@sample
Feature: To manage DRY test
  In Order to :complete tests fast
  As a :tester
  I want to :write DRY tests


  Scenario: To test index of clients
    Given :I sign in as "superadmin"
    Given :I have "2" "clients"
    When :I am on "index" page of "clients"
    Then :I should see "clients_name_1"
    And :I should see "clients_name_2"
#
#  Scenario: To test index of constants
#    Given :I sign in as "superadmin"
#    #Given :I have "2" "constants"
#    When :I am on "index" page of "constants"
#    Then :I should see "a"                  I fill in
#    And :I should see "k"
#


  Scenario: To Test create of clients
    Given :I sign in as "superadmin"
    And :I am on "new" page of "clients"
    When :I fill in "client_name" with "client_name_1"
    And :I fill in "client_client_type" with "sample1"
    And :I press the "Create Client" button
    Then :I should see "Edit"


#  Scenario: To Test create of Constants
#    Given :I sign in as "superadmin"
#    And :I am on "new" page of "constants"
#    When :I fill in "constant_name" with "constant_1"
#    And :I fill in "constant_value" with "123"
#    And :I press the "Create Constant" button
#    Then :I should see "Edit"
#
#
#

  Scenario: To Test edit of a client
    Given :I sign in as "superadmin"
    And  :I have "1" "clients"
    When :I am on "index" page of "clients"
    And :I follow "edit" link of "clients"
    And :I fill in "client_name" with "client_name_1_edit"
    And :I fill in "client_client_type" with "sample1_edit"
    And :I press the "Update Client" button
    Then :I should see "Client was successfully updated."


  #  @javascript
  Scenario: To Test delete of a client
    Given :I sign in as "superadmin"
    And  :I have "1" "clients"
    When :I am on "index" page of "clients"
    And :I click "Delete" link of "clients"
     Then :I should be on "index" page of "clients"


