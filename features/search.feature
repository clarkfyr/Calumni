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
  Then I should be on the company page for "Google"
#  And I should not see "Facebook"

Scenario: Unsuccessfully search with a company name #Sad Path
  Given I am on the home page
  When I fill in "Search_Box" with "Calumni"
  And I press "Search"
  Then I should be on the company page for "Not Find"
  And I should see "There is no company called Calumni"

Scenario: Successfully filter with companies' name
  Given I am on the home page
  Then I should see "Company Filter"
  When I check "Google+Facebook" in checkbox "Company Filter"
#  When I check the following Company Filter: Google, Facebook
  And I press "Search"
  Then I should be on the company page for "Google+Facebook"

Scenario: Successfully filter with type of help
  Given I am on the home page
  Then I should see "Help Filter"
#  When I check the following Help Filter: Resume, Inteview
  And I check "Resume+Inteview" in checkbox "Help Filter"

  And I press "Search"
  Then I should be on the help page for "Resume+Inteview"