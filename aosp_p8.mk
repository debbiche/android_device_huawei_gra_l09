$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/huawei/p8/p8-vendor.mk)

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# Configure dalvik heap
#$(call inherit-product, frameworks/native/build/phone-xxxhdpi-3072-dalvik-heap.mk)

# Enable ADB during boot for debugging. (Very unsafe. Remove before public build)
ADDITIONAL_DEFAULT_PROPERTIES += \
	ro.adb.secure=0 \
	ro.secure=0 \
	ro.debuggable=1 \
	ro.zygote=zygote64_32

DEVICE_PACKAGE_OVERLAYS += device/huawei/p8/overlay

LOCAL_PATH := device/huawei/p8

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/huawei/p8/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# Ramdisk
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/ramdisk/file_contexts:root/file_contexts\
	$(LOCAL_PATH)/ramdisk/property_contexts:root/property_contexts \
	$(LOCAL_PATH)/ramdisk/seapp_contexts:root/seapp_contexts \
	$(LOCAL_PATH)/ramdisk/sepolicy:root/sepolicy \
	$(LOCAL_PATH)/ramdisk/service_contexts:root/service_contexts \
	$(LOCAL_PATH)/ramdisk/init.rc:root/init.rc \
	$(LOCAL_PATH)/ramdisk/init:root/init \
	$(LOCAL_PATH)/ramdisk/ueventd.rc:root/ueventd.rc \
	$(LOCAL_PATH)/ramdisk/init.usb.rc:root/init.usb.rc \
	$(LOCAL_PATH)/ramdisk/fstab.hi3635:root/fstab.hi3635 \
	$(LOCAL_PATH)/ramdisk/init.hi3635.rc:root/init.hi3635.rc \
	$(LOCAL_PATH)/ramdisk/init.balong_modem.rc:root/init.balong_modem.rc \
	$(LOCAL_PATH)/ramdisk/init.tee.rc:root/init.tee.rc \
	$(LOCAL_PATH)/ramdisk/init.zygote64_32.rc:root/init.zygote64_32.rc \
	$(LOCAL_PATH)/ramdisk/init.audio.rc:root/init.audio.rc \
	$(LOCAL_PATH)/ramdisk/init.chip.usb.rc:root/init.chip.usb.rc \
	$(LOCAL_PATH)/ramdisk/init.connectivity.gps.rc:root/init.connectivity.gps.rc \
	$(LOCAL_PATH)/ramdisk/init.connectivity.bcm4334.rc:root/init.connectivity.bcm4334.rc \
	$(LOCAL_PATH)/ramdisk/init.connectivity.rc:root/init.connectivity.rc \
	$(LOCAL_PATH)/ramdisk/init.device.rc:root/init.device.rc \
	$(LOCAL_PATH)/ramdisk/init.extmodem.rc:root/init.extmodem.rc \
	$(LOCAL_PATH)/ramdisk/init.hisi.rc:root/init.hisi.rc \
	$(LOCAL_PATH)/ramdisk/init.manufacture.rc:root/init.manufacture.rc \
	$(LOCAL_PATH)/ramdisk/init.performance.rc:root/init.performance.rc \
	$(LOCAL_PATH)/ramdisk/init.platform.rc:root/init.platform.rc \
	$(LOCAL_PATH)/ramdisk/init.protocol.rc:root/init.protocol.rc \
	$(LOCAL_PATH)/ramdisk/init.6238.rc:root/init.6238.rc \
	$(LOCAL_PATH)/ramdisk/init.3697.rc:root/init.3697.rc \
	$(LOCAL_PATH)/ramdisk/init.5844.rc:root/init.5844.rc \
	$(LOCAL_PATH)/ramdisk/init.61173.rc:root/init.61173.rc \
	$(LOCAL_PATH)/ramdisk/init.61536.rc:root/init.61536.rc \
	$(LOCAL_PATH)/ramdisk/init.71282.rc:root/init.71282.rc \
	$(LOCAL_PATH)/ramdisk/init.71341.rc:root/init.71341.rc \
	$(LOCAL_PATH)/ramdisk/init.92105.rc:root/init.92105.rc \
	$(LOCAL_PATH)/ramdisk/ueventd.6238.rc:root/ueventd.6238.rc \
	$(LOCAL_PATH)/ramdisk/ueventd.3697.rc:root/ueventd.3697.rc \
	$(LOCAL_PATH)/ramdisk/ueventd.5844.rc:root/ueventd.5844.rc \
	$(LOCAL_PATH)/ramdisk/ueventd.61173.rc:root/ueventd.61173.rc \
	$(LOCAL_PATH)/ramdisk/ueventd.61536.rc:root/ueventd.61536.rc \
	$(LOCAL_PATH)/ramdisk/ueventd.71282.rc:root/ueventd.71282.rc \
	$(LOCAL_PATH)/ramdisk/ueventd.71341.rc:root/ueventd.71341.rc \
	$(LOCAL_PATH)/ramdisk/ueventd.92105.rc:root/ueventd.92105.rc \
	$(LOCAL_PATH)/ramdisk/ueventd.hi3635.rc:root/ueventd.hi3635.rc

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/ramdisk/sbin/check_root:root/sbin/check_root \
    $(LOCAL_PATH)/ramdisk/sbin/e2fsck_s:root/sbin/e2fsck_s \
	$(LOCAL_PATH)/ramdisk/sbin/emmc_partation:root/sbin/emmc_partation \
	$(LOCAL_PATH)/ramdisk/sbin/hdbd:root/sbin/hdbd \
	$(LOCAL_PATH)/ramdisk/sbin/kmsgcat:root/sbin/kmsgcat \
	$(LOCAL_PATH)/ramdisk/sbin/logctl_service:root/sbin/logctl_service \
	$(LOCAL_PATH)/ramdisk/sbin/ntfs-3gd:root/sbin/ntfs-3gd \
	$(LOCAL_PATH)/ramdisk/sbin/oeminfo_nvm_server:root/sbin/oeminfo_nvm_server \
	$(LOCAL_PATH)/ramdisk/sbin/teecd:root/sbin/teecd

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_policy.conf:system/etc/audio_policy.conf


# Add openssh support for remote debugging and job submission
PRODUCT_PACKAGES += ssh sftp scp sshd ssh-keygen sshd_config start-ssh uim wpa_supplicant

# Build and run only ART
PRODUCT_RUNTIMES := runtime_libart_default

# Build BT a2dp audio HAL
PRODUCT_PACKAGES += audio.a2dp.default

# Needed to sync the system clock with the RTC clock
PRODUCT_PACKAGES += hwclock

# Include USB speed switch App
PRODUCT_PACKAGES += UsbSpeedSwitch

# Build libion for new double-buffering HDLCD driver
PRODUCT_PACKAGES += libion

# Build gatord daemon for DS-5/Streamline
PRODUCT_PACKAGES += gatord

# Build gralloc for Juno
PRODUCT_PACKAGES += gralloc.hi3635

PRODUCT_PACKAGES += libGLES_android

# Include ION tests
PRODUCT_PACKAGES += iontest \
                    ion-unit-tests

# Set zygote config
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.zygote=zygote64_32
PRODUCT_PROPERTY_OVERRIDES += debug.sf.no_hw_vsync=1

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

## Device identifier. This must come after all inclusions
PRODUCT_NAME := aosp_p8
PRODUCT_DEVICE := p8
PRODUCT_MANUFACTURER := Huawei
PRODUCT_MODEL := p8
PRODUCT_BRAND := Huawei





