Feature: Test for Manager about department and staff management(2. about department)

Background: Start from the home page

  Given I am on the sign in page

Scenario: see all responsible departments with current working staff and maximum staff in each departments

  Given a valid Manager
  Given a valid Department
  When I fill in "user_name" with "m1"
  And I fill in "password" with "123"
  And I press "Log in"
  Then I should be on the Manage Department page
  And I should see "Department Chicken Cleaner"
  And I should see "4/40"

Scenario: Everthing I should see inside each departments

  Given a valid Manager
  Given a valid Employee
  Given a valid Department
  When I fill in "user_name" with "m1"
  And I fill in "password" with "123"
  And I press "Log in"
  Then I should be on the Manage Department page
  And I should see "Department Chicken Cleaner"

  When I press "Edit"
  Then I should be on the Chicken Cleaner Department page
  And I should see "14:00 - 21:00"
  And I should see "1/5"

  When I press "Edit"
  Then I should be on the Employee management table page