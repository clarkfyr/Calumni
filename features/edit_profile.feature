Feature: edit_profile
  As a logined calumni
  so that I can edit my profile

Background: logined user
  Given I am successfully signin with "test@berkeley.edu"
  Given the following users exist:
    |username  |email    | description |
    |Test_user |test@berkeley.edu  | None |

Scenario: Able to edit profile
  Given I am on the home page
  When I follow "Profile"
  Then I should be on the Profile page
  Then I should see "Edit Profile"

Scenario: Edit Username
  Given I am on the Profile page
  When I press "Edit"
  And I fill in "Username" with "Test_user"
  And I press "Update"
  And I should see "Test_user"

Scenario: Edit Description
  Given I am on the Profile page
  When I press "Edit"
  And I fill in "Username" with "Test_user"
  And I press "Update"
  And I should see "Test_user"
  Given I am on the Profile page
  When I press "Edit Description"
  When I fill in "Description" with "Hello World"
  And I should see "Hello World"


  And I fill in "Description" with "Hello World"
  And I fill in "Company" with "Google"
  And I fill in "Start Date" with "2017-01-01"
  And I upload "Resume" with "Test_user_resume.pdf"
  And I upload "Photo" with "Test_user_profile.jpg"
  And I fill in "Major" with "Computer Science"
  And I fill in "Graduation Year" with "2016"
  And I check the following help: Resume, Interview
  And I press "Update Profile"
  Then I should be on the Profile page
  And I should see "Hello World"
  And I should see "Google"
  And I should see "2017-01-01"
  And I should see "Test_user_resume.pdf"
  And I should see "Test_user_profile.jpg"
  And I should see "Computer Science"
  And I should see "2016"
  And I should see "Resume, Interview"
