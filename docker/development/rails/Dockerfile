FROM ruby:2.7.2

ENV NODE_MAJOR_VERSION 14

RUN curl -sL https://deb.nodesource.com/setup_$NODE_MAJOR_VERSION.x | bash - && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo 'deb http://dl.yarnpkg.com/debian/ stable main' > /etc/apt/sources.list.d/yarn.list && \
    apt-get update -qq && \
    apt-get install -y --no-install-recommends \
    vim locales build-essential curl libpq-dev libmariadb-dev nodejs yarn

ENV APP_ROOT /app
WORKDIR $APP_ROOT

ADD Gemfile Gemfile.lock package.json yarn.lock $APP_ROOT/

RUN gem update --system && gem install bundler:2.1.4

RUN bundle install && yarn install --frozen-lockfile

ADD . $APP_ROOT/
