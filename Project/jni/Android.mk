LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE  := videokit
# These need to be in the right order
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
# ffmpeg uses its own deprecated functions liberally, so turn off that annoying noise
LOCAL_CFLAGS += -g -Iffmpeg -Ivideokit -Wno-deprecated-declarations 
LOCAL_LDLIBS += -llog -lz $(FFMPEG_LIBS) $(THEORA_LIBS) $(OGG_LIBS) x264/libx264.a
LOCAL_SRC_FILES := videokit/uk_co_halfninja_videokit_Videokit.c videokit/ffmpeg.c videokit/cmdutils.c
include $(BUILD_SHARED_LIBRARY)


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
LOCAL_SRC_FILES := ffmpeg/ffmpeg.c ffmpeg/cmdutils.c
include $(BUILD_EXECUTABLE)

