Feature: User can check all conversations
As a user
	So that when I click the Message button on top of the page
	I can see all conversations on conversation page

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


Scenario: can see all conversations
	Given I am successfully signin with "test2@berkeley.edu"
	And I am on the home page
	When I follow "Mailbox"
	Then I should be on the conversations page
	Then I should see "clark"
	And I should see "Ma yi"


Scenario: show no more than 10 messages on conversation page
	Given I am successfully signin with "test2@berkeley.edu"
	When I follow "Mailbox"
	Then I should see "clark"
	When I follow "clark"
  And I fill in "message_body" with "msg1"
  And I press "Send"
  And I fill in "message_body" with "msg2"
  And I press "Send"
  And I fill in "message_body" with "msg3"
  And I press "Send"
  And I fill in "message_body" with "msg4"
  And I press "Send"
  And I fill in "message_body" with "msg5"
  And I press "Send"
  And I fill in "message_body" with "msg6"
  And I press "Send"
  And I fill in "message_body" with "msg7"
  And I press "Send"
  And I fill in "message_body" with "msg8"
  And I press "Send"
  And I fill in "message_body" with "msg9"
  And I press "Send"
  And I fill in "message_body" with "msg10"
  And I press "Send"
  And I fill in "message_body" with "msg11"
  And I press "Send"
  And I fill in "message_body" with "msg12"
  And I press "Send"
  Then I should see "msg12"
  And I should not see "msg2"
  And I should see "Show Previous"
  When I follow "Show Previous"
  Then I should see "msg2"
