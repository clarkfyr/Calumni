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

## Instructions for environment setup
- Development
    * It is recommended to deploy this project locally instead of on cloud9, as elasticsearch cost much memory and you may not have access to port 9200 on cloud9.
	* bundle install --without production
	* rake db:migrate
	* rake db:seed
	* export GOOGLE_CLIENT_ID=xxx
	* export GOOGLE_CLIENT_SECRET=xxx
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
		* For macOS user, use brew 
			* `brew install https://raw.githubusercontent.com/Homebrew/homebrew-core/3f9a5fc50e42f6bdd17f955419c299653a0f65b9/Formula/elasticsearch.rb`
		* use curl -XGET 'localhost:9200/?pretty' to make sure you have start elasticsearch service
	* use 'rake searchkick:reindex CLASS=People' to build the index
	* use People.search("xxx" ,autocomplete:true,fields:[:username,:company]).map{|u| {username:u.username,company: u.company}}	to make sure your searchkick works
	* deploy to heroku
       * activate one of the elasticsearch provider like bonsai
       * connect searchkick with bonsai 
       		* heroku config:set ELASTICSEARCH_URL=`heroku config:get BONSAI_URL`
       * heroku run rake searchkick:reindex CLASS=People
	   * heroku run rake db:migrate


- Image/file upload
	* We use gem paperclip to support image upload and store them locally in development mode.
		* run sudo apt-get install imagemagick to install related library.
	* On heroku, we store images/files on AWS s3.
	* Setup AWS
		* create an s3 bucket 
		* setup environment variable for AWS 
	
			```
			heroku config:set S3_BUCKET_NAME=project_name
			heroku config:set AWS_ACCESS_KEY_ID=key_id
			heroku config:set AWS_SECRET_ACCESS_KEY=key
			heroku config:set AWS_REGION=region
			```

