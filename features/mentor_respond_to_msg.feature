Feature: Mentor Respond to Message
As a Mentor
  so that I can send a message to mentee
  I can respond to a message with Accept/Reject/Done

Background: logined user
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

Scenario:
  Given I am successfully signin with "test1@berkeley.edu"
  And I am on the home page
  When I follow user image link "sam"
  Then I follow "Message Me!"

  And I fill in "message_body" with "Dear Sam, Could you please help me with my resume?"
  And I check "resume[requested]"
  And I press "Add Reply"
  And I should be on 2's conversation page

  Given I am successfully signin with "3@gmail.com"
  When I follow "Message"
  Then I should be on the conversations page
  And I should see "clark"
  When I follow "clark"
  And I should be on 2's conversation page
  #And I should see "Dear Sam, Could you please help me with my resume?"
  #And I check the respond to request: "Accept"

