Feature: Send Message to Mentor
  As a Mentee
  so that I can send a message to a mentor to ask for help
  I can choose request type
  I can type the message and press the send button

  Background: users in database
    Given the following users exist:
      |username   |email       |
      |clark      |test1@berkeley.edu  |
#      |Test_user2 |test2@berkeley.edu  | Facebook  |
#      |Test_user3 |test3@berkeley.edu  | Amazon    |
#      |Test_user4 |test4@berkeley.edu  | Yahoo     |
#      |Test_user5 |test5@berkeley.edu  | Oracle    |
#      |Test_user6 |test6@berkeley.edu  | Twitter   |
#      |Test_user7 |test7@berkeley.edu  | Apple     |
#      |Test_user8 |test8@berkeley.edu  | Uber      |

  Scenario:
    Given I am successfully signin with "test1@berkeley.edu"
    And I am on the home page
    Given I am on the home page
    When I fill in "search" with "YC"
    And I press "Search"
    And I follow "company"
    Then I should see "sam"
    When I follow "sam"
    Then I should be on sam's profile page
    When I follow "Message Me!"
    And I fill in "message_body" with "Dear mentor, Could you please help me with my resume?"
    And I check "resume[requested]"
    And I press "Add Reply"
    And I should be on 1's conversation page
    And I should not see "Please do not send empty message"

    And I fill in "message_body" with ""
    And I press "Add Reply"
    And I should be on 1's conversation page