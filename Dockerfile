FROM ruby:2.5.0

# Make the project's bins available everywhere.
ENV HOME=/home/workspace/ \
    PATH=/usr/src/app/bin:$PATH

ENV APP_HOME /home/workspace

RUN mkdir -p $APP_HOME

# Install capybara-webkit deps.
RUN apt-get update && apt-get install -y xvfb \
                                         qt5-default \
                                         libqt5webkit5-dev \
                                         gstreamer1.0-plugins-base \
                                         gstreamer1.0-tools \
                                         streamer1.0-x

# Install Node.js.
RUN curl -sL https://deb.nodesource.com/setup_9.x | bash - \
    && apt-get install -y nodejs

# Install Yarn.
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -\
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update \
    && apt-get install -y yarn

WORKDIR $APP_HOME


COPY Gemfile      $APP_HOME
COPY Gemfile.lock $APP_HOME

# For caching gems.
ENV BUNDLE_PATH=/bundle \
    BUNDLE_BIN=/bundle/bin \
    GEM_HOME=/bundle

ENV PATH="${BUNDLE_BIN}:${PATH}"

COPY ./scripts/docker-entrypoint /docker-entrypoint

RUN chmod +x /docker-entrypoint

ENTRYPOINT ["/docker-entrypoint"]

COPY . $APP_HOME

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0", "-p", "3000"]
