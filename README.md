# Concert Buddies

An app for coordinating concerts and events with friends

### Setup

##### From Scratch

```
git clone git@github.com:sllewely/concert_buddies.git
cd concert_buddies
rbenv install 2.4.1
gem install bundler
brew install postgresql
bundle install
```

??? bundle update ???

Setup the database
```
brew install postgresql
```
Start the db server running
```
pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start
```
(Stop manually with:)
```
pg_ctl -D /usr/local/var/postgres stop -s -m fast
```
Continue db setup
```
createdb concert_development
createdb concert_test
createdb concert_production
bundle exec rake db:migrate
```


##### For a demo

```
bundle exec rake db:seed
```

##### Register with Facebook

Site URL field must be filled with the URL that FB is called from.  Currently,
```http://localhost:3000/```

Valid OAuth redirect URIs must be filled with the call where we receive the response
```http://localhost:3000/auth/facebook/callback````

##### Environment variables

Install Figaro gem
```
bundle exec figaro install
```

Register the app with facebook
Set FACEBOOK_KEY and FACEBOOK_SECRET in the application.yml file created by Figaro

application.yml should also be in .gitignore as a result of figaro.  It is best practice to never push these keys to github or otherwise share them.


```
rails server -p 3000
```

### Project management

*slack channel* : https://concertbuddies.slack.com

*trello* : https://trello.com/concertbuddiesteam/members

