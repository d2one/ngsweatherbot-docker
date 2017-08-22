FROM golang:1.8-alpine

RUN apk update && apk upgrade && \
    apk add --no-cache git libgit2-dev alpine-sdk && rm -rf /var/cache/apk/*

RUN go get -v github.com/d2one/ngsweatherbot

FROM alpine
RUN apk update && apk upgrade && \
    apk add --no-cache ca-certificates tzdata && rm -rf /var/cache/apk/*

RUN cp /usr/share/zoneinfo/Asia/Novosibirsk  /etc/localtime
RUN echo "Asia/Novosibirsk" >  /etc/timezone
RUN mkdir /ngsweatherbot/

COPY --from=0 /go/bin/ngsweatherbot /ngsweatherbot/ngsweatherbot

ENTRYPOINT ["/ngsweatherbot/ngsweatherbot"]