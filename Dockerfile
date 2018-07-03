FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev
RUN curl -sL https://deb.nodesource.com/setup_9.x | bash
RUN apt-get install -y nodejs
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && apt-get install yarn
RUN mkdir /api_scotch_io
WORKDIR /api_scotch_io
ADD Gemfile /api_scotch_io/Gemfile
ADD Gemfile.lock /api_scotch_io/Gemfile.lock
RUN bundle install
ADD . /api_scotch_io
