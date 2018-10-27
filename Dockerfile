FROM ruby:alpine

WORKDIR /sync-photos

RUN apk -U upgrade \
 && apk add -t build-essentials \
    build-base \
    libressl \
    libtool \
 && apk add  \
    libffi \
 && rm -rf /tmp/* /var/cache/apk/*

COPY Gemfile Gemfile.lock /sync-photos/
RUN bundle install -j4 --without test development

COPY . /sync-photos/
ENV DIR=/Picutres

CMD ["bundle", "exec", "ruby", "--version"]
