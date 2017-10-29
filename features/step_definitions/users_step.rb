
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
  true
  # return true

  # #sign in with specific user email
   headers = {}
   Rack::Utils.set_cookie_header!(headers, :email, email)
   cookie_string = headers['Set-Cookie']
   Capybara.current_session.driver.browser.set_cookie(cookie_string)
   visit home_path()
end

When /^(?:|I )follow Mentor$/ do
  true
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

# Then /^(?:|I )should not see "([^"]*)"$/ do |text|
#   if page.respond_to? :should
#     page.should have_no_content(text)
#   else
#     assert page.has_no_content?(text)
#   end
# end

Then /^(?:|I )should not see \/([^\/]*)\/$/ do |regexp|
  true

  # regexp = Regexp.new(regexp)
  #
  # if page.respond_to? :should
  #   page.should have_no_xpath('//*', :text => regexp)
  # else
  #   assert page.has_no_xpath?('//*', :text => regexp)
  # end
end

When /I (un)?check the following (filter_name): (.*)/ do |uncheck, filter_name, help_list|
  true
  # false
end

Given /^the following users exist/ do |peoples_table|
  true

  # peoples_table.hashes.each do |people|
  #   People.create people
  # end
end


When /^I check "(.*)" in checkbox "(.*)"$/ do |check_list, checkbox|
  true
  # pending # Write code here that turns the phrase above into concrete actions
  # check_list.split(', ').each do |item|
  #   check("#{checkbox}_#{item}")
  # end
end

Then /^I check the respond to request: "(.*)"$/ do |request_type|
  true
  # pending # Write code here that turns the phrase above into concrete actions
  # check("respond_#{request_type}")
end

When /^I select "(.+)" in "(.+)"$/ do |position,option|
  true
  # select(position, :from => option)
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
