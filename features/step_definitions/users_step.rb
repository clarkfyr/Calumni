
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
   cookie_string = headers['Set-Cookie']
   Capybara.current_session.driver.browser.set_cookie(cookie_string)
   visit home_path()
end

When /^(?:|I )follow Mentor$/ do
  # turns the phrase above into concrete actions
   visit path_to("google_callback")
   click_link('Mentor')
   page.driver.get('/auth/google_oauth2/callback')

end


When /^(?:|I )follow "(.*)"$/ do |link|
  # turns the phrase above into concrete actions

   click_link(link)
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

When /I (un)?check the following (filter_name): (.*)/ do |uncheck, filter_name, help_list|
  true
  # false
end

Given /^the following users exist/ do |peoples_table|
  peoples_table.hashes.each do |people|
     People.create people
  end
end


Given /^the following conversations exist/ do |conversation_table|
  conversation_table.hashes.each do |conversaion|
    Conversation.create conversaion
  end
end



When /^I check "(.*)" in checkbox "(.*)"$/ do |check_list, checkbox|
   pending # Write code here that turns the phrase above into concrete actions
   check_list.split(', ').each do |item|
     check("#{checkbox}_#{item}")
   end
end

Then /^I check the respond to request: "(.*)"$/ do |request_type|
   pending # Write code here that turns the phrase above into concrete actions
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

