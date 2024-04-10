FROM rust:latest

WORKDIR /app

RUN git clone https://github.com/2LJDC/test

RUN mv /app/test /app/www

RUN git clone https://github.com/2LJDC/mini-server

RUN cd /app/mini-server

RUN cargo build --release

RUN cp /app/mini-server/target/release/min-server /app/mini-server

RUN chmod 755 mini-server

EXPOSE 8000

CMD ["/app/mini-server"]
