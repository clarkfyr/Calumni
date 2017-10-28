Feature: signin
  As a calumni
  so that I can signup as alumni with gmail account
  I can go back to the previous page
  I can edit my profile

Background: users in database
  
  Given the following users exist:
    |username  |email    | description |
    |Test_user |test@berkeley.edu  | None |

Scenario: Successfully signin with CalID
  Given I am on the home page
  Then I should see "Signin"
  When I follow "Signin"
  When I follow Mentor
  Then I should see "Google"


#  And fill in "Email or phone" with "test@berkeley.edu"
#  And fill in "Password" with "123456"
#  Then I should be on the home page

Scenario: Edit profile
  Given I am successfully signin with "test@berkeley.edu"
  When I follow "Signin"
  Then I should be on the Profile page for "test@berkeley.edu"
  Then I should see "Edit Profile"

Scenario: Edit Username
  Given I am on the Profile page for "test@berkele.edu"
  When I press "Edit username"
  When I fill in "Username" with "Test_user"
  And I should see "Test_user"

Scenario: Edit Description
  Given I am on the Profile page for "test@berkele.edu"
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
  Then I should be on the Profile page for "test@berkele.edu"
  And I should see "Test_user"
  And I should see "Hello World"
  And I should see "Google"
  And I should see "2017-01-01"
  And I should see "Test_user_resume.pdf"
  And I should see "Test_user_profile.jpg"
  And I should see "Computer Science"
  And I should see "2016"
  And I should see "Resume, Interview"
