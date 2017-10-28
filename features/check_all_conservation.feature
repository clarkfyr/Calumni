Feature: User can check all conversations
As a user
	So that when I click the Message button on top of the page
	I can see all conversations on conversation page

Scenario:
	Given I am successfully signin with "test@berkeley.edu"
	And I am on the home page
	When I press "Conversation"
	Then I should be on the conversation page for "test@berkeley.edu"
