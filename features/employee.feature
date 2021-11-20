Feature: Test for All employee feature(4. about employee)

Background: Start from the home page

  Given I am on the sign in page

Scenario: What employees will when they log in with employee mode

  Given a valid Manager
  Given a valid Employee
  Given a valid Department
  When I fill in "user_name" with "e1"
  And I fill in "password" with "111"
  And I press "Log in"
  Then I should be on the Employee information page
  And I should see "ID: e1

Name: chain

Lastname: anda

Department: d1

OT: 2

Plan: s1

Actual:"

Scenario: Employees can see they future working plan

  Given a valid Manager
  Given a valid Employee
  Given a valid Department
  When I fill in "user_name" with "e1"
  And I fill in "password" with "111"
  And I press "Log in"
  Then I should be on the Employee information page

  When I select "14/11/2021 14:00" from "time_table"
  Then I should see "Plan for 14/11/2021"