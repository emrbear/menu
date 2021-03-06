FROM ruby:2.7.1
ENV WORKDIR /menu
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /menu
WORKDIR /menu
COPY Gemfile $WORKDIR/Gemfile
COPY Gemfile.lock /$WORKDIR/Gemfile.lock
RUN bundle install
COPY . $WORKDIR

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]

