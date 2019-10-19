FROM ruby:2.5.1

ARG INSTALL_PATH
ARG RAILS_PORT

ENV http_proxy=$HTTP_PROXY
ENV https_proxy=$HTTPS_PROXY

ENV TZ=America/Sao_Paulo

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN  apt-get update \
  && apt-get install -qq -y --no-install-recommends \
    build-essential \
    git \
    libsqlite3-dev \
    nodejs \
    cron \
    libpq-dev \
  && rm -rf /var/lib/apt/lists/*

RUN  apt-get update \
  && apt-get install -qq -y --no-install-recommends \
    vim \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir -p $INSTALL_PATH
WORKDIR $INSTALL_PATH
COPY Gemfile Gemfile.lock ./
RUN gem install bundler --pre
RUN bundle install
COPY . .
RUN bundle exec whenever --update-crontab
VOLUME ["$INSTALL_PATH/public"]
EXPOSE $RAILS_PORT
