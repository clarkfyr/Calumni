Feature: logout
  As a logined calumni
  I want to logout
  Because I want to logout in a public computer

Scenario: able to logout
  Given the following users exist:
    |username |     email       |firstname|
    |Test_user|test@berkeley.edu|Test     |
  Given I am successfully signin with "test@berkeley.edu"
  Then I should see "Test"
  When I follow Logout
  Then I should be on the home page
  Then I should not see "Test"



