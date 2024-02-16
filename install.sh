#! /bin/bash
# vim: ts=4 expandtab :
set -e

BUILD=${1:-build}

if [ ! -d ${BUILD} ]
then
    echo Creating runtime installation in directory: ${BUILD}/
	cp -a template ${BUILD}
fi

if [ ! -e target/openrestdb-2.1.jar ]
then
    echo Compiling OpenRestDB
	mvn package
fi

if [ target/openrestdb-2.1.jar -nt build/lib/openrestdb-2.1.jar ]
then
	echo cp target/openrestdb-2.1.jar build/lib/openrestdb-2.1.jar
fi

echo Start OpenRestDB
build/bin/openrestdb start
build/bin/openrestdb status

echo Test OpenRestDB running by browsing the URL:
echo \ http://localhost:9002/
echo or run the command line:
echo \ curl --silent --data \'\' http://localhost:9002/status
