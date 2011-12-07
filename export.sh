#!/bin/bash
VERSION="`cat svn/VERSION`-svn"
cd svn
svn export --force . ../v8cgi-${VERSION}
cd ..
tar -czf v8cgi_${VERSION}.orig.tar.gz v8cgi-${VERSION}
