Feature: Test for checking user login will correct

Background: Start from the home page

  Given I am on the sign in page

Scenario: user login(right manager case)

  Given a valid Manager
  When I fill in "user_name" with "m1"
  And I fill in "password" with "123"
  And I press "Log in"
  Then I should be on the Manage Department page

Scenario: user login(wrong case)

  Given a valid Manager
  When I fill in "user_name" with "m1"
  And I fill in "password" with "1234"
  And I press "Log in"
  Then I should be on the sign in page


Scenario: user login(employee case)

  Given a valid Employee
  When I fill in "user_name" with "e1"
  And I fill in "password" with "111"
  And I press "Log in"
  Then I should be on the Employee information page