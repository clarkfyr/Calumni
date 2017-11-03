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

root=Rails.root.to_s
# m1={:username=>"Ma yi",:email=>"yima@uiuc.edu",:avatar=>File.new("#{root}/app/assets/images/mayi.jpeg")}

people = [{:username=>"Ma yi",:email=>"yima@uiuc.edu",:description =>"dean of SIST ", :company=>"ShanghaiTech",:start_date => '2014/1/2', :avatar=>File.new("#{root}/app/assets/images/mayi.jpeg"),:position=>'professor'},
	{:username => 'steve jobs', :email => '1@gmail.com', :description => 'this is description1',:company => 'Apple',:start_date => '2017/1/2',:major=>'EECS',:position=>'CEO',:open_advice=>'advice 1',:helpability=>'resume',:avatar=>File.new("#{root}/app/assets/images/jobs.jpg")},
	{:username => 'taylor swift', :email => '2@gmail.com', :description => 'this is description2',:company => 'Amazon',:start_date => '2017/11/1',:major=>'CS',:open_advice=>'advice 2',:avatar=>File.new("#{root}/app/assets/images/taylor.jpg"),:position=>'singer'},
{:username => 'sam', :email => '3@gmail.com', :description => 'this is description3',:company => 'YC',:start_date => '2017/9/2',:major=>'Biology',:open_advice=>'advice 3',:avatar=>File.new("#{root}/app/assets/images/sam.jpg"),:position=>'investor'},
{:username => 'unknown', :email => '4@gmail.com', :description => 'this is description4',:company => 'Ali',:start_date => '2015/1/2',:major=>'EECS',:open_advice=>'advice 4',:avatar=>File.new("#{root}/app/assets/images/hero.jpg")},:position=>'COO']

people.each do |p|
  People.create!(p)
end
