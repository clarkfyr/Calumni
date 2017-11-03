Feature: search
  As a visitor
  so that I can search for alumni of UC Berkeley by name and company
  and I filter to companies I am intested in
  and I can filter by type of help I need

Background: users in database
  
  Given the following users exist:
    |username   |email               | company   |
    |Test_user1 |test1@berkeley.edu  | Google    |
    |Test_user2 |test2@berkeley.edu  | Facebook  |
    |Test_user3 |test3@berkeley.edu  | Amazon    |
    |Test_user4 |test4@berkeley.edu  | Yahoo     |
    |Test_user5 |test5@berkeley.edu  | Oracle    |
    |Test_user6 |test6@berkeley.edu  | Twitter   |
    |Test_user7 |test7@berkeley.edu  | Apple     |
    |Test_user8 |test8@berkeley.edu  | Uber      |


Scenario: Successfully search with a company name
  Given I am on the home page
  When I fill in "Search_Box" with "Google"
  And I press "Search"
  And I follow "company"
  Then I should see "Test_user1"
  And I should not see "Test_user2"

Scenario: Unsuccessfully search with a company name #Sad Path
  Given I am on the home page
  When I fill in "Search_Box" with "Alibaba"
  And I press "Search"
  Then I should see "0 result about "Alibaba""
  
Scenario: Successfully search with an alumni name
  Given I am on the home page
  When I fill in "Search_Box" with "Test_user1"
  And I press "Search"
  And I should see "Google"
  And I should not see "Facebook"

Scenario: Unsuccessfully search with an alumni name #Sad Path
  Given I am on the home page
  When I fill in "Search_Box" with "Test_user10"
  And I press "Search"
  Then I should see "0 result about "Test_user10""

Scenario: Successfully follow company I am interested in
  Given I am on the home page
  Then I should see "startup-logo"
  When I follow "Google"
  Then I should see "Test_user1"
  And I should not see "Test_user2"
  And I should see "Google"
  And I should not see "Facebook"

  
Scenario: Successfully follow alumni I am interested in
  Given I am on the home page
  Then I should see "Test_user1"
  When I follow "Test_user1"
  Then I should see "Test_user1"
  And I should not see "Test_user2"
  And I should see "Google"
  And I should not see "Facebook"
