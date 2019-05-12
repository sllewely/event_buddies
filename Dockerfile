FROM ruby:2.5-alpine AS build-env

RUN apk add --update build-base postgresql-dev tzdata yarn

# this isolates the Gemfile changes to different cache
# layer, so bundle install only gets re-run if the Gemfile changes
# and not if the npm deps or source files change.
WORKDIR /deps
COPY Gemfile Gemfile.lock /deps/
RUN bundle install -j 4

WORKDIR /app
COPY package.json yarn.lock ./
RUN yarn install --check-files

COPY . ./

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
