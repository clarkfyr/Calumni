require 'rails_helper'
require 'spec_helper'

RSpec.describe "CalumnisController", type: :request do

  describe '.create_account' do
    it 'is a old user' do
      @user1=create(:mentor, :username=>"factory1",:email=>"factory1@gmail.com")
      cookies[:email]=@user1.email
      get "/create_account"
      expect(response).to have_http_status(302)
    end
    it 'is a new user' do
      # go to google_oauth
      stub_google_omniauth
      stub_request(:get,'/o/oauth2/auth').to_return(headers:{"omniauth.auth" =>OmniAuth.config.mock_auth[:google]},body:%(Ignore me))
      # stub_request(:get,'/auth/google_oauth2/callback').to_return(headers:{'Content-Type'=>'text/plain'},body:%(Ignore me))

      
      # request.env["omniauth.auth"]=
      get "/auth/google_oauth2/callback",{},{"omniauth.auth"=>OmniAuth.config.mock_auth[:google]}
      # request.env["omniauth.auth"]=

      get "/create_account"
      # byebug
      expect(response).to have_http_status(302)
      # expect(cookies[:email]).to eq "stub_google_omniauth@gmail.com"
    end
  end

end
