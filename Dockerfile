FROM ruby:2.6.5 

RUN apt-get update -qq && \
    apt-get install -y build-essential \
                       libpq-dev \
                       nodejs

RUN mkdir /pictweet2
WORKDIR /pictweet2

ADD ./Gemfile /pictweet2/Gemfile
ADD ./Gemfile.lock /pictweet2/Gemfile.lock

RUN gem install bundler -v 2.1.4
RUN bundle install
ADD . /pictweet2