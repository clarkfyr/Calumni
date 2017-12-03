root=Rails.root.to_s

(1..4).each do
  (1..44).each do |i|
    username=Faker::Name.name
    email=Faker::Internet.email
    company=Faker::Company.name
    position=Faker::Job.title
    val=rand(1...1000000).to_s
    url=username.split(" ").join("-").split(".").join("-")+val
    avatar=File.new("#{root}/app/assets/images/"+i.to_s+".jpg")
    params={:username=>username,:email=>email, :company=>company, :avatar=>avatar,:position=>position,:role=>"mentor",:url=>url}
    People.create!(params)
  end
end

["Amazon","google","facebook","snapchat"].each do |j|
  (1..12).each do |i|
    username=Faker::Name.name
    email=Faker::Internet.email
    company=j
    position=Faker::Job.title
    val=rand(1...1000000).to_s
    url=username.split(" ").join("-").split(".").join("-")+val
    avatar=File.new("#{root}/app/assets/images/"+i.to_s+".jpg")
    params={:username=>username,:email=>email, :company=>company, :avatar=>avatar,:position=>position,:role=>"mentor",:url=>url}
    People.create!(params)
  end
end


# people = [{:username=>"Ma yi",:email=>"yima@uiuc.edu",:description =>"dean of SIST ", :company=>"ShanghaiTech",:start_date => '2014/1/2', :avatar=>File.new("#{root}/app/assets/images/mayi.jpeg"),:position=>'professor',:role=>"mentor",:url=>"mayi-1000"},
#   {:username => 'steve jobs', :email => '1@gmail.com', :description => 'this is description1',:company => 'Apple',:start_date => '2017/1/2',:major=>'EECS',:position=>'CEO',:open_advice=>'advice 1',:helpability=>['resume'],:avatar=>File.new("#{root}/app/assets/images/jobs.jpg"),:role=>"mentor",:url=>"jobs-20"},
#   {:username => 'taylor swift', :email => '2@gmail.com', :description => 'this is description2',:company => 'Amazon',:start_date => '2017/11/1',:major=>'CS',:open_advice=>'advice 2',:avatar=>File.new("#{root}/app/assets/images/taylor.jpg"),:position=>'singer',:role=>"mentor",:url=>"taylor-2000"},
# {:username => 'sam', :email => '3@gmail.com', :description => 'this is description3',:company => 'YC',:start_date => '2017/9/2',:major=>'Biology',:open_advice=>'advice 3',:avatar=>File.new("#{root}/app/assets/images/sam.jpg"),:helpability=>['resume'],:position=>'investor',:role=>"mentor",:url=>"sam-2017"},
# {:username => 'mentee-user', :email => '4@gmail.com', :description => 'this is description4',:company => 'Ali',:start_date => '2015/1/2',:major=>'EECS',:open_advice=>'advice 4',:avatar=>File.new("#{root}/app/assets/images/hero.jpg"),:position=>'COO',:role=>"mentee",:url=>"menteeuser-1999"}]

# people.each do |p|
#   People.create!(p)
# end


