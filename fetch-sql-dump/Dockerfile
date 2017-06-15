FROM alpine:3.6
MAINTAINER ACME Technology

## Install curl
RUN apk add --no-cache curl

## We want to create an init folder to match the init folder on the mysql instance which will run the scripts
RUN mkdir /docker-entrypoint-initdb.d

## Add a volume for this drive so that we can share volumes from this image
VOLUME ["/docker-entrypoint-initdb.d"]
ENV MYSQL_STORE /docker-entrypoint-initdb.d

## Run the bootstrap script that will attempt to fetch the dump and unpack it in the docker entrypoint folder
ADD bootstrap.sh /
RUN chmod a+x /bootstrap.sh
ENTRYPOINT ["/bin/sh", "/bootstrap.sh"]
