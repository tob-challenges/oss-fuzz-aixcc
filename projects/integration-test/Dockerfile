FROM ghcr.io/tob-challenges/base-builder
RUN apt-get update && apt-get install -y build-essential

COPY build.sh $SRC/
COPY fuzz_* *.options $SRC/
WORKDIR $SRC/integration-test
