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
		* setup environment for elasticsearch

- Search feature
	* We use gem Searchkick to implement search function, while Searchkick supports the complete Elasticsearch Search API. You have to install elasticsearch before you can use searchkick.
	* ElasticSearch Installation
		* [Installation](https://www.elastic.co/guide/en/elasticsearch/reference/5.6/zip-targz.html), currently using 5.6.4
		* use curl -XGET 'localhost:9200/?pretty' to make sure you have start elasticsearch service
	* use 'rake searchkick:reindex CLASS=People' to build the index
	* use People.search("xxx" ,autocomplete:true,fields:[:username,:company]).map{|u| {username:u.username,company: u.company}}	to make sure your searchkick works
	* deploy to heroku
       * activate one of the elasticsearch provider like bonsai
       * connect searchkick with bonsai 
       		* heroku config:set ELASTICSEARCH_URL=`heroku config:get BONSAI_URL`
       * heroku run rake searchkick:reindex CLASS=People
	   * heroku run rake db:migrate
    
