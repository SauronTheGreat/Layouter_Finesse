Feature: Markets and Its Parameters
  In order to provide separation of geographical area
  For simulation world
  I want to provide markets

  Scenario: Market creation by superadmin
    Given I sign in as "superadmin"
    When I follow "Proceed" link
    And I follow "Manage Markets" link
    Then I should see:
      | Bangalore  |
      | Mumbai     |
      | nagpur     |
      | Pune       |
      | New Delhi  |
      | Gurgoan    |
      | Chennai    |
      | Hyderabad  |
      | Kolkata    |
      | Ahmadabad  |
      | Chandigarh |
    When I follow "New Market" link
    And I fill in "Name" with "Guwahati"
    And I fill in "Catchment of vendors" with "100"
    And I fill in "No of consumers" with "100"
    And I press "Submit" button
    Then I should see "Market was successfully created."

  Scenario: Market not created by a user other than superadmin
    Given I sign in as "facilitator"
    When I go to "new" page of "markets"

    Then I should see an error message "you do not have sufficient privileges"

  Scenario: Market creation with valid data
    Given I sign in as "superadmin"

    When I follow "Proceed" link
    And I follow "Manage Markets" link

    Then I should see:
      | Bangalore  |
      | Mumbai     |
      | nagpur     |
      | Pune       |
      | New Delhi  |
      | Gurgoan    |
      | Chennai    |
      | Hyderabad  |
      | Kolkata    |
      | Ahmadabad  |
      | Chandigarh |
    When I follow "New Market" link
    And I fill in "Name" with "Guwahati"
    And I fill in "Catchment of vendors" with "100"
    And I fill in "No of consumers" with "100"
    And I press "Submit" button
    Then I should see "Market was successfully created."

  Scenario: superadmin creates a market with existing name
    Given I sign in as "superadmin"
    When I follow "Proceed" link
    And I follow "Manage Markets" link

    Then I should see:
      | Bangalore  |
      | Mumbai     |
      | nagpur     |
      | Pune       |
      | New Delhi  |
      | Gurgoan    |
      | Chennai    |
      | Hyderabad  |
      | Kolkata    |
      | Ahmadabad  |
      | Chandigarh |
    When I follow "New Market" link
    And I fill in "Name" with "Mumbai"
    And I fill in "Catchment of vendors" with "123"
    And I fill in "No of consumers" with "1234"
    And I press "Submit" button
    Then I should see "you cannot use the same name twice"


  Scenario: Market creation with invalid data
    Given I sign in as "superadmin"
    When I follow "Proceed" link
    And I follow "Manage Markets" link

    Then I should see:
      | Bangalore  |
      | Mumbai     |
      | nagpur     |
      | Pune       |
      | New Delhi  |
      | Gurgoan    |
      | Chennai    |
      | Hyderabad  |
      | Kolkata    |
      | Ahmadabad  |
      | Chandigarh |
    When I follow "New Market" link
    And I fill in "Name" with "Market123"
    And I fill in "Catchment of vendors" with "abc"
    And I fill in "No of consumers" with "xyz"
    And I press "Submit" button
    Then I should see "your market will not be created with invalid data"


  Scenario Outline: Superadmin tries to create new market but skips a mandatory field
    Given I sign in as "superadmin"

    When I follow "Proceed" link
    And I follow "Manage Markets" link
    And I follow "New Market" link
    And I leave the "<field>" blank
    When I press "Submit" button
    Then I should see "<message>"
  #And I should not be registered
  Examples:
    | field                | message                         |
    | Name                 | Please enter your Market name   |
    | Catchment of vendors | Please enter number of vendors  |
    | No of consumers      | Please enter number of consumer |


  Scenario: Test creation of catchment of dealers
    Given I sign in as "superadmin"
    When I follow "Proceed" link
    And I follow "Manage Markets" link

    Then I should see:
      | Bangalore  |
      | Mumbai     |
      | nagpur     |
      | Pune       |
      | New Delhi  |
      | Gurgoan    |
      | Chennai    |
      | Hyderabad  |
      | Kolkata    |
      | Ahmadabad  |
      | Chandigarh |
    When I follow "New Market" link
    And I fill in "Name" with "Market123"
    And I fill in "Catchment of vendors" with "10"
    And I fill in "No of consumers" with "10"
    And I press "Submit" button
    Then The number of dealers should be created

  Scenario: superadmin edits an existing market
    Given I sign in as "superadmin"
    When I follow "Proceed" link
    And I follow "Manage Markets" link

    Then I should see:
      | Bangalore  |
      | Mumbai     |
      | nagpur     |
      | Pune       |
      | New Delhi  |
      | Gurgoan    |
      | Chennai    |
      | Hyderabad  |
      | Kolkata    |
      | Ahmadabad  |
      | Chandigarh |
    When I follow "Edit" link
    And I fill in "Name" with "Market123"
    And I fill in "Catchment of vendors" with "10"
    And I press "Update" button
    Then I should see "Market was successfully updated"


  Scenario: superadmin deletes an existing market
    Given I sign in as "superadmin"
    When I follow "Proceed" link
    And I follow "Manage Markets" link

    Then I should see:
      | Bangalore  |
      | Mumbai     |
      | nagpur     |
      | Pune       |
      | New Delhi  |
      | Gurgoan    |
      | Chennai    |
      | Hyderabad  |
      | Kolkata    |
      | Ahmadabad  |
      | Chandigarh |
    When I follow "Destroy" link
    Then I should be on "index" page of "markets"

  Scenario: superadmin views a list of markets
    Given I sign in as "superadmin"
    When I follow "Proceed" link
    And I follow "Manage Markets" link

    Then I should see:
      | Bangalore  |
      | Mumbai     |
      | nagpur     |
      | Pune       |
      | New Delhi  |
      | Gurgoan    |
      | Chennai    |
      | Hyderabad  |
      | Kolkata    |
      | Ahmadabad  |
      | Chandigarh |




###########################MARKET DISTANCES###########################################


  Scenario: When Superadmin views Set Distance of each market
    Given I sign in as "superadmin"
    When I follow "Proceed" link
    And I follow "Manage Markets" link

    Then I should see:
      | Bangalore  |
      | Mumbai     |
      | nagpur     |
      | Pune       |
      | New Delhi  |
      | Gurgoan    |
      | Chennai    |
      | Hyderabad  |
      | Kolkata    |
      | Ahmadabad  |
      | Chandigarh |
    When I follow "Set Distances" link
    Then I should see "All The distances have been set..."

  Scenario: When Superadmin creates a new market and views Set Distance of each market
    Given I sign in as "superadmin"
    When I follow "Proceed" link
    And I follow "Manage Markets" link
    Then I should see:
      | Bangalore  |
      | Mumbai     |
      | nagpur     |
      | Pune       |
      | New Delhi  |
      | Gurgoan    |
      | Chennai    |
      | Hyderabad  |
      | Kolkata    |
      | Ahmadabad  |
      | Chandigarh |

    When I follow "New Market" link
    And I fill in "Name" with "Chennai_new"
    And I fill in "Catchment of vendors" with "100"
    And I fill in "No of consumers" with "100"
    And I press "Submit" button
    Then I should see "Market was successfully created."
    And I should be on "index" page of "markets"
    And  I follow "Set Distances" link
    And I fill in "market_distances_0_distance" with "1000"
    When I press "Submit" button
    Then I am on welcome page


  Scenario: Test inverse relationship in market distances
    Given I sign in as "superadmin"
    When I follow "Proceed" link
    And I follow "Manage Markets" link
    And I delete all existing markets
    When I follow "New Market" link
    And I fill in "Name" with "Chennai_new"
    And I fill in "Catchment of vendors" with "100"
    And I fill in "No of consumers" with "100"
    And I press "Submit" button
    Then I should see "Market was successfully created."
    And I should be on "index" page of "markets"
    When I follow "New Market" link
    And I fill in "Name" with "Chennai_new123"
    And I fill in "Catchment of vendors" with "100"
    And I fill in "No of consumers" with "100"
    And I press "Submit" button
    Then I should see "Market was successfully created."
    And I should be on "index" page of "markets"
    And  I follow "Set Distances" link
    And I fill in "market_distances_0_distance" with "1000"
    When I press "Submit" button
    And I should be on "index" page of "markets"
    When I create market distance
    Then The Distance of source market_id ,target market_id and vice versa should be equal


  Scenario: superadmin sets distance between two markets from the distance matrix
    Given I sign in as "superadmin"
    When I follow "Proceed" link
    And I follow "Manage Markets" link
    And I delete all existing markets
    When I follow "New Market" link
    And I fill in "Name" with "Chennai_new"
    And I fill in "Catchment of vendors" with "100"
    And I fill in "No of consumers" with "100"
    And I press "Submit" button
    Then I should see "Market was successfully created."
    And I am on home page
    When I follow "Proceed" link
    And I follow "Manage Distance Matrix" link
    Then I should see "0"
