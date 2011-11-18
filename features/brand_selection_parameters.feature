Feature: This is to test brand selection parameters


Scenario: To test index of brand_selection_parameters
    Given :I sign in as "superadmin"
    Given :I have "2" "brand_selection_parameters"
    When :I am on "index" page of "brand_selection_parameters"
    Then :I should see "brand_selection_parameters_name_1"
    And :I should see "brand_selection_parameters_name_2"