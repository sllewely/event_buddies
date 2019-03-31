#!/bin/sh

docker-compose run -e RAILS_ENV=test --rm web bin/rails db:create db:migrate
docker-compose run -e RAILS_ENV=test --rm web bundle exec rspec

docker-compose down
