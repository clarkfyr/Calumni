require 'rails_helper'
require 'spec_helper'

RSpec.describe CalumnisController, type: :controller do
  describe '.showprofile' do
    before :each do
      @user1=create(:mentor, :username=>"factory1",:email=>"factory1@gmail.com")
      @user2=create(:mentor, :username=>"factory2",:email=>"factory2@gmail.com")
      cookies[:email]=@user1.email
    end
    it 'display nonexistent user' do
      get :showprofile, :username=>"nonexistent"
      expect(response).to have_http_status(404)
    end
    it 'display other user' do
      get :showprofile, :username=>@user2.username
      expect(response).to have_http_status(200)
    end
    it 'display myself' do
      get :showprofile, :username=>@user1.username
      # redirect to current user
      expect(response).to have_http_status(302)
    end

  end

end
