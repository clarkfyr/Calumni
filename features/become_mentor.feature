Feature: become a mentor
  As a mentee
  so that I can choose to become a mentor

Background: logined user
  Given the following users exist:
    |username |     email       |lastname|role  |
    |Test_user|test@berkeley.edu|Test    |mentee|
  Given I am successfully signin with "test@berkeley.edu"
  
Scenario: Able to become a mentor for a mentee
  Given I am on the home page
  Then I should see "Become a mentor"
  When I follow "Become a mentor"
  And I fill invisible field in "Company" with "Google"
  And I fill invisible field in "Position" with "Software Development Engineer"
  And I fill in "Start date" with "07/11/1111"
  And I collection-check "resume"
  And I fill in "General advice" with "thisisadvice"
  And I press "Update"
  Then I should see "Google"
  And I should see "Software Development Engineer"
  And I should see "07/11/1111"
  And I should see "resume"
  And I should see "thisisadvice"

# should use js to test this
Scenario: two columns must be filled to become a mentor
