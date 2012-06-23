#include "ffmpeg_android.h"
#include <stdlib.h>

// Use to safely invoke ffmpeg multiple times from the same Activity
JNIEXPORT void JNICALL Java_com_atonality_ffmpeg_FFmpeg_run(JNIEnv *env, jobject obj, jobjectArray args)
{
	int i = 0;
	int argc = 0;
	char **argv = NULL;

	if (args != NULL) {
		argc = (*env)->GetArrayLength(env, args);
		argv = (char **) malloc(sizeof(char *) * argc);

		for(i=0;i<argc;i++)
		{
			jstring str = (jstring)(*env)->GetObjectArrayElement(env, args, i);
			argv[i] = (char *)(*env)->GetStringUTFChars(env, str, NULL);   
		}
	}	

	main(argc, argv);
}
