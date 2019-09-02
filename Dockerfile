FROM alpine:edge as rsbuild

RUN apk update && apk add ca-certificates cargo gcc git rust && git clone https://github.com/LinkTed/doh-client /doh-client

WORKDIR /doh-client

RUN cargo build --release


FROM alpine:latest

ENV PORT 53
ENV LISTEN_ADDR 127.0.0.1:$PORT
ENV REMOTE_ADDR 1.1.1.1:443
ENV CACHE_SIZE 1024
ENV DOMAIN cloudflare-dns.com
ENV PATH dns-query
ENV TIMEOUT 2
ENV RETRIES 3

EXPOSE $PORT/tcp $PORT/udp

RUN apk add ca-certificates-cacert libgcc libunwind

COPY --from=rsbuild /doh-client/target/release/doh-client /usr/local/bin/doh-client

ENTRYPOINT ["/usr/local/bin/doh-client /etc/ssl/cert.pem"]
CMD ["-c $CACHE_SIZE -d $DOMAIN -l $LISTEN_ADDR -p $PATH -r $REMOTE_ADDR --retries $RETRIES -t $TIMEOUT"]

LABEL maintainer="Marco Kundt"
