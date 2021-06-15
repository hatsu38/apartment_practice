#!/bin/bash

sudo service nginx start
cd /app
RAILS_ENV=production bundle exec rails webpacker:compile
bundle exec pumactl start