#
# Copyright (C) 2011 The CyanogenMod Project
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

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

## Get non-open-source specific aspects
$(call inherit-product-if-exists, vendor/samsung/ks01lte/ks01lte-vendor.mk)

## overlays
DEVICE_PACKAGE_OVERLAYS += device/samsung/ks01lte/overlay

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi xxhdpi
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

# Pedometer
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:system/etc/permissions/android.hardware.sensor.stepcounter.xml \
	frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:system/etc/permissions/android.hardware.sensor.stepdetector.xml \
	device/samsung/ks01lte/sensor_def_qcomdev.conf:system/etc/sensor_def_qcomdev.conf

# Audio configuration
PRODUCT_COPY_FILES += \
    device/samsung/ks01lte/audio/audio_policy.conf:system/etc/audio_policy.conf \
    device/samsung/ks01lte/audio/audio_effects.conf:system/vendor/etc/audio_effects.conf \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    device/samsung/ks01lte/media/media_profiles.xml:system/etc/media_profiles.xml \
    device/samsung/ks01lte/audio/snd_soc_msm_Taiko:system/etc/snd_soc_msm/snd_soc_msm_Taiko \
    device/samsung/ks01lte/audio/snd_soc_msm_Taiko_CDP:system/etc/snd_soc_msm/snd_soc_msm_Taiko_CDP \
    device/samsung/ks01lte/audio/mixer_paths.xml:system/etc/mixer_paths.xml \
    device/samsung/ks01lte/audio/wcd9320_mbhc.bin:system/etc/firmware/wcd9320/wcd9320_mbhc.bin \
    device/samsung/ks01lte/audio/wcd9320_anc.bin:system/etc/firmware/wcd9320/wcd9320_anc.bin \
    device/samsung/ks01lte/audio/wfdconfig.xml:system/etc/wfdconfig.xml \
    device/samsung/ks01lte/audio/wfdconfigsink.xml:system/etc/wfdconfigsink.xml

# Thermal config
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/thermal-engine-8974.conf:system/etc/thermal-engine-8974.conf \
    $(LOCAL_PATH)/thermald-8974.conf:system/etc/thermald-8974.conf

# Bluetooth
PRODUCT_COPY_FILES += \
    device/samsung/ks01lte/bluetooth/bcm4335_prepatch.hcd:system/vendor/firmware/bcm4335_prepatch.hcd

# Media Profile
PRODUCT_COPY_FILES += \
    device/samsung/ks01lte/media/media_profiles.xml:system/etc/media_profiles.xml

PRODUCT_PACKAGES += \
        libmm-omxcore \
	libdivxdrmdecrypt \
	libOmxVdec \
	libOmxVenc \
	libOmxCore \
	libOmxAacEnc \
	libOmxAmrEnc \
	libstagefrighthw \
	libOmxQcelp13Enc \
	libOmxEvrcEnc \
	libOmxAmrEnc \
	libc2dcolorconvert

# Extended media support
PRODUCT_PACKAGES += \
    qcmediaplayer

PRODUCT_BOOT_JARS += qcmediaplayer

# support for touchscreen
PRODUCT_COPY_FILES += \
    device/samsung/ks01lte/sec_touchscreen.idc:system/usr/idc/sec_touchscreen.idc

# GPS
PRODUCT_PACKAGES += \
    gps.msm8974 \
    libgps.utils \
    libloc_core \
    libloc_eng

GPS_CONF := device/samsung/ks01lte/gps/gps.conf

PRODUCT_COPY_FILES += \
    $(GPS_CONF):/system/etc/gps.conf \
    device/samsung/ks01lte/gps/sap.conf:system/etc/sap.conf \
    device/samsung/ks01lte/gps/flp.conf:system/etc/flp.conf

# Keylayouts
PRODUCT_COPY_FILES += \
    device/samsung/ks01lte/keylayout/atmel_mxt_ts.kl:system/usr/keylayout/atmel_mxt_ts.kl \
    device/samsung/ks01lte/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    device/samsung/ks01lte/keylayout/sec_touchkey.kl:system/usr/keylayout/sec_touchkey.kl \
    device/samsung/ks01lte/keylayout/sec_dmb_key.kl:system/usr/keylayout/sec_dmb_key.kl

# Ramdisk
PRODUCT_PACKAGES += \
    fstab.qcom \
    initlogo.rle \
    init.bt.rc \
    init.carrier.rc \
    init.crda.sh \
    init.qcom.rc \
    init.qcom.usb.rc \
    init.ril.rc \
    init.target.rc \
    init.qcom.post_boot.sh \
    ueventd.qcom.rc
# HAL
PRODUCT_PACKAGES += \
    copybit.msm8974 \
    gralloc.msm8974 \
    hwcomposer.msm8974 \
    memtrack.msm8974 \
    power.msm8974 \
    camera.msm8974 

# RIL
PRODUCT_PACKAGES += \
    rild \
    libsecril-client \
    macloader \
    SamsungServiceMode

# Audio
PRODUCT_PACKAGES += \
    audiod \
    audio.a2dp.default \
    audio_policy.msm8974 \
    audio.primary.msm8974 \
    audio.r_submix.default \
    audio.usb.default \
    libaudio-resampler \
    libqcomvisualizer \
    libqcomvoiceprocessing \
    libqcompostprocbundle \
    tinymix

# Torch
PRODUCT_PACKAGES += Torch

# Wifi
PRODUCT_PACKAGES += \
    libnetcmdiface \
    macloader \
    crda \
    regulatory.bin \
    linville.key.pub.pem

# libxml2 is needed for camera
PRODUCT_PACKAGES += libxml2

# GSM
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

# IR packages
PRODUCT_PACKAGES += \
    consumerir.msm8974
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.consumerir.xml:system/etc/permissions/android.hardware.consumerir.xml

# Nfc
NFCEE_ACCESS_PATH := device/samsung/ks01lte/nfc/nfcee_access.xml

ifeq ($(TARGET_NFC_TECH), nxp)
PRODUCT_PACKAGES += \
    libnfc \
    libnfc_jni \
    Nfc \
    Tag \
    com.android.nfc_extras

PRODUCT_COPY_FILES += \
    $(NFCEE_ACCESS_PATH):system/etc/nfcee_access.xml

else

PRODUCT_PACKAGES += \
    libnfc-nci \
    libnfc_nci_jni \
    nfc_nci.msm8974 \
    NfcNci \
    Tag \
    com.android.nfc_extras

PRODUCT_COPY_FILES += \
    $(NFCEE_ACCESS_PATH):system/etc/nfcee_access.xml \
    device/samsung/ks01lte/nfc/libnfc-brcm-20791b05.conf:system/etc/libnfc-brcm-20791b05.conf \
    device/samsung/ks01lte/nfc/libnfc-brcm-20791b04.conf:system/etc/libnfc-brcm-20791b04.conf \
    device/samsung/ks01lte/nfc/libnfc-brcm.conf:system/etc/libnfc-brcm.conf

endif

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

# Lights
PRODUCT_PACKAGES += lights.MSM8974

# QC Perf
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.extension_library=/vendor/lib/libqc-opt.so

#common build.props
PRODUCT_PROPERTY_OVERRIDES += \
    ro.chipname=msm8974 \
    ro.sf.lcd_density=480 \
    ro.opengles.version=196608 \
    persist.timed.enable=true \
    keyguard.no_require_sim=true

# Audio properties
PRODUCT_PROPERTY_OVERRIDES += \
   audio.offload.buffer.size.kb=32 \
   av.offload.enable=false \
   audio.offload.gapless.enabled=false \
   audio.offload.disable=false \
   af.resampler.quality=4 \
   tunnel.audio.encode=true \
   mm.enable.smoothstreaming=true \
   mm.enable.qcom_parser=37491

# RIL properties
PRODUCT_PROPERTY_OVERRIDES += \
   rild.libpath=/system/lib/libsec-ril.so \
   ro.ril.gprsclass=10 \
   ro.ril.hsxpa=1 \
   ro.ril.svdo=false \
   ro.ril.svlte1x=false \
   ro.telephony.call_ring.multiple=false \
   persist.radio.jbims=1 \
   ro.telephony.ril.v3=newDialCode,newDriverCallU \
   ro.telephony.ril_class=SamsungQCLteRIL

# msm_rng entropy feeder
PRODUCT_PACKAGES += \
    qrngd \
    qrngp

# Wifi
PRODUCT_COPY_FILES += \
   device/samsung/ks01lte/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf \
   device/samsung/ks01lte/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf

# Keymaster
PRODUCT_PACKAGES += \
    keystore.msm8974

# call common msm8974
$(call inherit-product, device/samsung/msm8974-common/msm8974.mk)

# call dalvik heap config
$(call inherit-product, frameworks/native/build/phone-xxhdpi-2048-dalvik-heap.mk)

# call hwui memory config
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk)
