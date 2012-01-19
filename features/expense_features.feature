Feature: Expense Decision by superadmin
  In order to provide expenses
  To the player for decision making
  I want to provide expenses


############################################EXPENSE TYPE#########################################################
#table : expense_types

#only super admin can CRUD the expense type

  Scenario: superadmin creates a new expense type
    Given I sign in as "superadmin"
    When I follow "Proceed" link
    Then I should see "Manage Expense Types"
    And I follow "Manage Expense Types" link
    When I follow "New Expense type" link
    And I fill in "Name" with "Bonus"
    And I press "Submit" button
    Then I should see "Expense type was successfully created"

  Scenario: superadmin views a list of expense type
    Given I sign in as "superadmin"
    When I follow "Proceed" link
    Then I should see "Manage Expense Types"
    And I follow "Manage Expense Types" link
    Then I should see:
      | HR            |
      | Media         |
      | Channel       |
      | Factory       |
      | Miscellaneous |


  Scenario: superadmin edits an existing expense type
    Given I sign in as "superadmin"
    When I follow "Proceed" link
    Then I should see "Manage Expense Types"
    And I follow "Manage Expense Types" link
    When I follow "New Expense type" link
    And I fill in "Name" with "Bonus"
    And I press "Submit" button
    Then I should see "Expense type was successfully created"
    And I go to "index" page of "expense_types"
    When I follow "Edit" link
    And I fill in "Name" with "Bonus1"
    And I press "Update" button
    Then I should see "Expense type was successfully updated"

  Scenario: superadmin deletes an existing expense type
    Given I sign in as "superadmin"
    When I follow "Proceed" link
    Then I should see "Manage Expense Types"
    And I follow "Manage Expense Types" link
    When I follow "New Expense type" link
    And I fill in "Name" with "Bonus"
    And I press "Submit" button
    Then I should see "Expense type was successfully created"
    And I go to "index" page of "expense_types"
    When I follow "Destroy" link
    Then I should be on "index" page of "expense_types"

  Scenario Outline: admin creates a investments with blank fields
    Given I sign in as "superadmin"
    When I follow "Proceed" link
    Then I should see "Manage Expense Types"
    And I follow "Manage Expense Types" link
    When I follow "New Expense type" link
    And I leave the "<field>" blank
    And I press "Submit" button
    Then I should see "<message>"

  Examples:
    | field | message                          |
    | Name  | Please enter a expense type name |


  Scenario: any  user other than superadmin creates new expense type
    Given I sign in as "facilitator"
    When I go to "new" page of "expense_types"
    Then I should see "you do not have sufficient privileges"





############################################EXPENSE#########################################################
#table : expenses


  Scenario:admin creates an expense with valid data
# success

  Scenario: any other user attempts to create an expense
    Given I sign in as "superadmin"
    When I go to "new" page of "expenses"
    Then I should see an error message "you do not have sufficient privileges"

  Scenario: admin creates an existing expense of type factory
  # he should see an error message
    Given I sign in as "admin"
    When I follow "Proceed" link
    And I follow "Manage Expense Types" link
    Then I should see "Listing Types of expenses"
    When I follow "New Expense type" link
    And I fill in "Name" with "Bonus"
    And I fill in "Number of options" with "2"
    And I select "Factory" within "Expense type"
    And I press the "Submit" button
    Then I should see an error message "Expense with type factory already exists"


  Scenario: Admin wants to create a new expenses
    Given I sign in as "admin"
    When I follow "Proceed" link
    Then I should see "Manage Expenses"
    When I follow "Manage Expenses" link
    And I follow "New Expense" link
    And I fill in "Name" with "Bonus"
    And I fill in "Number of options" with "2"
    And I select "HR" within "Expense type"
    And I press the "Submit" button
    Then I am on "new" page of "expense_options"
    And I fill in "Option # 1" with "10"
    And I fill in "Option # 2" with "20"
    And I press the "Submit" button
    Then I should be on home page


  Scenario: Admin wants to view details of a expenses
    Given I sign in as "admin"
    When I follow "Proceed" link
    Then I should see "Manage Expenses"
    When I follow "Manage Expenses" link
    And I follow "New Expense" link
    And I fill in "Name" with "Bonus"
    And I fill in "Number of options" with "2"
    And I select "HR" within "Expense type"
    And I press the "Submit" button
    Then I am on "new" page of "expense_options"
    And I fill in "Option # 1" with "10"
    And I fill in "Option # 2" with "20"
    And I press the "Submit" button
    When I go to "index" page of "expense_options"
    Then I should see "Bonus"


  Scenario: Admin wants to edit an existing expenses
    Given I sign in as "admin"
    When I follow "Proceed" link
    Then I should see "Manage Expenses"
    When I follow "Manage Expenses" link
    And I follow "New Expense" link
    And I fill in "Name" with "Bonus"
    And I fill in "Number of options" with "2"
    And I select "HR" within "Expense type"
    And I press the "Submit" button
    Then I should be on "new" page of "expense_options"
    And I fill in "Option # 1" with "20"
    And I fill in "Option # 2" with "30"
    And I press "Submit" button
    When I go to "index" page of "expenses"
    And I follow "Edit" link
    And I fill in "Name" with "Bonus"
    And I press the "Update" button
    Then I should be on "new" page of "expense_options"
    And I fill in "Option # 1" with "20"
    And I press "Submit" button
    Then I should be on home page




#  @javascript

  Scenario: Admin wants to delete an existing expenses
    Given I sign in as "admin"
    When I follow "Proceed" link
    Then I should see "Manage Expenses"
    When I follow "Manage Expenses" link
    And I follow "New Expense" link
    And I fill in "Name" with "Bonus"
    And I fill in "Number of options" with "2"
    And I select "HR" within "Expense type"
    And I press the "Submit" button
    Then I should be on "new" page of "expense_options"
    And I fill in "Option # 1" with "20"
    And I fill in "Option # 2" with "30"
    And I press "Submit" button
    When I go to "index" page of "expenses"
    And I follow "Destroy" link
    Then I should be on "index" page of "expenses"
    And I should not see "Bonus"


  Scenario Outline: admin creates a expenses with invalid value
    Given I sign in as "admin"
    And I follow "Proceed" link
    And I should see "Manage Expenses"
    When I follow "Manage Expenses" link
    And I follow "New Expense" link
    And I fill in "<field>" with "<arg>"
    And I press "Submit" button
    Then I should see "<message>"

  Examples:
    | field             | arg | message                           |
    | Name              | 123 | Please enter a valid expense name |
    | Number of options | abc | Please enter a valid no of option |


  Scenario Outline: admin creates a expenses with blank fields
    Given I sign in as "admin"
    And I follow "Proceed" link
    And I should see "Manage Expenses"
    When I follow "Manage Expenses" link
    And I follow "New Expense" link
    And I leave the "<field>" blank
    And I press "Submit" button
    Then I should see "<message>"

  Examples:
    | field             | message                      |
    | Name              | Please enter a expense name  |
    | Number of options | Please enter a no of options |








############################################EXPENSE options#########################################################
#table : expense_options

  Scenario: admin enters option value as string
    Given I sign in as "admin"
    When I follow "Proceed" link
    Then I should see "Manage Expenses"
    And I follow "Manage Expenses" link
    And I follow "New Expense" link

#validation error


############################################round expenses#########################################################
#table : round_expenses

#only facilitator can modify this table

  Scenario: any user other than facilitator attempts to create a round expense
#he should be redirected to home page with appropriate message

  Scenario: facilitator creates a round expense without a summary
#validation error

  Scenario: facilitator creates a round expense with a summary
#success

  Scenario: facilitator destroys a round expense

  Scenario:facilitator views details of a round expense

  Scenario:facilitator edits details of a round expense


############################################player round expenses#########################################################
#table : player_round_expenses

#only player can modify this table

  Scenario: any user other than player attempts to create a player round expense
#he should be redirected to home page with appropriate message

  Scenario: player creates a player round expense without a selecting an option
#validation error

  Scenario: player creates a player round expense wih an option selected
#success


  Scenario:player views details of a player round expense

  Scenario:player edits details of a player round expense









