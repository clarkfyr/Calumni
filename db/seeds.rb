# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# 
# People.create(email: "holly@gmail.com", password: "abc123", password_confirmation: "abc123")
# People.create(email: "iliketoshop@gmail.com", password: "abc123", password_confirmation: "abc123")
# People.create(email: "ross123@hotmail.com", password: "abc123", password_confirmation: "abc123")
# People.create(email: "charlie@gmail.com", password: "abc123", password_confirmation: "abc123")
# People.create(email: "bluedresses4va@gmail.com", password: "abc123", password_confirmation: "abc123")


people = [{:usename => 'A', :email => '1@gmail.com', :description => 'this is description1',:company => 'Google',:start_date => '2017/1/2',:major=>'EECS',:open_advice=>'advice 1'},
	{:usename => 'B', :email => '2@gmail.com', :description => 'this is description2',:company => 'Amazon',:start_date => '2017/11/1',:major=>'CS',:open_advice=>'advice 2'},
{:usename => 'C', :email => '3@gmail.com', :description => 'this is description3',:company => 'Ebay',:start_date => '2017/9/2',:major=>'Biology',:open_advice=>'advice 3'},
{:usename => 'An', :email => '4@gmail.com', :description => 'this is description4',:company => 'Goo',:start_date => '2015/1/2',:major=>'EECS',:open_advice=>'advice 4'},
{:usename => 'Lol', :email => '5@gmail.com', :description => 'this is description5',:company => 'Microsoft',:start_date => '2005/1/2',:major=>'CS',:open_advice=>'advice 5'},
{:usename => 'Clark', :email => '6@gmail.com', :description => 'this is description6',:company => 'Goo',:start_date => '2015/10/2',:major=>'EECS',:open_advice=>'advice 6'},]

people.each do |p|
  People.create!(p)
end

