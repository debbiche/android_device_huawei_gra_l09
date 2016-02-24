$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
#$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/huawei/p8/p8-vendor.mk)

# Enable ADB during boot for debugging. (Very unsafe. Remove before public build)

ADDITIONAL_DEFAULT_PROPERTIES += \
	ro.adb.secure=0 \
	ro.secure=0 \
	ro.debuggable=1

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
	$(LOCAL_PATH)/ramdisk/init.rc:root/init.rc \
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

PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=15

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.usb.default \
    audio.r_submix.default \
    libemoji \
    sf2 \
    stream \
    record \
    recordvideo \
    libaudioutils \
    libaudio-resampler \
    codec

PRODUCT_PACKAGES += \
    wpa_supplicant.conf \
    hostapd.conf

# Misc
PRODUCT_PACKAGES += \
    setup_fs \
    librs_jni \
    libsrec_jni \
    com.android.future.usb.accessory \

# Bluetooth
PRODUCT_PACKAGES += \
    libtinyalsa \

PRODUCT_PACKAGES += \
    bt_vendor.conf \
    libbt-vendor \
    lib-imsvt

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_p8
PRODUCT_DEVICE := p8





