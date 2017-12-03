require 'rails_helper'

RSpec.describe People, type: :model do
  describe "all_helps" do
    it "can see all_helps" do
	    expect(People.all_helps).to eq(["resume", "interview", "submit_referral", "company tour", "general advice"])
    end
  end
  describe "mentor_response" do
  	it "can see mentor_response" do
	    expect(People.mentor_response).to eq(["Accept", "Reject", "Done"])
  	end
  end
  describe "cust_search" do
  	it "can see cust_search" do
	    expect(People.cust_search('search','type'))
  	end
  end
end