Feature: Mentor Respond to Message
As a Mentor
  so that I can send a message to mentee
  I can respond to a message with Accept/Reject/Done




 Background: logined user
    Given the following users exist:
      |username |     email       |
      |mentor|mentor@berkeley.edu |

   Given the following conversations exist:
     |sender_id |     recipient_id      |
     |4         |6                      |




  Scenario:
  Given I am successfully signin with "mentor@berkeley.edu"
  And I am on the home page
  When I follow "Message"
  Then I should be on the conversations page
  And I should see "sam"
#  And I should see "Dear mentor, Could you please help me with my resume?"
#  And I check the respond to request: "Accept"



