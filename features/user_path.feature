Feature: Test for check all path of login and logout will complete(1. UID and password part 2)

Background: Start from the home page

  Given I am on the sign in page

Scenario: log in and log out part

  Given a valid Manager
  When I fill in "user_name" with "m1"
  And I fill in "password" with "123"
  And I press "Log in"
  Then I should be on the Manage Department page

  When I press "Log out"
  Then I should be on the sign in page
  When I am on the Manage Department page
  Then I should be on the sign in page
