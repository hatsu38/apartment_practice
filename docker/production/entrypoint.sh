#!/bin/bash

sudo service nginx start
cd /app
RAILS_ENV=production bin/rails assets:precompile && rm -rf public/{packs,assets}
bundle exec pumactl start