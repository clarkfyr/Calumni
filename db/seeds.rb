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

people = [{:username=>"Ma yi",:email=>"yima@uiuc.edu",:description =>"dean of SIST ", :company=>"ShanghaiTech",:start_date => '2014/1/2', :avatar=>File.new("#{root}/app/assets/images/mayi.jpeg"),:position=>'professor',:role=>"mentor",:url=>"mayi-1000",:helped_count=>1},
  {:username => 'Steve Wozniak', :email => 'woz@gmail.com', :description => 'One of the founders of Apple and the inventer of Apple II computer',:company => 'Apple',:start_date => '1976/4/1',:major=>'EECS',:position=>'Entrepreneur',:open_advice=>'Are you the person who is willing to build in your garage?',:helpability=>['resume'],:avatar=>File.new("#{root}/app/assets/images/woz.jpg"),:role=>"mentor",:url=>"wozniak-20",:helped_count=>2},
	# {:username => 'steve jobs', :email => '1@gmail.com', :description => 'this is description1',:company => 'Apple',:start_date => '2017/1/2',:major=>'EECS',:position=>'CEO',:open_advice=>'advice 1',:helpability=>['resume'],:avatar=>File.new("#{root}/app/assets/images/jobs.jpg"),:role=>"mentor",:url=>"jobs-20"},
	{:username => 'taylor swift', :email => '2@gmail.com', :description => 'this is description2',:company => 'Amazon',:start_date => '2017/11/1',:major=>'CS',:open_advice=>'advice 2',:avatar=>File.new("#{root}/app/assets/images/taylor.jpg"),:position=>'singer',:role=>"mentor",:url=>"taylor-2000",:helped_count=>1},
{:username => 'Sam Altman', :email => '3@gmail.com', :description => 'this is description3',:company => 'YC',:start_date => '2014/1/2',:major=>'Biology',:open_advice=>'advice 3',:avatar=>File.new("#{root}/app/assets/images/sam.jpg"),:helpability=>['resume','interview'],:position=>'investor',:role=>"mentor",:url=>"sam-2017",:helped_count=>0},
{:username => 'mentee-user', :email => '4@gmail.com', :description => 'this is description4',:company => 'Ali',:start_date => '2015/1/2',:major=>'EECS',:open_advice=>'advice 4',:avatar=>File.new("#{root}/app/assets/images/hero.jpg"),:position=>'COO',:role=>"mentee",:url=>"menteeuser-1999"},
{:username => '11-user', :email => '5@gmail.com', :description => 'this is description4',:company => 'Ali',:start_date => '2015/1/2',:major=>'EECS',:open_advice=>'advice 4',:avatar=>File.new("#{root}/app/assets/images/hero.jpg"),:position=>'COO',:role=>"mentor",:url=>"allhelp-1999",:helped_count=>0,:helpability=>['resume','interview','submit_referral', 'company tour','general advice']},
]

people.each do |p|
  People.create!(p)
end
