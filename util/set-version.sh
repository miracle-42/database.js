#! /bin/bash
set -e
#set -x

# Files to update manually
#  README.md
#  ChangeLog.md

# TODO files:
#  src/openrestdb/pom.xml
#   <version>2.1</version>


NEW=${1:-$NEWREL}

if [[ -z $NEW ]]
then
	echo Error, missing new version number argument.
	echo Example:
	echo \ $0 3.2
	exit 1
fi

sed -i -e "s/^\(\*Release \).*\*/\1$NEW*/" README.md

# OpenRestDB
# src/openrestdb/src/main/java/database/Version.java:5:   public static String number = "3.0.1";
sed -i -e "s/\(public static final String number = \"\)[.0-9]\+/\1$NEW/" src/main/java/database/Version.java

grep -nH $NEW README.md src/main/java/database/Version.java
