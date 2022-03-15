FROM alpine:3.15.0

MAINTAINER Sebastián Moreno sebastianm@prismacampaigns.com

RUN  apk update \
  && apk add rsyslog logrotate \
  && rm -rf /var/cache/apk/*

RUN  apk add fish bash mlocate net-tools

ADD rsyslog.conf /etc/rsyslog.conf
ADD logrotate.conf /etc/logrotate.conf

EXPOSE 514 514/udp
EXPOSE 514 514
VOLUME [ "/var/log", "/etc/rsyslog.d", "/etc/logrotate.d.local" ]

ENTRYPOINT [ "rsyslogd", "-n" ]