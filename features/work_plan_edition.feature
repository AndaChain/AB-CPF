Feature: Test for the feature that Manager can do in Employee management table(3. work plan edition)

Background: Start from the home page

  Given I am on the sign in page
  Given a valid Manager
  Given a valid Employee
  Given a valid Employee2
  Given a valid Department
  Given a valid KeepShift
  Given a valid ShiftTime
  Given a valid TimeRecode

Scenario: I can give OT for only one employee

  When I fill in "user_name" with "m1"
  And I fill in "password" with "123"
  And I press "Log in"
  Given I am on the Chicken Cleaner Department page
  When I fill in "f_fname" with "3"
  And I check "select-all"
  And I press "Assign OT"
  Then I should see "3"

Scenario: I can give same OT for all employee in table

  When I fill in "user_name" with "m1"
  And I fill in "password" with "123"
  And I press "Log in"
  Given I am on the Chicken Cleaner Department page
  When I fill in "fname" with "3"
  And I check "select-all"
  And I press "Assign OT"
  Then I should see "3"

Scenario: I can move employee out from table

  When I fill in "user_name" with "m1"
  And I fill in "password" with "123"
  And I press "Log in"
  Given I am on the Chicken Cleaner Department page
  When I press "-"
  Then I should see "delete success"
  And I should not see "chain table"

Scenario: I can add employee to table

  When I fill in "user_name" with "m1"
  And I fill in "password" with "123"
  And I press "Log in"
  Given I am on the Chicken Cleaner Department page
  When I press "+"
  Then I should see "Add Employees"
  When I check "se-all"
  And I press "Add Employees"
  Then I should see "sasako"
  And I should see "sasachain"

Scenario: I can see the future working plan table

  When I fill in "user_name" with "m1"
  And I fill in "password" with "123"
  And I press "Log in"
  Given I am on the Chicken Cleaner Department page

  When I select "14/11/2021 14:00" from "time_table"
  Then I should see "Plan for 14/11/2021"