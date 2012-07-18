#!/bin/bash
cd svn
VERSION=$(cat VERSION)

if [[ $VERSION =~ dev ]] ; then
	VERSION="${VERSION}~hg"$(hg identify -i)
fi

hg archive ../teajs-${VERSION}
cd ..
tar -czf teajs_${VERSION}.orig.tar.gz teajs-${VERSION}
