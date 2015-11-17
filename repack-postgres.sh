#!/bin/bash -ex
VERSION=9.4.4-3

cd `dirname $0`

PACKDIR=$(mktemp -d -t wat.XXXXXX)
LINUX_DIST=dist/postgresql-$VERSION-linux-x64-binaries.tar.gz

mkdir -p dist/ target/generated-resources/
[ -e $LINUX_DIST ] || wget -O $LINUX_DIST "http://get.enterprisedb.com/postgresql/postgresql-$VERSION-linux-x64-binaries.tar.gz"

tar xzf $LINUX_DIST -C $PACKDIR
pushd $PACKDIR/pgsql
tar cjf $OLDPWD/target/generated-resources/postgresql-Linux-x86_64.tbz \
  share/postgresql \
  lib \
  bin/initdb \
  bin/pg_ctl \
  bin/postgres
popd

rm -fr $PACKDIR