#!/bin/bash

# This performs the repo-specific tests. It may be replaced with a script
# or binary for a different interpreter. The name MUST NOT change.

set -e
set -o pipefail

MAVEN_ARGS="-Dpropguard.skip -Dmaven.javadoc.skip=true -Dpmd.skip=true \
  -Dencoding=UTF-8 -Dmaven.antrun.skip=true -Dcheckstyle.skip=true \
  -Dsurefire.failIfNoSpecifiedTests=false"

#We're tightly limiting the focus for the first three. ZooKeeperTest is
#a proxy for the fuller end to end testing that we're limiting for this challenge.
MAVEN_TESTS="-Dtest=DataTreeTest,DataNodeTest,DeserializationPerfTest,ZooKeeperTest,MessageTrackerTest"

cd $SRC/zookeeper

${MVN} ${MAVEN_ARGS} ${MAVEN_TESTS} -am -pl :zookeeper clean install --no-snapshot-updates
