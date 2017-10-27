Feature: Send Message to Mentor
As a Mentee
  so that I can send a message to a mentor to ask for help
  I can choose request type
  I can type the message and press the send button

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
  And I check the following help: "Resume"
  And I press "Send"
  Then I should see "Successfully send message."
