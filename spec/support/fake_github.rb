def stub_google_omniauth
  OmniAuth.config.test_mode=true
  OmniAuth.config.mock_auth[:google] = OmniAuth::AuthHash.new({
    "provider" => "google_oauth2",
    "uid" => "1234567890",
    "info" => {
      "name" => "Test User",
      "email" => "stub_google_omniauth@gmail.com",
    },
    "credentials" => {
      "token" => "TEST_TOKEN",
      "refresh_token" => "TEST_REFRESH_TOKEN",
      "expires_at" => DateTime.now, # 3000/1/1
    }
  })
end
