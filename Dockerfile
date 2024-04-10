FROM rust:latest as builder

WORKDIR /app

RUN git clone https://github.com/2LJDC/test

RUN mv /app/test /app/www

RUN git clone https://github.com/2LJDC/mini-server

RUN cd /app/mini-server

RUN cd /app/mini-server; cargo build --release

RUN cp /app/mini-server/target/release/mini-server /app/mini-server

RUN chmod 755 mini-server


FROM debian

COPY --from=builder /app/www /app/www

COPY --from=builder /app/mini-server /app/mini-server

RUN chmod 755 /app/mini-server

EXPOSE 8000

CMD ["/app/mini-server"]
