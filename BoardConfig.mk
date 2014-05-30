# Copyright (C) 2009 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# inherit from common msm8960
-include device/samsung/msm8960-common/BoardConfigCommon.mk

TARGET_SPECIFIC_HEADER_PATH := device/samsung/ks01lte/include


# overrides  msm8960
TARGET_BOARD_PLATFORM := msm8974
TARGET_BOARD_PLATFORM_GPU := qcom-adreno330
TARGET_BOOTLOADER_BOARD_NAME := MSM8974
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_USE_KRAIT_BIONIC_OPTIMIZATION := true
TARGET_USE_KRAIT_PLD_SET := true
TARGET_KRAIT_BIONIC_PLDOFFS := 10
TARGET_KRAIT_BIONIC_PLDTHRESH := 10
TARGET_KRAIT_BIONIC_BBTHRESH := 64
TARGET_KRAIT_BIONIC_PLDSIZE := 64

# Kernel Configs
TARGET_KERNEL_SOURCE := kernel/samsung/ks01lte
TARGET_KERNEL_CONFIG := msm8974_sec_defconfig
TARGET_KERNEL_SELINUX_CONFIG := selinux_defconfig
TARGET_KERNEL_VARIANT_CONFIG := msm8974_sec_ks01_eur_defconfig

# Kernel
BOARD_KERNEL_CMDLINE := console=null androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x3F
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x00008000 --ramdisk_offset 0x02000000 --tags_offset 0x01e00000 --second_offset 0x00f00000
BOARD_KERNEL_SEPARATED_DT := true
BOARD_CUSTOM_BOOTIMG_MK := device/samsung/ks01lte/mkbootimg.mk

# Graphics
BOARD_EGL_CFG := device/samsung/ks01lte/egl.cfg

# Recovery
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_23x41.h\"
BOARD_USES_MMCUTILS := true
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_HAS_NO_MISC_PARTITION := true
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_RECOVERY_FSTAB := device/samsung/ks01lte/rootdir/etc/fstab.qcom

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 20971520
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 20971520
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2390753280
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12685655040
BOARD_FLASH_BLOCK_SIZE := 131072

BOARD_RECOVERY_SWIPE := true

# bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BLUETOOTH_HCI_USE_MCT := false
BLUETOOTH_HCI_USE_USB := false
BOARD_BLUETOOTH_USES_HCIATTACH_PROPERTY := false
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/samsung/ks01lte/bluetooth
BOARD_BLUEDROID_VENDOR_CONF := device/samsung/ks01lte/bluetooth/vnd_ks01lte.txt

# GPS
TARGET_NO_RPC := true
BOARD_HAVE_NEW_QC_GPS := 

# NFC
BOARD_NFC_HAL_SUFFIX := msm8974

# Samsung's nonstandard csd-client
BOARD_HAVE_NEW_QCOM_CSDCLIENT := true

# QCOM support
BOARD_USES_QCOM_HARDWARE := true
BOARD_USES_LEGACY_ALSA_AUDIO := 
TARGET_QCOM_MEDIA_VARIANT := caf-new
TARGET_QCOM_DISPLAY_VARIANT := caf-new
TARGET_QCOM_AUDIO_VARIANT := caf
TARGET_USES_QCOM_BSP := true
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE -DQCOM_BSP

#TARGET_ENABLE_QC_AV_ENHANCEMENTS := true

# Audio
BOARD_USES_CUSTOM_AUDIO_PLATFORM_PATH := device/samsung/ks01lte/audio/platform
AUDIO_FEATURE_DISABLED_MULTI_VOICE_SESSIONS := true
AUDIO_FEATURE_DISABLED_FM := true
AUDIO_FEATURE_DISABLED_ANC_HEADSET := true
#AUDIO_FEATURE_DISABLED_SSR := true
#AUDIO_FEATURE_DISABLED_INCALL_MUSIC := true
#AUDIO_FEATURE_DISABLED_SPKR_PROTECTION := true
#AUDIO_FEATURE_DISABLED_DS1_DOLBY_DDP := true

BOARD_WLAN_DEVICE := bcmdhd
WIFI_DRIVER_FW_PATH_P2P     := 
WIFI_DRIVER_MODULE_ARG      := "firmware_path=/system/etc/wifi/bcmdhd_sta.bin nvram_path=/system/etc/wifi/nvram_net.txt"
WIFI_DRIVER_MODULE_AP_ARG   := "firmware_path=/system/etc/wifi/bcmdhd_apsta.bin nvram_path=/system/etc/wifi/nvram_net.txt"
WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/dhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA     := "/system/etc/wifi/bcmdhd_sta.bin"
WIFI_DRIVER_FW_PATH_AP      := "/system/etc/wifi/bcmdhd_apsta.bin"
WIFI_DRIVER_MODULE_NAME := "dhd"
WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/dhd.ko"

# Don't use qcom camera HAL
TARGET_PROVIDES_CAMERA_HAL_MSM8974 := true
TARGET_PROVIDES_CAMERA_HAL :=

# Build lights 
TARGET_PROVIDES_LIBLIGHT := true

# Time services
BOARD_USES_QC_TIME_SERVICES := true

# Display
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
OVERRIDE_RS_DRIVER:= libRSDriver_adreno.so
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true

# Shader cache config options
# Maximum size of the  GLES Shaders that can be cached for reuse.
# Increase the size if shaders of size greater than 12KB are used.
MAX_EGL_CACHE_KEY_SIZE := 12*1024

# Maximum GLES shader cache size for each app to store the compiled shader
# binaries. Decrease the size if RAM or Flash Storage size is a limitation
# of the device.
MAX_EGL_CACHE_SIZE := 2048*1024

# Assert
TARGET_OTA_ASSERT_DEVICE := ks01ltexx,GT-I9506,ks01lte

# PowerHAL
TARGET_POWERHAL_VARIANT := qcom
TARGET_POWERHAL_SET_INTERACTIVE_EXT := device/samsung/ks01lte/power/power_ext.c

TARGET_RELEASETOOLS_EXTENSIONS := device/samsung/ks01lte

# RIL Debug
BOARD_RIL_CLASS := ../../../device/samsung/ks01lte/ril
