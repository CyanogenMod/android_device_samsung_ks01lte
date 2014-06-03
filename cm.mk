## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)


$(call inherit-product, device/samsung/ks01lte/full_ks01lte.mk)

# Enhanced NFC
$(call inherit-product, vendor/cm/config/nfc_enhanced.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

PRODUCT_DEVICE := ks01lte
PRODUCT_NAME := cm_ks01lte

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=ks01lte BUILD_FINGERPRINT=samsung/ks01lte/ks01ltexx:4.4.2/KOT49H/937116:user/release-keys PRIVATE_BUILD_DESC="ks01lte-user 4.4.2 KOT49H 937116 release-keys"
