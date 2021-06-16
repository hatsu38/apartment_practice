# docker build -f docker/production/Dockerfile -t apartment-practice-nginx-rails .
# docker tag apartment-practice-nginx-rails:latest $AWS_ACCOUNT_ID.dkr.ecr.ap-northeast-1.amazonaws.com/apartment-practice-nginx-rails:latest
# docker push $AWS_ACCOUNT_ID.dkr.ecr.ap-northeast-1.amazonaws.com/apartment-practice-nginx-rails:latest

FROM ruby:2.7.2 AS base

ENV APP_ROOT /app
WORKDIR $APP_ROOT
ENV LANG C.UTF-8
ENV TZ Asia/Tokyo
ENV RAILS_ENV production
ENV BUNDLE_DEPLOYMENT true
ENV BUNDLE_PATH vendor/bundle
ENV BUNDLE_WITHOUT development:test
ENV NODE_MAJOR_VERSION 14

RUN gem update --system && gem install bundler:2.1.4

# == builder
FROM base AS builder

# Add packages
RUN curl -sL https://deb.nodesource.com/setup_$NODE_MAJOR_VERSION.x | bash - && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo 'deb http://dl.yarnpkg.com/debian/ stable main' > /etc/apt/sources.list.d/yarn.list && \
    apt-get update -qq && \
    apt-get install -y --no-install-recommends \
    vim locales build-essential curl libpq-dev libmariadb-dev nodejs yarn

# == bundle
FROM builder AS bundle

# Install gems
COPY Gemfile Gemfile.lock .
RUN bundle install && rm -rf $BUNDLE_PATH/ruby/$RUBY_VERSION/cache/*

# == yarn
FROM builder AS yarn

# Install yarn packages
COPY package.json yarn.lock .
RUN yarn install --production --frozen-lockfile && yarn cache clean

# == main
FROM base AS main

# Add packages For Puma Start
RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends \
    vim libpq-dev libmariadb-dev nodejs nginx sudo yarn

COPY . .

# Copy files from each stages
COPY --from=bundle /app/vendor/bundle /app/vendor/bundle
COPY --from=yarn /app/node_modules node_modules

# nginx
RUN groupadd nginx
RUN useradd -g nginx nginx
ADD nginx/nginx.conf /etc/nginx/nginx.conf
ADD docker/production/entrypoint.sh /app/entrypoint.sh

EXPOSE 80

RUN chmod +x /app/entrypoint.sh
