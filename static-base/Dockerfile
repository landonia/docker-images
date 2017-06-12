FROM httpd:2.4
RUN apt-get update -y && apt-get upgrade -y && apt-get install -y curl git

# install from nodesource using apt-get
# https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-an-ubuntu-14-04-server
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash - && \
    apt-get install -yq nodejs build-essential && npm install -g npm@latest

# Our stuff
RUN npm install -g grunt-cli 
RUN npm install -g karma
RUN npm install -g bower
