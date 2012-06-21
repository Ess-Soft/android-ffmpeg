#!/bin/bash
pushd `dirname $0`
. settings.sh

thisdir=`pwd`

oggpath="/libogg/output"
oggdir=$thisdir$oggpath

vorbispath="/libvorbis/output"
vorbisdir=$thisdir$vorbispath

echo "**********"
echo $oggdir
echo $vorbisdir
echo "**********"

pushd libtheora

export CC="arm-linux-androideabi-gcc"
export LD="arm-linux-androideabi-ld"
export CFLAGS="-fPIC -DANDROID -D__thumb__ -mthumb -Wfatal-errors -Wno-deprecated"

./configure \
--prefix=`pwd`/output \
--host=arm-linux \
--disable-shared \
--enable-static \
--with-ogg=$oggdir \
--with-vorbis=$vorbisdir  

popd;popd
