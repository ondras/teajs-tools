#!/bin/bash

NAME="v8cgi-`cat VERSION`"

# source package
PACKAGE="${NAME}-src"
TARGET="../RELEASE/${PACKAGE}"
mkdir -p ${TARGET}
echo "exporting v8cgi source"
svn export . ${TARGET}/v8cgi
cd ../v8
echo "exporting v8 source"
svn export . ${TARGET}/v8
cd ../RELEASE
echo "packaging"
tar -czf ${PACKAGE}.tar.gz ${PACKAGE}
echo "source package created"
cd ../v8cgi

# win32 package
PACKAGE="${NAME}-win32"
TARGET="../RELEASE/${PACKAGE}"
mkdir -p ${TARGET}
echo "exporting v8cgi win32 - MAKE SURE ALL BINARIES ARE STRIPPED! :-)"
cp -r "additional dlls" ${TARGET}
svn export example ${TARGET}/example	# examples
svn export unit ${TARGET}/unit			# unit tests
mkdir ${TARGET}/lib
cp lib/*.js ${TARGET}/lib				# js modules
cp lib/*.dll ${TARGET}/lib				# native modules
cp *.dll ${TARGET}
cp v8cgi.exe ${TARGET}
cp LICENSE README INSTALL VERSION ${TARGET}
cp v8cgi.conf.windows ${TARGET}/v8cgi.conf

echo "packaging"
cd ../RELEASE
zip -r ${PACKAGE}.zip ${PACKAGE}
echo "win32 package created"
