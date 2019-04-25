FROM alpine:3.9.3

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
RUN apk update

RUN apk add --no-cache tor haproxy polipo curl

RUN mkdir -p /tordata/pid/
ADD tor.conf /
ADD polipo.conf /
ADD haproxy.conf /
ADD entry.sh /
RUN chmod +x ./entry.sh

EXPOSE 4000 8080

ENTRYPOINT "/entry.sh"
