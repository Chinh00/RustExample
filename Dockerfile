FROM rust:latest AS builder

WORKDIR /usr/src/app

COPY Cargo.toml ./

RUN cargo fetch

COPY . .

RUN cargo build --release

FROM debian:bullseye-slim

RUN apt-get update && apt-get install -y \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -m rustuser

COPY --from=builder /usr/src/app/target/release/RustExample ./RustExample

RUN chmod +x ./RustExample

USER rustuser

EXPOSE 8080

CMD ["./RustExample"]
