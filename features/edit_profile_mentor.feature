Feature: edit_profile
  As a logined calumni
  so that I can edit my profile

Background: logined user
  Given the following users exist:
    |username |     email       |lastname|role|
    |Test_user|test@berkeley.edu|Test    |mentor|
  Given I am successfully signin with "test@berkeley.edu"

Scenario: Edit Helpability
  Given I am on the Profile page
  When I follow "Edit"
  And I collection-check "resume"
  And I press "Update"
  And I should see "resume"


Scenario: Edit Helpability multiple times
  Given I am on the Profile page
  When I follow "Edit"
  And I collection-check "resume"
  And I press "Update"
  And I should see "resume"

  When I follow "Edit"
  And I collection-check "interview"
  And I press "Update"
  And I should see "resume"
  And I should see "interview"

Scenario: Edit Helpability multiple times multiple parts
  Given I am on the Profile page
  When I follow "Edit"
  And I collection-check "resume interview"
  And I press "Update"
  And I should see "resume"
  And I should see "interview"
