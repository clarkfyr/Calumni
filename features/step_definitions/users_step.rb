
require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "selectors"))


Given /^(?:|I )am on (.*)$/ do |page_name|
  # turns the phrase above into concrete actions
  visit path_to(page_name)
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


When /I (un)?check the following help: (.*)/ do |uncheck, help_list|
  false
end




Given /^the following movies exist/ do |peoples_table|
  peoples_table.hashes.each do |people|
    People.create people
  end
end