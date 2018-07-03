#!/bin/bash
bundle check || bundle install
yarn install

if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi

#bin/rake db:create
bin/rake db:migrate
#bin/rake db:seed

bundle exec puma -C config/puma.rb
