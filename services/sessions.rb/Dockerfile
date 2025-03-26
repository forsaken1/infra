FROM ruby:2.7
WORKDIR /usr/src/app
COPY Gemfile* ./
RUN bundle install
COPY . .
CMD ["ruby", "app.rb", "-o", "0.0.0.0"]
