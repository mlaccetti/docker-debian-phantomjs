FROM alpine:latest

RUN apk add --update alpine-sdk bash build-base curl git

RUN mkdir /opt
WORKDIR /opt
RUN git clone git://github.com/ariya/phantomjs.git`
WORKDIR /opt/phantomjs
RUN git checkout 2.0

RUN apk add --update perl icu-dev openssl-dev

RUN ./build.sh --confirm