LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE  := ffmpeg

FFMPEG_LIBS := $(addprefix ffmpeg/, \
 libavdevice/libavdevice.a \
 libavformat/libavformat.a \
 libavcodec/libavcodec.a \
 libavfilter/libavfilter.a \
 libswscale/libswscale.a \
 libavutil/libavutil.a \
 libpostproc/libpostproc.a )

OGG_LIBS := $(addprefix libogg/output/lib/, \
 libogg.a )

VORBIS_LIBS := $(addprefix libvorbis/output/lib/, \
 libvorbis.a \
 libvorbisenc.a \
 libvorbisfile.a )

THEORA_LIBS := $(addprefix libtheora/output/lib/, \
 libtheora.a \
 libtheoraenc.a \
 libtheoradec.a )

LOCAL_CFLAGS += -g -Iffmpeg -Ivideokit -Wno-deprecated-declarations 
LOCAL_LDLIBS += -llog -lz $(FFMPEG_LIBS) $(THEORA_LIBS) $(OGG_LIBS) x264/libx264.a
LOCAL_SRC_FILES := ffmpeg_android/ffmpeg_android.c ffmpeg_android/ffmpeg.c ffmpeg_android/cmdutils.c

include $(BUILD_SHARED_LIBRARY)

# Use to safely invoke ffmpeg multiple times from the same Activity
include $(CLEAR_VARS)

LOCAL_MODULE := ffmpeginvoke

LOCAL_SRC_FILES := ffmpeg_invoke/ffmpeg_invoke.c
LOCAL_LDLIBS    := -ldl

include $(BUILD_SHARED_LIBRARY)
