require 'rails_helper'

RSpec.describe People, type: :model do
  describe "all_helps" do
    it "can see all_helps" do
	    expect(People.all_helps).to eq(["resume", "interview", "submit_referral", "company tour", "other"])
    end
  end
end