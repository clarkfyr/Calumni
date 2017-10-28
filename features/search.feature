@ignore
Feature: search
  As a visitor
  so that I can search for alumni of UC Berkeley by name and company
  and I filter to companies I am intested in
  and I can filter by type of help I need

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