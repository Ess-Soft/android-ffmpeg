#!/bin/bash
pushd `dirname $0`
. settings.sh
pushd libogg
make
make install
popd; popd
