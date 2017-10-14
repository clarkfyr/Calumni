Feature: create an account
  As a new mentor
  so that I can create my profile
  I want to add my personal information


Scenario: Go to create new mentor page
  Given I am on the home page
  When I follow "Sign Up"
  Then I should be on the Decision Role page
  When I follow "Mentor"
  Then I should be on the Create New Mentor page

Scenario: Fill out new mentor information
  Given I am on the Create New Mentor page
  When I fill in "Name" with "Test_user"
  And I fill in "Email" with "test@berkeley.edu"
  And I fill in "Username" with "username"
  And I fill in "Password" with "12345678"
  And I fill in "Description" with "Hello World"
  And I fill in "Company" with "Google"
  And I fill in "Start Date" with "2017-01-01"
  And I upload "Resume" with "Test_user_resume.pdf"
  And I upload "Profile" with "Test_user_profile.jpeg"
  And I fill in "University" with "UC, Berkeley"
  And I fill in "Major" with "Computer Science"
  And I fill in "Graduation Year" with "2016"
  And I check the following help: Resume, Interview
  And I press "submit_profile"
  Then I should be on the login page
