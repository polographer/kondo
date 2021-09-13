FROM ruby:3.0.1-slim

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
ENV RAILS_ENV development
ENV NODE_ENV development

RUN apt-get update && apt-get upgrade -y && apt-get install -y build-essential curl git imagemagick dcraw libvips42 libpq-dev --no-install-recommends && apt-get clean
RUN echo '<delegate decode="dng:decode" command="&quot;dcraw&quot; -c &quot;%i&quot; &gt; &quot;%o&quot;" />' >> '/etc/ImageMagick-6/delegates.xml'

ENV NODE_VERSION=14.17.3

RUN apt-get update && apt-get upgrade -y && apt-get install -y build-essential curl git imagemagick dcraw libvips42 libpq-dev --no-install-recommends && apt-get clean
RUN ARCH= && dpkgArch="$(dpkg --print-architecture)" \
  && case "${dpkgArch##*-}" in \
    amd64) ARCH='x64';; \
    ppc64el) ARCH='ppc64le';; \
    s390x) ARCH='s390x';; \
    arm64) ARCH='arm64';; \
    armhf) ARCH='armv7l';; \
    i386) ARCH='x86';; \
    *) echo "unsupported architecture"; exit 1 ;; \
  esac \
  # gpg keys listed at https://github.com/nodejs/node#release-keys
  && set -ex \
  && curl -fsSLO --compressed "https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-$ARCH.tar.xz" \
  && tar -xJf "node-v$NODE_VERSION-linux-$ARCH.tar.xz" -C /usr/local --strip-components=1 --no-same-owner \
  && ln -s /usr/local/bin/node /usr/local/bin/nodejs \
  # smoke tests
  && node --version \
  && npm --version

ENV YARN_VERSION 1.22.10

RUN curl -fsSLO --compressed "https://yarnpkg.com/downloads/$YARN_VERSION/yarn-v$YARN_VERSION.tar.gz" \
  && mkdir -p /opt \
  && tar -xzf yarn-v$YARN_VERSION.tar.gz -C /opt/ \
  && ln -s /opt/yarn-v$YARN_VERSION/bin/yarn /usr/local/bin/yarn \
  && ln -s /opt/yarn-v$YARN_VERSION/bin/yarnpkg /usr/local/bin/yarnpkg \
  && rm yarn-v$YARN_VERSION.tar.gz \
  # smoke test
  && yarn --version

COPY Gemfile Gemfile.lock /usr/src/app/
RUN bundle config set deployment 'true' && bundle install
COPY package.json yarn.lock /usr/src/app/
RUN yarn install --frozen-lockfile
COPY Gemfile Gemfile.lock /usr/src/app/
COPY bin /usr/src/app/bin
ENTRYPOINT [ "/usr/src/app/bin/bundle" ]
