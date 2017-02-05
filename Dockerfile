FROM ruby:2.3

EXPOSE 3000
RUN mkdir -p /var/www/social-recipes
WORKDIR /var/www/social-recipes
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install

RUN apt-get update
RUN apt-get install nodejs -y
COPY . /var/www/social-recipes

CMD 'rails server -b 0.0.0.0'
