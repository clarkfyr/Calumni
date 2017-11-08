Feature: become a mentor
  As a mentee
  so that I can choose to become a mentor

Background: logined user
  Given the following users exist:
    |username |     email       |lastname|
    |Test_user|test@berkeley.edu|Test|
  Given I am successfully signin with "test@berkeley.edu"

Scenario: Able to become a mentor for a mentee
  Given I am on the home page
  Then I should see "BecomeMentor"
  When I follow "BecomeMentor"
  And I fill in "Company" with "Google"
  And I fill in "Position" with "Software Development Engineer"
  And I check the following help type: resume, interview
  And I Press "Update"
  Then I should see "Google"
  And I should see "Software Development Engineer"
  And I should see "resume"
  And I should see "resume"
  And I should see "interview"