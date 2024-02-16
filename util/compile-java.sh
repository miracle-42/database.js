#! /bin/bash
set -e

BUILD=${1:-build}

mvn package
cp target/openrestdb*.jar ${BUILD}/lib/
