FactoryBot.define do
  factory :mentor, class: People do
    description "testdescription"
    start_date "teststart_date"
    company "testcompany"
    position "testposition"
    helpability "testhelpability"
    major "testmajor"
    open_advice "testopen_advice"
    graduation_date "testgraduation_date"
    username "testusername"
    lastname "testlastname"
    role "mentor"
  end
end
