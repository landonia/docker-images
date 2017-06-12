FROM java:openjdk-8-jre

ENV DEBIAN_FRONTEND noninteractive

# Install Zookeeper and other needed things
RUN apt-get update && \
    apt-get install -y zookeeper wget supervisor dnsutils && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean

# Supervisor config
ADD zookeeper.conf /etc/supervisor/conf.d/

# 2181 is zookeeper
EXPOSE 2181

CMD ["supervisord", "-n"]
