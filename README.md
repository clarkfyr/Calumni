# Calumni: Student-Alumni-Network-App


[![Maintainability](https://api.codeclimate.com/v1/badges/c948f03bee21ebf22e1b/maintainability)](https://codeclimate.com/github/clarkfyr/Calumni/maintainability)

[![Test Coverage](https://api.codeclimate.com/v1/badges/c948f03bee21ebf22e1b/test_coverage)](https://codeclimate.com/github/clarkfyr/Calumni/test_coverage)


[![Build Status](https://travis-ci.org/clarkfyr/Calumni.svg?branch=master)](https://travis-ci.org/clarkfyr/Calumni)

- Link to deployed app on Heroku:
https://calumni-demo.herokuapp.com/

- Link to Pivotal Tracker project:
https://www.pivotaltracker.com/n/projects/2118464

- Brief Explanation:  
    The purpose of this App is to connect students with alumni in industry.  
    This is a Networking App where students can find alumni from industry to get help with:
    - referrals; resume feedback; mock interview; advice on career; company tours...  


- Link to Initial Customer Meeting:
https://www.youtube.com/watch?v=vLoHODcZZHo


- Installation
	* [ElasticSearch](https://www.elastic.co/guide/en/elasticsearch/reference/current/deb.html)
- Development
	* bundle install --without production
	* rake db:migrate
	* rake db:seed
	* source setenv.sh
- Testing:
	* rake db:seed RAILS_ENV=test --trace
- Production:
	* heroku 
	* setup environment variable for aws


