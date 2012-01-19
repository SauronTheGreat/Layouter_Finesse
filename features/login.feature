Feature: To test login module

Scenario: Check for login as Super Admin
  Given I am on home page
  When I fill in "Username" with "superadmin"
  And I fill in "Password" with "finesse1"
  And I press "Sign In" button
  Then I should see "Signed in successfully"

Scenario: Check for login as Admin
  Given I am on home page
  When I fill in "Username" with "admin"
  And I fill in "Password" with "finesse1"
  And I press "Sign In" button
  Then I should see "Signed in successfully"
#

Scenario: Check for login as Facilitator
   Given I am on home page
  When I fill in "Username" with "facilitator"
  And I fill in "Password" with "finesse1"
  And I press "Sign In" button
  Then I should see "Signed in successfully"
#
