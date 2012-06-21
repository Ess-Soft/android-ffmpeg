#!/bin/bash
pushd `dirname $0`
. settings.sh
pushd libvorbis
make
make install
popd; popd
