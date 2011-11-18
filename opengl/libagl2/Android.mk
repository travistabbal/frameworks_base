LOCAL_PATH:= $(call my-dir)

#
# Build the software OpenGL ES library
#

include $(CLEAR_VARS)

LOCAL_SRC_FILES:= \
	src/api.cpp \
	src/egl.cpp \
    src/get.cpp \
	src/shader.cpp \
	src/state.cpp \
	src/texture.cpp \
	src/vertex.cpp

LOCAL_C_INCLUDES :=	\
    $(LOCAL_PATH) \
    external/mesa3d/include \
    external/mesa3d/src \
    external/stlport/stlport \
    bionic
    
#LOCAL_CFLAGS += -DLOG_TAG=\"libagl2\"
#LOCAL_CFLAGS += -DGL_GLEXT_PROTOTYPES -DEGL_EGLEXT_PROTOTYPES
#LOCAL_CFLAGS += -fvisibility=hidden
#LOCAL_CFLAGS += -O0 -g -DDEBUG -UNDEBUG
LOCAL_CFLAGS += -O3
LOCAL_STATIC_LIBRARIES := libMesa
LOCAL_SHARED_LIBRARIES := libstlport libcutils libhardware libutils libbcc libdl
LOCAL_LDLIBS := -lpthread

ifeq ($(TARGET_ARCH),arm)
	LOCAL_CFLAGS += -fstrict-aliasing
endif

LOCAL_CFLAGS += -DHAVE_ARM_TLS_REGISTER
LOCAL_CFLAGS += -DHAVE_TEGRA_ERRATA_657451
LOCAL_C_INCLUDES += bionic/libc/private

LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/egl
#replace libagl for now
LOCAL_MODULE:= libGLES_android
LOCAL_MODULE_TAGS := eng

## Disable this makefile for now
## include $(BUILD_SHARED_LIBRARY)
