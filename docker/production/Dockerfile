# docker build -f docker/production/Dockerfile -t apartment-practice-nginx-rails .
# docker tag apartment-practice-nginx-rails:latest $AWS_ACCOUNT_ID.dkr.ecr.ap-northeast-1.amazonaws.com/apartment-practice-nginx-rails:latest
# docker push $AWS_ACCOUNT_ID.dkr.ecr.ap-northeast-1.amazonaws.com/apartment-practice-nginx-rails:latest

FROM ruby:2.7.2

ENV LANG C.UTF-8
ENV TZ Asia/Tokyo
ENV NODE_MAJOR_VERSION 14

RUN curl -sL https://deb.nodesource.com/setup_$NODE_MAJOR_VERSION.x | bash - && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo 'deb http://dl.yarnpkg.com/debian/ stable main' > /etc/apt/sources.list.d/yarn.list && \
    apt-get update -qq && \
    apt-get install -y --no-install-recommends \
    vim locales build-essential curl libpq-dev libmariadb-dev nodejs yarn nginx sudo

ENV APP_ROOT /app
WORKDIR $APP_ROOT

ADD Gemfile Gemfile.lock package.json yarn.lock $APP_ROOT/
RUN mkdir -p $APP_ROOT/tmp/sockets

RUN gem update --system && gem install bundler:2.1.4

ENV RAILS_ENV production
ENV BUNDLE_DEPLOYMENT true
ENV BUNDLE_PATH vendor/bundle
ENV BUNDLE_WITHOUT development:test

RUN bundle install && yarn install --frozen-lockfile --production

RUN SECRET_KEY_BASE=dummy bin/rails assets:precompile && rm -rf tmp/cache/*

ADD . $APP_ROOT/

# nginx
RUN groupadd nginx
RUN useradd -g nginx nginx
ADD nginx/nginx.conf /etc/nginx/nginx.conf
ADD docker/production/entrypoint.sh /app/entrypoint.sh

EXPOSE 80

RUN chmod +x /app/entrypoint.sh
