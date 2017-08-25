FROM alpine:3.6

RUN apk add 'gettext=0.19.8.1-r1' --no-cache
RUN apk add 'tor=0.3.0.10-r0' --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/community

ADD entry.sh /entry.sh
ADD torrc.template.ini torrc.template.ini

CMD ["/bin/sh", "entry.sh"]