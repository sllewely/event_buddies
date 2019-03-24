# README

## About

This is an app for letting friends know about upcoming events that they may be interested in, without resorting to individual invites or something as clunky/weighty as Facebook Groups or events.

The goal is to be able to broadcast events to tailored groups of people, without the pressure of an individualized invite.

[New dev guide](https://github.com/sllewely/concert_buddies/blob/master/NEWDEV.md)


## Technologies Used

Ruby version 2.5.1
Rails version 5.2.0

## Install

Get Ruby version

```
brew update && brew upgrade ruby-build
rbenv install 2.5.1
rbenv local 2.5.1
gem install bundle
bundle install
```

```
brew upgrade yarn
yarn install
```

postgres

```
brew install postgresql
# or
brew upgrade postgresql
brew postgresql-upgrade-database

rails db:create
rails db:migrate
```

## Run

Start server

```
rails s
```

Start db
`pg_ctl -D /usr/local/var/postgres start`
Stop db
`pg_ctl -D /usr/local/var/postgres stop -s -m fast`

And visit
[http://localhost:3000/](http://localhost:3000/)

## Development

Seed some example data in development
`rake db:seed`

Annotate models whenever you change the db schema
`rake annotate_models`

Run tests
```
bundle exec rails db:migrate RAILS_ENV=test
bundle exec rspec
```
