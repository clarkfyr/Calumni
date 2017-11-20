require 'rails_helper'
require 'spec_helper'

RSpec.describe CalumnisController, type: :controller do
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
      get :autocomplete 
      #expect(response.cookies[:email]).to eq('test@berkeley.edu')
    end
  end
end