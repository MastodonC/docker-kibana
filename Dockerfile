FROM mastodonc/basejava

RUN apt-get install -y nginx-full && \
    curl -sL https://download.elastic.co/kibana/kibana/kibana-4.1.3-linux-x64.tar.gz | \
    tar -xzf - -C / --transform 's@\([a-z-]*\)-[0-9\.]*@\1@'

ADD start-kibana.sh /start-kibana

EXPOSE 80

CMD ["/bin/bash","/start-kibana"]
