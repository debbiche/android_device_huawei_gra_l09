# Release name
PRODUCT_RELEASE_NAME := p8

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/huawei/p8/device_p8.mk)

# Configure dalvik heap
$(call inherit-product, frameworks/native/build/phone-xxxhdpi-3072-dalvik-heap.mk)

TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

## Device identifier. This must come after all inclusions
PRODUCT_NAME := cm_p8
PRODUCT_DEVICE := p8
PRODUCT_MANUFACTURER := Huawei
PRODUCT_MODEL := p8
PRODUCT_BRAND := Huawei
