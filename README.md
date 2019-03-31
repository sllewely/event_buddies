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

## Docker Compose setup

Note: This is pretty new, and may have some rough edges:

On Mac, install [Docker Desktop for Mac](https://docs.docker.com/docker-for-mac/install/). This _should_ be all the setup needed, but I couldn't test it.

On Linux, install `docker` and `docker-compose` from your distro's repository. Ensure you add your user to the `docker` group and restart or log in/out of your session.

To start the local dev environment run:
```
./dev.sh
```
This may take a few minutes the first time you run it, but subsequent runs will be faster as the docker image layers will be cached.
The dev environment should now be available at [http://localhost:3000/](http://localhost:3000/)

If you change any of the gem or npm dependencies, run `./dev.sh` again so the image will be rebuilt with the new dependencies.

If you would like to tail the dev server's logs run:
```
docker-compose logs -f
```

If you would like to stop the dev environment, run:
```
docker-compose kill
```

If you would like to completely wipe the current environment (*including wiping your local database*):
```
docker-compose down
```

You can run tests with:
```
./test.sh
```
