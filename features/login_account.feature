Feature: login
  As an existing mentor
  so that I can view my profile
  I want to login with my username and password

Scenario: Successfully login with correct login info
  Given I am on the home page
  When I follow "Sign In"
  Then I should be on the login page
  When I fill in "Username" with "username"
  And I fill in "Password" with "12345678"
  And I press "login"
  Then I should be on the details page for "Test_user"


Scenario: Unsuccessfully login with wrong login info #Sad Path
  Given I am on the home page
  When I follow "Sign In"
  Then I should be on the login page
  When I fill in "Username" with "username"
  And I fill in "Password" with "yulaoban"
  And I press "login"
  Then I should see "Wrong Username or Password"
