@ignore
Feature: login
  As an existing mentor
  so that I can view my profile
  I want to login with my username and password

#Background: users in database
#
#  Given the following movies exist:
#    |username |password |email                 | description |
#    |username |12345678 |username@berkele.edu  | None |
#

Scenario: Successfully login with correct login info
  Given I am on the home page
  When I press "Login"
  Then I should be on the login page
  When I fill in "Username" with "username"
  And I fill in "Password" with "12345678"
  And I press "Login"
  Then I should be on the Details Page for "username"


Scenario: Unsuccessfully login with wrong login info #Sad Path
  Given I am on the home page
  When I press "Login"
  Then I should be on the login page
  When I fill in "Username" with "username"
  And I fill in "Password" with "yulaoban"
  And I press "Login"
  Then I should see "Wrong Username or Password"
