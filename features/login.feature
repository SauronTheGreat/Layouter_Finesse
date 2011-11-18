Feature: To test login module

Scenario: Check for login as Super Admin
  Given :I am on home page
  When :I fill in "user_username" with "superadmin"
  And :I fill in "user_password" with "finesse1"
  And :I press the "Sign in" button
  Then :I should see "Finesse Portal"

Scenario: Check for login as Admin
  Given :I am on home page
  When :I fill in "user_username" with "admin"
  And :I fill in "user_password" with "finesse1"
  And :I press the "Sign in" button
  Then :I should see "Finesse Portal"
#

Scenario: Check for login as Facilitator
  Given :I am on home page
  When :I fill in "user_username" with "facilitator"
  And :I fill in "user_password" with "finesse1"
  And :I press the "Sign in" button
  Then :I should see "Finesse Portal"
#
