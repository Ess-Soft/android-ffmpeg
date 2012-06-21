#!/bin/bash
pushd `dirname $0`
. settings.sh
pushd libtheora
make
make install
popd; popd
