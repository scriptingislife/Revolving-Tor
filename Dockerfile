FROM alpine:3.9.3

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
RUN apk update

RUN apk add --no-cache tor haproxy polipo curl

ADD tor.conf /
ADD polipo.conf /

ENTRYPOINT [ "/bin/sh" ]