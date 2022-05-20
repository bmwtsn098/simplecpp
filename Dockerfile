# Build Stage:
FROM --platform=linux/amd64 ubuntu:20.04 as builder

## Install build dependencies.
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y build-essential make

## Add Source Code
ADD . /simplecpp
WORKDIR /simplecpp

## Build Step
RUN make

# Package Stage
FROM debian:bullseye-slim
COPY --from=builder /simplecpp/simplecpp /
