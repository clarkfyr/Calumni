Feature: Mentor Respond to Message
As a Mentor
  so that I can send a message to mentee
  I can respond to a message with Accept/Reject/Done




 Background: logined user
    Given the following users exist:
      |username |     email       |
      |clark      |test1@berkeley.edu  |


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


  Given I am successfully signin with "3@gmail.com"
  And I am on the home page
  When I follow "Message"
  Then I should be on the conversations page
  And I should see "clark"
  When I follow "clark"
  And I should be on 1's conversation page
#  And I should see "Dear mentor, Could you please help me with my resume?"
#  And I check the respond to request: "Accept"



