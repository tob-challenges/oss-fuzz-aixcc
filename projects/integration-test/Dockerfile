FROM ghcr.io/aixcc-finals/base-builder:v1.1.0
RUN apt-get update && apt-get install -y build-essential

RUN mkdir $SRC/integration-test
COPY build.sh $SRC/
COPY fuzz_* $SRC/
WORKDIR $SRC/integration-test
