# Copyright (C) 2011 The Android Open Source Project
# Copyright (C) 2015 The CyanogenMod Project
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
# This file is the build configuration for a full Android
# build for maguro hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps). Except for a few implementation
# details, it only fundamentally contains two inherit-product
# lines, full and maguro, hence its name.
#
 
# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
# Inherit from ks01lte device
$(call inherit-product, device/samsung/ks01lte/device.mk)

# Set those variables here to overwrite the inherited values.
PRODUCT_NAME := ks01ltexx
PRODUCT_DEVICE := ks01lte
PRODUCT_BRAND := samsung
PRODUCT_MANUFACTURER := samsung
PRODUCT_MODEL := GT-I9506

PRODUCT_GMS_CLIENTID_BASE := android-samsung

PRODUCT_BUILD_PROP_OVERRIDES += TARGET_DEVICE=ks01lte \
        PRODUCT_NAME=ks01ltexx \
        BUILD_FINGERPRINT=samsung/ks01ltexx/ks01lte:5.0.1/LRX22C/I9506XXUDOA6:user/release-keys \
        PRIVATE_BUILD_DESC="ks01ltexx-user 5.0.1 LRX22C I9506XXUDOA6 release-keys"

