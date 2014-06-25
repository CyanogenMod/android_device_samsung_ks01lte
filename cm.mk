## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)


$(call inherit-product, device/samsung/ks01lte/full_ks01lte.mk)

# Enhanced NFC
$(call inherit-product, vendor/cm/config/nfc_enhanced.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

PRODUCT_DEVICE := ks01lte
PRODUCT_NAME := cm_ks01lte

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=ks01lte BUILD_FINGERPRINT=samsung/ks01ltexx/ks01lte:4.4.4/KTU84P/I9506ZKAFTM:userdebug/release-keys PRIVATE_BUILD_DESC="ks01lte-userdebug 4.4.4 KTU84P I9506ZKAFTM release-keys"
