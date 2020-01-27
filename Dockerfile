FROM debian:buster-20190910-slim
LABEL maintainer "unicorn research Ltd."

RUN set -eux; \
	apt-get update; \
	apt-get install -y --no-install-recommends \
		ca-certificates \
		curl \
	; \
	rm -rf /var/lib/apt/lists/*

WORKDIR /root
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

ENV PATH /root/.cargo/bin:$PATH
RUN rustup target add wasm32-unknown-unknown --toolchain nightly
