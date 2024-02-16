#! /bin/bash
set -e

BUILD=${1:-build}
if [[ ! -d ${BUILD} ]]
then
	echo Error 1, directory does not exist: ${BUILD}
	exit 1
fi
mvn package
cp target/openrestdb*.jar ${BUILD}/lib/
