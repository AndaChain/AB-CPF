Feature: Test for check all path of login and logout will complete

Background: Start from the Search form on the home page

  Given I am on the sign in page

Scenario: log in part

  When I press "Log in"
  Then I should be on the Manage Department page

Scenario: log out part
  
  Given I am on the Manage Department page
  When I press "Log out"
  Then I should be on the sign in page
