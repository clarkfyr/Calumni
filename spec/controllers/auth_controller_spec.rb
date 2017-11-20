require 'rails_helper'

# RSpec.describe AuthController, type: :controller do
#   describe ".google_callback" do
#     it "log in using gmail" do
#       stub_google_omniauth
#     end
#   end

# end
require 'spec_helper'

RSpec.describe AuthController, type: :controller do
  describe "upload" do
    it "can upload" do
      request.cookies[:email] = 'test@berkeley.edu'
      get :logout 
      #expect(response.cookies[:email]).to eq('test@berkeley.edu')
    end
  end
end
