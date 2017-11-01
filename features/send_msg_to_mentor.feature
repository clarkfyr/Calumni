Feature: Send Message to Mentor
  As a Mentee
  so that I can send a message to a mentor to ask for help
  I can choose request type
  I can type the message and press the send button

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

  Scenario:
    Given I am successfully signin with "mentee_user@berkeley.edu"
    And I am on the home page
    Then I should see "Company Filter"
    When I check "Google" in checkbox "Company Filter"
    And I press "Search"
    Then I should be on the company page for "Google"
    Then I should see "Mentor_one"
    When I follow "Mentor_one"
    Then I should be on the Details Page for "mentor_user@berkeley.edu"
    When I press "Message"
    And I fill in "Msg" with "Dear mentor, Could you please help me with my resume?"
  #  And I check the following help: "Resume"
    And I check "Resume" in checkbox "Helper with"
    And I press "Send"
    Then I should see "Successfully send message."
