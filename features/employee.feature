Feature: Test for All employee feature(4. about employee)

Background: Start from the home page

  Given I am on the sign in page

Scenario: What employees will when they log in with employee mode

  Given a valid Manager
  Given a valid Employee
  Given a valid Department
  Given a valid KeepShift
  When I fill in "user_name" with "e1"
  And I fill in "password" with "111"
  And I press "Log in"
  Then I should be on the Employee information page
  And I should see "ID: e1"
  And I should see "Name: chain"
  And I should see "Lastname: anda"
  And I should see "Department: d1"
  And I should see "OT: 0"
  And I should see "Plan: No plan today"
  And I should see "Actual: -"

Scenario: Employees can see their future working plan or their past working plan

  Given a valid Manager
  Given a valid Employee
  Given a valid Department
  Given a valid KeepShift
  When I fill in "user_name" with "e1"
  And I fill in "password" with "111"
  And I press "Log in"
  Then I should be on the Employee information page

  When I select "2021-11-14" from "name"
  Then I should see "Plan for 14/11/2021"