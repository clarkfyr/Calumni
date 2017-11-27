Feature: show_profile
  As a vistor
  so that I can see other mentor's profile

Scenario: See mentor's profile
  Given I am on sam-2017's profile page
  Then I should see "advice 3"
  Then I should see "investor"

Scenario: Can't see mentee's profile
  Given I am on menteeuser-1999's profile page
  Then I should not see "COO"
  Then I should not see "advice 4"

Scenario: See myself's profile

