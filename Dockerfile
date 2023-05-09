FROM debian:11

ENV IRC_HOST=${IRC_HOST:-10.0.0.103}
ENV IRC_PORT=${IRC_PORT:-6667}
ENV IRC_NICK=${IRC_NICK:-Shadow_Docker}
ENV IRC_NAME=${IRC_NAME:-Shadow}
ENV IRC_CHANS=${IRC_CHANS:-#canada}
ENV IRC_CMDCHAN=${IRC_CMDCHAN:-#shadowcmd}
ENV IRC_ADMINHOSTS=${IRC_ADMINHOSTS:-*!*@owner.ephasic.org}
ENV HTTP_PUBURL=${HTTP_PUBURL:-http://10.0.0.104:1337/}
ENV HTTP_PORT=${HTTP_PORT:-1337}

RUN apt update && apt install -y wget neofetch build-essential git libcpan-distnameinfo-perl shared-mime-info libjson-perl libxml-libxml-perl libxml-feed-perl libmojolicious-perl && git clone https://github.com/ablakely/shadow /opt/shadow && cd /opt/shadow/ && update-mime-database /usr/share/mime && \
echo | perl /opt/shadow/installdepends.pl && cd /opt/shadow/etc && perl /opt/shadow/etc/docker-genconf.pl

WORKDIR /opt/shadow

CMD /usr/bin/perl /opt/shadow/etc/docker-starter.pl
