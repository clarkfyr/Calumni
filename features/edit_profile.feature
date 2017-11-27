Feature: edit_profile
  As a logined calumni
  so that I can edit my profile

Background: logined user
  Given the following users exist:
    |username |     email       |lastname|
    |Test_user|test@berkeley.edu|Test|
  Given I am successfully signin with "test@berkeley.edu"

Scenario: Able to edit profile
  Given I am on the home page
  When I follow "Profile"
  Then I should be on the Profile page
  Then I should see "Edit"

Scenario: Edit Description
  Given I am on the Profile page
  When I follow "Edit"
  And I fill in "Description" with "Hello World"
  And I press "Update"
  Then I should see "Hello World"

Scenario: Edit Start Date
  Given I am on the Profile page
  When I follow "Edit"
  And I fill in "Start date" with "10/27/2017"
  And I press "Update"
  Then I should see "10/27/2017"

Scenario: Edit Photo
  Given I am on the Profile page
  When I follow "Edit"
  And I upload a photo
  And I press "Update"
  And I should see the image

Scenario: Edit Resume
  Given I am on the Profile page
  When I follow "Edit"
  And I upload a resume
  And I press "Update"
  And I should see the resume

