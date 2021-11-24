Feature: Test for Manager about department and staff management(2. about department)

Background: Start from the home page

  Given I am on the sign in page
  Given a valid Manager
  Given a valid Employee
  Given a valid Employee2
  Given a valid Department
  Given a valid KeepShift
  Given a valid ShiftTime
  Given a valid TimeRecode

Scenario: see all responsible departments with current working staff and maximum staff in each departments

  When I fill in "user_name" with "m1"
  And I fill in "password" with "123"
  And I press "Log in"
  Then I should be on the Manage Department page
  And I should see "Department Chicken Cleaner"
  And I should see "4"

Scenario: Everthing I should see inside each departments

  When I fill in "user_name" with "m1"
  And I fill in "password" with "123"
  And I press "Log in"
  Then I should be on the Manage Department page
  And I should see "Department Chicken Cleaner"

  When I press "Edit"
  Then I should be on the Chicken Cleaner Department page
  And I should see "Chicken Cleaner"
  And I should see "Delete"
  And I should see "Enter"
  And I should see "ID"
  And I should see "Name"
  And I should see "Last Name"
  And I should see "Plan"
  And I should see "Actual"
  And I should see "Plan OT"
  And I should see "Actual OT"
  And I should see "Select All"

  When I press "+"
  Then I should see "chain"
  And I should see "sasaki"