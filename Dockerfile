# 使いたいバージョンを決めて{{}}をruby:tag名の形で置き換えてください
# 例: ARG RUBY_VERSION=ruby:3.2.2
ARG RUBY_VERSION=ruby:3.1.4
# {{}}を丸ごと使いたいnodeのversionに置き換えてください、小数点以下はいれないでください
# 例: ARG NODE_VERSION=19
ARG NODE_VERSION=19

FROM $RUBY_VERSION
ARG RUBY_VERSION
ARG NODE_VERSION
ENV LANG C.UTF-8
ENV TZ Asia/Tokyo
RUN curl -sL https://deb.nodesource.com/setup_${NODE_VERSION}.x | bash - \
&& wget --quiet -O - /tmp/pubkey.gpg https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
&& echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
&& apt-get update -qq \
&& apt-get install -y build-essential nodejs yarn
## 追加
RUN apt-get update -qq && apt-get install -y postgresql-client

RUN mkdir /mini_app
WORKDIR /mini_app
RUN gem install bundler
COPY Gemfile /mini_app/Gemfile
COPY Gemfile.lock /mini_app/Gemfile.lock
COPY yarn.lock /mini_app/yarn.lock
RUN bundle install
RUN yarn install
COPY . /mini_app

# bin/devで起動
CMD ["bin/dev"]