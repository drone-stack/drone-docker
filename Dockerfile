FROM ysicing/goa AS gobuild

LABEL maintainer="ysicing <i@ysicing.me>"

COPY . /go/src/

WORKDIR /go/src/cmd

ARG MODE={prod}

RUN go build -o ./builder && set -x; echo ${MODE}

FROM docker:20.10.14

ENV DOCKER_HOST=unix:///var/run/docker.sock

COPY --from=gobuild /go/src/cmd/builder /bin/

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

RUN chmod +x /usr/local/bin/docker-entrypoint.sh /bin/builder

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh", "/bin/builder"]
