require "rails_helper"

describe Message do
  context "When testing the Message class" do
    it "should say 'Hello World' when we call the say_hello method" do
      hw = Message.new
      message = hw.say_hello
      expect(message).to eq "Hello World!"
    end

    it "should fill out the created_at" do
      msg = Message.new
      msg.created_at = Date.parse('2015-10-01')
      expect(msg.message_time).to eql(Date.parse('2015-10-01').strftime("%m/%d/%y at %l:%M %p"))
    end
  end

end