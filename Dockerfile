FROM alpine:3.9

RUN apk add 'gettext=0.19.8.1-r4' --no-cache
RUN apk add 'tor=0.3.5.8-r0' --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/community

ADD entry.sh /entry.sh
ADD torrc.template.ini torrc.template.ini

CMD ["/bin/sh", "entry.sh"]