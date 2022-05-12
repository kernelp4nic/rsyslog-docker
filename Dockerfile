FROM alpine:3.15.0

MAINTAINER Sebastián Moreno sebastianm@prismacampaigns.com

RUN  apk update \
  && apk add rsyslog logrotate \
  && rm -rf /var/cache/apk/*

RUN  apk add fish bash mlocate net-tools

ADD rsyslog.conf /etc/rsyslog.conf
ADD logrotate.conf /etc/logrotate.conf

# setup folder before switching to user
RUN mkdir /etc/logrotate.d.local
RUN chown root:root /etc/logrotate.d.local

EXPOSE 514 514/udp
EXPOSE 514 514
VOLUME [ "/var/log", "/etc/rsyslog.d", "/etc/logrotate.d.local" ]

ENTRYPOINT [ "/entrypoint.sh" ]
