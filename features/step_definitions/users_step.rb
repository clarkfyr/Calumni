
require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "selectors"))


Given /^(?:|I )am on (.*)$/ do |page_name|
  # turns the phrase above into concrete actions
  visit path_to(page_name)
end

#!!!
Given /^(?:|I )am successfully signin with "(.+)"$/ do |email|
  # #sign in with specific user email
  headers = {}
  Rack::Utils.set_cookie_header!(headers, :email, email)
  Rack::Utils.set_cookie_header!(headers, :firstname, People.where(email:email).first.firstname)
  #Rack::Utils.set_cookie_header!(headers, :username, People.where(email:email).first.username)
  cookie_string = headers['Set-Cookie']
  Capybara.current_session.driver.browser.set_cookie(cookie_string)
   # set lastname
  # visit home_path()
  visit create_account_path
end

When /^(?:|I )follow Mentor$/ do
  # turns the phrase above into concrete actions
   visit path_to("google_callback")
   click_link('Mentor')
   page.driver.get('/auth/google_oauth2/callback')

end

When /^(?:|I )follow Logout$/ do
  Capybara.reset_sessions!
  visit home_path()
end

When /^(?:|I )follow "(.*)"$/ do |link|
  # turns the phrase above into concrete actions
   first(:link, link).click
end



When /^(?:|I )press "(.*)"$/ do |button|
    click_button(button)
end

Then /^(?:|I )should be on (.+)$/ do |page_name|
  # turns the phrase above into concrete actions

  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should
     current_path.should == path_to(page_name)
  else
     assert_equal path_to(page_name), current_path
  end
end


When("In id {string} I should see {string}") do |id, text|
  if page.respond_to? :should
    page.find_by_id(id).value.should have_content(text)
  else
    assert page.has_content?(text)
  end
end

When /^(?:|I )fill invisible field in "(.*)" with "(.*)"$/ do |field, value|
  find("##{field.downcase}_search").set(value)
end

When /^(?:|I )fill in "(.*)" with "(.*)"$/ do |field, value|
  fill_in(field, :with => value)
end


When /^(?:|I )fill in "(.*)" for "(.*)"$/ do |value, field|
  fill_in(field, :with => value)
end


When /^(?:|I )upload "(.*)" with "(.*)"$/ do |field, path|
  attach_file(field, File.expand_path("./db/"+path))
end

Then /^(?:|I )should see "(.*)"$/ do |text|
  if page.respond_to? :should
     page.should have_content(text)
  else
     assert page.has_content?(text)
  end
end

#Then /^(?:|I )should see notice "(.*)"$/ do |text|
#  page.have_css?("notice", text: text)
#end


When /I (un)?check the following (filter_name): (.*)/ do |uncheck, filter_name, help_list|
  true
  # false
end

Given /^the following users exist/ do |peoples_table|
  peoples_table.hashes.each do |people|
     People.create people
  end
  People.reindex
end


Given /^the following conversations exist/ do |conversations_table|
  conversations_table.hashes.each do |conversaion|
    Conversation.create conversaion
  end
end

Given /^the following messages exist/ do |messages_table|
  messages_table.hashes.each do |message|
    Message.create message
  end
end

When /^I check "(.*)"$/ do |checkbox|
  check("helps_#{checkbox}")
end

When /^I collection-check "(.*)"$/ do |checkbox|
  checkbox.split().each do|help|
    check("people_helpability_#{help}")
  end
end

Then /^I check the respond to request: "(.*)"$/ do |request_type|
   check("respond_#{request_type}")
end

When /^I select "(.+)" in "(.+)"$/ do |position,option|
   select(position, :from => option)
end


Then /^(?:|I )should not see "([^"]*)"$/ do |text|
  if page.respond_to? :should
    page.should have_no_content(text)
  else
    assert page.has_no_content?(text)
  end
end

Then /^(?:|I )should not see \/([^\/]*)\/$/ do |regexp|
  regexp = Regexp.new(regexp)

  if page.respond_to? :should
    page.should have_no_xpath('//*', :text => regexp)
  else
    assert page.has_no_xpath?('//*', :text => regexp)
  end
end

When /^I upload a photo$/ do
  attach_file('people_avatar', @test_jpg_file_path)
end

Then /^I should see the image$/ do
  if page.respond_to? :should
      page.should have_content(@test_jpg_file_path)
    else
      assert page.has_content?(@test_jpg_file_path)
    end
end

When /^I upload a resume/ do
  attach_file('people_resume', @test_file_path)
end

Then /^I should see the resume$/ do
  if page.respond_to? :should
      page.should have_content(@test_file_path)
    else
      assert page.has_content?(@test_file_path)
    end
end

When /^I follow company image link "([^"]*)"$/ do |img_alt|
    find(:xpath, "//img[@alt = '#{img_alt}']/parent::a").click()
end


When /^I follow user image link "(.*)"$/ do |name|
  find(:xpath, "//a[@id = '#{name}']").click()
end

When /I (un)?check the following help type: (.*)/ do |uncheck, help_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
  help_list.split(', ').each do |help|
    if uncheck
      uncheck("help_type#{help}")
    else
      check("help_type#{help}")
    end
  end
end

