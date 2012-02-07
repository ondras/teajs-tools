#!/bin/bash
cd svn
VERSION=$(cat VERSION)

if [[ $VERSION =~ dev ]] ; then
	VERSION="${VERSION}~svn"$(svnversion)
fi

svn export --force . ../v8cgi-${VERSION}
cd ..
tar -czf v8cgi_${VERSION}.orig.tar.gz v8cgi-${VERSION}
