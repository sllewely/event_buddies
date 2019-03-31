#!/bin/sh

docker-compose up --build -d
docker-compose run --rm web bin/rails db:create db:migrate
