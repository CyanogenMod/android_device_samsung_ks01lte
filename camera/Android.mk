ifeq ($(TARGET_PROVIDES_KS01_CAMERA_HAL),true)

LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

ifeq ($(TARGET_NEED_CAMERA_ZSL),true)
    LOCAL_CFLAGS += -DENABLE_ZSL
endif

ifeq ($(TARGET_NEED_SAMSUNG_MAGIC_ZSL_1508),true)
    LOCAL_CFLAGS += -DMAGIC_ZSL_1508
endif

ifeq ($(TARGET_ADD_ISO_MODE_50),true)
    LOCAL_CFLAGS += -DISO_MODE_50
endif

ifeq ($(TARGET_ADD_ISO_MODE_1600),true)
    LOCAL_CFLAGS += -DISO_MODE_1600
endif

ifeq ($(TARGET_ADD_ISO_MODE_HJR),true)
    LOCAL_CFLAGS += -DISO_MODE_HJR
endif

LOCAL_SRC_FILES := \
    CameraWrapper.cpp

LOCAL_SHARED_LIBRARIES := \
    libhardware liblog libcamera_client libutils

LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/hw
LOCAL_MODULE := camera.msm8974
LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)

endif
