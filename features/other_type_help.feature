#Feature: Send Message to Mentor
#  As a mentee
#  So that When I make a request
#  I should see “other” type of help
#
#  Background: users in database
#    Given the following users exist:
#
#      |username |     email       |lastname|role  |helpability|
#      |clark    |test1@berkeley.edu|fan    |mentee|           |
#      |yingying |test2@berkeley.edu|chen   |mentor| resume    |
#
#  Scenario: see other in help
#    Given I am on the home page
#    When I fill in "search" with "yingying"
#    And I press "Search"
#    Then I should see "yingying"
#    And I should see "other"
#    And I check "resume[requested]"
#
