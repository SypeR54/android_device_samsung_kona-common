#
# Copyright (C) 2016 The CyanogenMod Project
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

LOCAL_PATH := device/GeneralMobile/mehmet

PRODUCT_CHARACTERISTICS := tablet

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xhdpi hdpi
# A list of dpis to select prebuilt apk, in precedence order.
PRODUCT_AAPT_PREBUILT_DPI := xhdpi hdpi

# Boot animation
TARGET_BOOTANIMATION_HALF_RES := true
TARGET_SCREEN_HEIGHT := 800
TARGET_SCREEN_WIDTH := 1280

TARGET_HAS_CAM_FLASH := false

# Init files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/fstab.mehmet:root/fstab.mehmet \
    $(LOCAL_PATH)/rootdir/init.target.rc:root/init.target.rc \
    $(LOCAL_PATH)/rootdir/ueventd.mehmet.rc:recovery/root/ueventd.mehmet.rc \
    $(LOCAL_PATH)/rootdir/ueventd.mehmet.rc:root/ueventd.mehmet.rc

# Stock MM blobs
PRODUCT_PACKAGES += \
    libxml2 \
    libprotobuf-cpp-full

# Packages
PRODUCT_PACKAGES += \
    libsamsung_symbols \
    tiny_hw \
    tinyplay \
    SamsungServiceMode \
    Stk

# Codecs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media_codecs.xml:system/etc/media_codecs.xml

# Camera
PRODUCT_PACKAGES += \
    Snap \
    camera.smdk4x12

# RIL
PRODUCT_PACKAGES += \
    libsecril-client \
    libsecril-client-sap

# Sensors
PRODUCT_PACKAGES += \
    sensors.smdk4x12

# IR packages
PRODUCT_PACKAGES += \
    consumerir.exynos4

# Weather providers
PRODUCT_PACKAGES += \
	OpenWeatherMapWeatherProvider \
	YahooWeatherProvider \
	WundergroundWeatherProvider

# Doze
PRODUCT_PACKAGES += \
    SamsungDoze

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.consumerir.xml:system/etc/permissions/android.hardware.consumerir.xml

PRODUCT_PROPERTY_OVERRIDES += \
    ro.cm.hardware.cabc=/sys/class/mdnie/mdnie/cabc

$(call inherit-product, frameworks/native/build/tablet-10in-xhdpi-2048-dalvik-heap.mk)
$(call inherit-product, vendor/GeneralMobile/mehmet/mehmet.mk)
$(call inherit-product, device/GeneralMobile/mehmet/common.mk)
