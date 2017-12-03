require "rails_helper"

describe Message do
  context "When testing the Message class" do
    it "should fill out the created_at" do
      msg = Message.new
      msg.created_at = Date.parse('2015-10-01').strftime("%m/%d/%y at %l:%M %p")
      expect(msg.message_time).not_to eql(Date.parse('2015-10-01').strftime("%m/%d/%y at %l:%M %p"))
    end
  end

end
