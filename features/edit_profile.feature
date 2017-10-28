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
  Then I should see "Edit"

Scenario: Edit Username
  Given I am on the Profile page
  When I follow "Edit"
  And I fill in "Username" with "Test_user"
  And I press "Update"
  And I should see "Test_user"

Scenario: Edit Description
  Given I am on the Profile page
  When I follow "Edit"
  And I fill in "Description" with "Hello World"
  And I press "Update"
  And I should see "Hello World"

Scenario: Edit Company
  Given I am on the Profile page
  When I follow "Edit"
  And I fill in "Company" with "Google"
  And I press "Update"
  And I should see "Google"

Scenario: Edit Position
  Given I am on the Profile page
  When I follow "Edit"
  And I select "CEO" in "Position"
  And I press "Update"
  And I should see "CEO"
  
Scenario: Edit Start Date
  Given I am on the Profile page
  When I follow "Edit"
  And I fill in "Start Date" with "10/27/2017"
  And I press "Update"
  And I should see "10/27/2017"
