FROM alpine:3.4

RUN apk add --update git
RUN git clone https://github.com/lukas2511/letsencrypt.sh /letsencrypt.sh

RUN apk del git pcre expat

RUN apk add openssl curl bash jq

ADD parts/go.sh /letsencrypt.sh/run.sh

ADD parts/dig /usr/local/bin/dig

RUN rm -rf /var/cache/apk/*

CMD ["/letsencrypt.sh/run.sh"]
