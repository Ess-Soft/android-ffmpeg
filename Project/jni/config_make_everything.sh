#!/bin/bash

function die {
  echo "$1 failed" && exit 1
}

./configure_x264.sh || die "X264 configure"
./make_x264.sh || die "X264 make"

./configure_ogg.sh || die "OGG configure"
./make_ogg.sh || die "OGG make"

./configure_vorbis.sh || die "VORBIS configure"
./make_vorbis.sh || die "VORBIS make"

./configure_theora.sh || die "THEORA configure"
./make_theora.sh || die "THEORA make"

./configure_ffmpeg.sh || die "FFMPEG configure"
./make_ffmpeg.sh || die "FFMPEG make"
