Feature: Send Message to Mentor
  As a Mentee
  so that I can send a message to a mentor to ask for help
  I can choose request type
  I can type the message and press the send button

  Background: users in database
    Given the following users exist:
      |username   |email               |id
      |clark      |test1@berkeley.edu  |1
      |yingying   |test2@berkeley.edu  |2

    Given the following conversations exist:
      | sender_id  | recipient_id | id
      | 1          | 2            | 1

    Given the following messages exist:
      | body | people_id | conversation_id
      | hi1  | 1         | 1
      | hi2  | 1         | 1
      | hi3  | 1         | 1
      | hi4  | 1         | 1
      | hi5  | 1         | 1
      | hi6  | 1         | 1
      | hi7  | 1         | 1
      | hi8  | 1         | 1
      | hi9  | 1         | 1
      | hi10 | 1         | 1
      | hi11 | 1         | 1
      | hi12 | 1         | 1

  Scenario: send message to mentor
    Given I am successfully signin with "test1@berkeley.edu"
    Given I am on the home page
    When I follow user image link "sam"
    And I follow "Message Me!"
    And I fill in "message_body" with "Dear mentor, Could you please help me with my resume?"
    And I check "resume[requested]"
    And I press "Add Reply"
    And I should be on 2's conversation page
    And I should see "Dear mentor, Could you please help me with my resume?"
    And I should not see "Please do not send empty message"

    And I fill in "message_body" with ""
    And I press "Add Reply"
    And I should see "Please do not send empty message"
    And I should be on 2's conversation page
    And I press "Search"
