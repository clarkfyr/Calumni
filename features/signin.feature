@ignore
Feature: signin
  As a calumni
  so that I can signup as alumni with gmail account
  I can go back to the previous page
  I can edit my profile

Background: users in database
  
  Given the following users exist:
    |username  |email    | description |
    |Test_user |test@berkeley.edu  | None |

Scenario: Successfully enter homepage
  Given I am on the home page
#  Then I should see "Signin"
#  Then I should see "Signup"
#  Then I should see "search_box"
#  Then I should see "search"
#  Then I should see "company_box"
#  Then I should see "position_box"
#  Then I should see "company_show"
#  Then I should see "mentor_show"

Scenario: Successfully signin with CalID
  Given I am on the home page
#  Then I should see "Signin"
#  When I follow "Signin"
#  When I follow Mentor
#  Then I should see "Google"
#  And fill in "Email or phone" with "test@berkeley.edu"
#  And fill in "Password" with "123456"