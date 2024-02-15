#! /bin/bash
# vim: ts=4 expandtab :
set -e

if [ ! -d build ]
then
	cp -a template build
fi

if [ ! -e target/openrestdb-2.1.jar ]
then
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
