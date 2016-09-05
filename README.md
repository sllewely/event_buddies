# Concert Buddies

An app for coordinating concerts and events with friends

### Setup

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

