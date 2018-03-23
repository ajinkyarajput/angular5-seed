FROM node
MAINTAINER Ajinkya Rajput <ajinkya.r.rajput@gmail.com>
#FROM ubuntu:16.04

# Install required system packages and dependencies
#RUN apt-get -y update && \
#     apt-get -y install build-essential ca-certificates curl ghostscript git imagemagick libbz2-1.0 libc6 libgcc1 libncurses5 libreadline6 libsqlite3-0 libssl1.0.0 libstdc++6 libtinfo5 pkg-config unzip wget zlib1g

#RUN curl -sL https://deb.nodesource.com/setup_6.x -o nodesource_setup.sh
#RUN bash nodesource_setup.sh
#RUN apt-get install -y nodejs

COPY package.json /build/

RUN cd /build && npm install
COPY . /build

RUN cd /build && npm run build && cp -R dist /app && cp -R node_modules /app && rm -rf /build

WORKDIR /app

EXPOSE 3000

CMD ["node"]

