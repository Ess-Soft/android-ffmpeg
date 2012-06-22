#ifndef FFMPEG_ANDROID_INCLUDED
#define FFMPEG_ANDROID_INCLUDED

#ifdef __cplusplus
extern "C" {
#endif

#include <jni.h>

JNIEXPORT void JNICALL Java_com_atonality_ffmpeg_FFmpeg_run(JNIEnv *, jobject, jobjectArray);

#ifdef __cplusplus
}
#endif

#endif //FFMPEG_ANDROID_INCLUDED
