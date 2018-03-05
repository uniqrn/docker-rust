FROM debian:stretch-slim
LABEL maintainer "unicorn research Ltd."

RUN apt-get update && apt-get install -y curl

WORKDIR /root
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y --default-toolchain nightly

ENV PATH /root/.cargo/bin:$PATH
RUN rustup target add wasm32-unknown-unknown --toolchain nightly
