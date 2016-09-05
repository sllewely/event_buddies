# Concert Buddies

An app for coordinating concerts and events with friends

### Setup

##### Register with Facebook

Site URL field must be filled with the URL that FB is called from.  Currently,
```http://localhost:3000/home```

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

