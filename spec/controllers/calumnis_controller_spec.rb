require 'rails_helper'
require 'spec_helper'

RSpec.describe CalumnisController, type: :controller do
  describe '.showprofile' do
    before :each do
      @user1=create(:mentor, :url=>"factory1",:email=>"factory1@gmail.com")
      @user2=create(:mentor, :url=>"factory2",:email=>"factory2@gmail.com")
      cookies[:email]=@user1.email
    end
    it 'display nonexistent user' do
      get :showprofile, :url=>"nonexistent"
      expect(response).to have_http_status(404)
    end
    it 'display other user' do
      get :showprofile, :url=>@user2.url
      expect(response).to have_http_status(200)
    end
    it 'display myself' do
      get :showprofile, :url=>@user1.url
      # redirect to current user
      expect(response).to have_http_status(302)
    end

  end
  #let!(:admin) { create(:user, password: "Password123", admin: true) }
  # let!(:user) { create(:people, password: "Password456", admin: false) }

  # let!(:users) do
  #   [admin, user] + 3.times.map { create(:user) }
  # end

  # let!(:user_params) { user_params = { username: "username#{rand(1000)}",
  #                                      email: "user#{rand(1000)}@factory.com",
  #                                      password: "Password123",
  #                                      password_confirmation: "Password123",
  #                                      admin: false,
  #                                      description: "Nihil eligendi ab debitis iure.",
  #                                     } }

  # let!(:category) { create(:category, name: "Shirt") }
  # let!(:category1) { create(:category, name: "Short") }

  describe "upload" do
    it "can upload" do
      #request.cookies[:email] = 'test@berkeley.edu'
      get :upload 
      #expect(response.cookies[:email]).to eq('test@berkeley.edu')
    end
  end
  describe "create_account" do
    it "cannot create_account when other's username is nil" do
      #request.cookies[:email] = 'test@berkeley.edu'
      #expect(get: '/create_account').to route_to(controller: 'calumnis', action: 'create_account', path: 'foo/bar')      
      request.cookies[:email] = 'test@berkeley.edu'
      request.cookies[:name] = 'test'
      get :create_account 
      #expect(response.cookies[:email]).to eq('test@berkeley.edu')
    end
  end
  describe "update_profile" do
    it "can update_profile with resume" do
      #request.cookies[:email] = 'test@berkeley.edu'
      #expect(get: '/create_account').to route_to(controller: 'calumnis', action: 'create_account', path: 'foo/bar')      
#      @calumni=People.new()
#      @calumni.update_attributes(email:cookies[:email],username:cookies[:name],lastname:cookies[:lastname])
 #     @calumni.update_attribute(:role,'mentee')
 #     request.cookies[:email] = 'test@berkeley.edu'
 #     patch :update_profile, id: user.id, user: user_params
      #expect(response.cookies[:email]).to eq('test@berkeley.edu')
    end
  end
  describe "create_account" do
    it "can autocomplete" do
      #request.cookies[:email] = 'test@berkeley.edu'
      #expect(get: '/create_account').to route_to(controller: 'calumnis', action: 'create_account', path: 'foo/bar')      
      request.cookies[:email] = 'test@berkeley.edu'
      #get :autocomplete 
      #expect(response.cookies[:email]).to eq('test@berkeley.edu')
    end
  end
  describe "store_feedback" do
    it "can store feedback" do
      #controller.store_feedback
    end
  end
end