Feature: Calculation of entites
  In order to provide standard values
  for calculation of system variables
  I want to design constants

#this can only be cruded by superadmin

  Scenario: superadmin creates a new constant
    Given I sign in as "superadmin"
    And I follow "Proceed" link
    Then I should see "Manage Constants"
    When I follow "Manage Constants" link
    And I follow "New Constant" link
    And I fill in "Name" with "Constant name"
    And I fill in "Value" with "20"
    And I press "Submit" button
    Then I should see "Constant was successfully created"

  Scenario: superadmin views  constant
    Given I sign in as "superadmin"
    And I follow "Proceed" link
    Then I should see "Manage Constants"
    When I follow "Manage Constants" link
    Then I should see "Listing Constants"
    And I should see:
      | a |
      | k |

  Scenario: superadmin edits a constant
    Given I sign in as "superadmin"
    And I follow "Proceed" link
    Then I should see "Manage Constants"
    When I follow "Manage Constants" link
    Then I should see "Listing Constants"
    And I follow "Edit" link
    And I fill in "Name" with "g"
    And I fill in "Value" with "10"
    And I press "Update" button
    Then I should see "Constant was successfully updated"

  Scenario: superadmin deletes a  constant
    Given I sign in as "superadmin"
    And I follow "Proceed" link
    Then I should see "Manage Constants"
    When I follow "Manage Constants" link
    And I follow "New Constant" link
    And I fill in "Name" with "Constant name"
    And I fill in "Value" with "20"
    And I press "Submit" button
    Then I should see "Constant was successfully created"
    And I should be on "index" page of "constants"
    When I follow "Destroy" link
#    Then I should not see "Constant name"
  Then I should be on "index" page of "constants"

#these are validations
#all have been added by me in the model

  Scenario: a user other than superadmin tries to access constant resource
    Given I sign in as "admin"
    When I go to "new" page of "constants"

    Then I should see "you do not have sufficient privileges"

#he should be redirected to root path and see the message you do not have permission to perform this action


  Scenario: superadmin creates a constant with existing name
    Given I sign in as "superadmin"
    And I follow "Proceed" link
    And I should see "Manage Constants"
    And I follow "Manage Constants" link
    And I follow "New Constant" link
    And I fill in "Name" with "Constant name"
    And I fill in "Value" with "20"
    When I press "Submit" button
    Then I should see "Constant was successfully created"
    And I should be on "index" page of "constants"
    And Again tries to create a "constant" with same "name"
    When I follow "New Constant" link
    And I fill in "Name" with "Constant name"
    And I fill in "Value" with "20"
    When I press "Submit" button
    Then I should see: "This Constant name already exists"

  Scenario Outline: superadmin creates a constant with invalid value
    Given I sign in as "superadmin"
    And I follow "Proceed" link
    And I should see "Manage Constants"
    When I follow "Manage Constants" link
    And I follow "New Constant" link
    And I fill in "<field>" with "<arg>"
    And I press "Submit" button
    Then I should see "<message>"

  Examples:
    | field  | arg  | message                   |
    | Name  | 123 | Please enter a valid constant name |
    | Value | abc | Please enter valid constant value |


  Scenario Outline: superadmin creates a constant with blank fields
    Given I sign in as "superadmin"
    And I follow "Proceed" link
    And I should see "Manage Constants"
    When I follow "Manage Constants" link
    And I follow "New Constant" link
    And I leave the "<field>" blank
    And I press "Submit" button
    Then I should see "<message>"

  Examples:
    | field | message                     |
    | Name  | Please enter constant name  |
    | Value | Please enter constant value |

