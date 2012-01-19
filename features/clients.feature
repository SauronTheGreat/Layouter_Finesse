Feature:Clients
  In Order to provide clients
  As a Admin
  I want to create clients


  Scenario: Admin wants to create a new client
    Given I sign in as "admin"
    When I follow "Proceed" link
    Then I should see "Manage Clients"
    When I follow "Manage Clients" link
    And I follow "New Client" link
    And I fill in "Name" with "ISB"
    And I fill in "Client type" with "Management School"
    And I press the "Submit" button
    Then I should see "Client was successfully created"


  Scenario: Admin wants to view details of a clients
    Given I sign in as "admin"
    When I follow "Proceed" link
    Then I should see "Manage Clients"
    When I follow "Manage Clients" link
    And I follow "New Client" link
    And I fill in "Name" with "ISB"
    And I fill in "Client type" with "Management School"
    And I press the "Submit" button
    Then I should see "Client was successfully created"
    When I go to "index" page of "clients"
    Then I should see "ISB"


  Scenario: Admin wants to edit an existing client
    Given I sign in as "admin"
    When I follow "Proceed" link
    Then I should see "Manage Clients"
    When I follow "Manage Clients" link
    And I follow "New Client" link
    And I fill in "Name" with "ISB"
    And I fill in "Client type" with "Management School"
    And I press the "Submit" button
    Then I should see "Client was successfully created"
    When I go to "index" page of "clients"
    And I follow "Edit" link
    And I fill in "Name" with "IIM"
    And I fill in "Client type" with "Business school"
    And I press "Update" button
    Then I should see "Client was successfully updated"


#  @javascript

  Scenario: Admin wants to delete an existing client
    Given I sign in as "admin"
    When I follow "Proceed" link
    Then I should see "Manage Clients"
    When I follow "Manage Clients" link
    And I follow "New Client" link
    And I fill in "Name" with "ISB"
    And I fill in "Client type" with "Management School"
    And I press the "Submit" button
    Then I should see "Client was successfully created"
    When I go to "index" page of "clients"
    And I follow "Destroy" link
    Then I should be on "index" page of "clients"
    And I should not see "ISB"


  Scenario Outline: admin creates a client with invalid value
    Given I sign in as "admin"
    And I follow "Proceed" link
    And I should see "Manage Clients"
    When I follow "Manage Clients" link
    And I follow "New Client" link
    And I fill in "<field>" with "<arg>"
    And I press "Submit" button
    Then I should see "<message>"

  Examples:
    | field       | arg | message                          |
    | Name        | 123 | Please enter a valid client name |
    | Client type | 125 | Please enter valid client type   |


  Scenario Outline: admin creates a client with blank fields
    Given I sign in as "admin"
    And I follow "Proceed" link
    And I should see "Manage Clients"
    When I follow "Manage Clients" link
    And I follow "New Client" link
    And I leave the "<field>" blank
    And I press "Submit" button
    Then I should see "<message>"

  Examples:
    | field       | message                  |
    | Name        | Please enter client name |
    | Client type | Please enter client type |




