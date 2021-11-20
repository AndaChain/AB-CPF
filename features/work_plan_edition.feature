Feature: Test for the feature that Manager can do in Employee management table(3. work plan edition)

Background: Start from the home page

  Given I am on the sign in page

Scenario: I can give OT for only one employee

  Given a valid Manager
  Given a valid Employee
  Given a valid Department
  Given I am on the Employee management table page
  When I press "OT Setting"
  And I select "True" from "table_1"
  And I fill in "OT_plan" with "3"
  And I press "Submit"
  Then I should see "chain anda OT plan is 3"

Scenario: I can give same OT for all employee in table

  Given a valid Manager
  Given a valid Employee
  Given a valid Employee2
  Given a valid Department
  Given I am on the Employee management table page
  When I press "OT Setting"
  And I select "True" from "Select_All"
  And I fill in "OT_plan" with "3"
  And I press "Submit"
  Then I should see "Set all employees's OT plan are 3"

Scenario: I can move employee out from table

  Given a valid Manager
  Given a valid Employee
  Given a valid Employee2
  Given a valid Department
  Given I am on the Employee management table page
  When I press "decrease_1"
  Then I should see "delete success"
  And I should not see "chain table"

Scenario: I can add employee to table

  Given a valid Manager
  Given a valid Employee
  Given a valid Employee2
  Given a valid Department
  Given I am on the Employee management table page
  When I press "increase"
  Then I should see "already employee table"
  When I select "nontouch" from "already employee table"
  Then I should see "nontouch table"

Scenario: I can see the future working plan table

  Given a valid Manager
  Given a valid Employee
  Given a valid Employee2
  Given a valid Department
  Given I am on the Employee management table page

  When I select "14/11/2021 14:00" from "time_table"
  Then I should see "Plan for 14/11/2021"