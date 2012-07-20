#!/bin/bash

NAME="teajs-`cat VERSION`"

# source package
PACKAGE="${NAME}-src"
TARGET="../RELEASE/${PACKAGE}"
mkdir -p ${TARGET}
echo "exporting TeaJS source"
hg archive ${TARGET}/teajs
cd ../v8
echo "exporting v8 source"
echo svn export . ${TARGET}/v8
cd ../RELEASE
echo "packaging"
tar -czf ${PACKAGE}.tar.gz ${PACKAGE}
echo "source package created"
cd ../teajs

# win32 package
PACKAGE="${NAME}-win32"
TARGET="../RELEASE/${PACKAGE}"
mkdir -p ${TARGET}
echo "exporting TeaJS win32 - MAKE SURE ALL BINARIES ARE STRIPPED! :-)"
cp -r "additional dlls" ${TARGET}

hg archive DUMMY
cp -r DUMMY/example ${TARGET}/example	# examples
cp -r DUMMY/unit ${TARGET}/unit			# unit tests
rm -rf DUMMY

mkdir ${TARGET}/lib
cp lib/*.js ${TARGET}/lib				# js modules
cp lib/*.dll ${TARGET}/lib				# native modules
cp *.dll ${TARGET}
cp tea.exe ${TARGET}
cp LICENSE README INSTALL VERSION ${TARGET}
cp teajs.conf.windows ${TARGET}/teajs.conf

echo "packaging"
cd ../RELEASE
zip -r ${PACKAGE}.zip ${PACKAGE}
echo "win32 package created"
