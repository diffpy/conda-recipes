#!/bin/bash

# Hints:
# http://boost.2283326.n4.nabble.com/how-to-build-boost-with-bzip2-in-non-standard-location-td2661155.html
# http://www.gentoo.org/proj/en/base/amd64/howtos/?part=1&chap=3
# http://www.boost.org/doc/libs/1_55_0/doc/html/bbv2/reference.html

# Hints for OSX:
# http://stackoverflow.com/questions/20108407/how-do-i-compile-boost-for-os-x-64b-platforms-with-stdlibc

mkdir -vp ${PREFIX}/bin;

if [ `uname` == Darwin ]; then
  ./bootstrap.sh \
    --prefix="${PREFIX}/" --libdir="${PREFIX}/lib/" \
    | tee bootstrap.log 2>&1

  ./b2 \
    variant=release \
    threading=multi link=shared toolset=clang \
    -j $CPU_COUNT \
    install | tee b2.log 2>&1
fi

if [ `uname` == Linux ]; then
  ./bootstrap.sh \
    --prefix="${PREFIX}/" --libdir="${PREFIX}/lib/" \
    | tee bootstrap.log 2>&1

  ./b2 \
    variant=release \
    threading=multi link=shared toolset=gcc \
    address-model=${ARCH} architecture=x86 \
    -j${CPU_COUNT} \
    install | tee b2.log 2>&1
fi
