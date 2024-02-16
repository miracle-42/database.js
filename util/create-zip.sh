#! /bin/bash
set -e

BUILD=${1:-build}

if [ ! -d ${BUILD} ]
then
	echo Error 1: Directory \'${BUILD}\' not found.
	exit 1
fi

VERSION=$( grep '^\*Release ' README.md | tr -d -c [.0-9] )
if [[ -z $VERSION ]]
then
	echo Error 2: Version number not found in: README.md
	exit 2
fi

cd ${BUILD}
echo Check openrestdb jar working before zipping:
./bin/openrestdb status
rm -rf {logs,tmp}
ZIP=${OLDPWD}/OpenRestDB-bin-$VERSION.zip
rm -f ${ZIP}
zip -r ${ZIP} *
echo Zip file created: $ZIP
