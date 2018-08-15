# README

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

Obtain two credential files from one of the team members
```
config/credentials.yml.enc
config/master.key
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
```pg_ctl -D /usr/local/var/postgres start```
Stop db
```pg_ctl -D /usr/local/var/postgres stop -s -m fast```

And visit
[http://localhost:3000/](http://localhost:3000/)


## Development


Seed some example data in development
```rake db:seed```

Annotate models whenever you change the db schema
```rake annotate_models```

Run tests
```bundle exec rspec```

