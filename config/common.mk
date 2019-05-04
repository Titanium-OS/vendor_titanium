# Allow vendor/extra to override any property by setting it first
$(call inherit-product-if-exists, vendor/extra/product.mk)

PRODUCT_BRAND ?= Titanium-OS

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

ifneq ($(TARGET_BUILD_VARIANT),user)
# Thank you, please drive thru!
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += persist.sys.dun.override=0
endif

ifeq ($(TARGET_BUILD_VARIANT),eng)
# Disable ADB authentication
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += ro.adb.secure=0
else
# Enable ADB authentication
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += ro.adb.secure=1
endif

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/titanium/prebuilt/common/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/titanium/prebuilt/common/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/titanium/prebuilt/common/bin/50-titanium.sh:system/addon.d/50-titanium.sh \
    vendor/titanium/prebuilt/common/bin/blacklist:system/addon.d/blacklist

ifneq ($(AB_OTA_PARTITIONS),)
PRODUCT_COPY_FILES += \
    vendor/titanium/prebuilt/common/bin/backuptool_ab.sh:system/bin/backuptool_ab.sh \
    vendor/titanium/prebuilt/common/bin/backuptool_ab.functions:system/bin/backuptool_ab.functions \
    vendor/titanium/prebuilt/common/bin/backuptool_postinstall.sh:system/bin/backuptool_postinstall.sh
endif

# Some Permissions
PRODUCT_COPY_FILES += \
    vendor/titanium/config/permissions/privapp-permissions-custom.xml:system/etc/permissions/privapp-permissions-custom.xml

# system mount
PRODUCT_COPY_FILES += \
    vendor/titanium/prebuilt/common/bin/system-mount.sh:install/bin/system-mount.sh

# Backup Services whitelist
PRODUCT_COPY_FILES += \
    vendor/titanium/config/permissions/backup.xml:system/etc/sysconfig/backup.xml

# Copy all titanium-specific init rc files
$(foreach f,$(wildcard vendor/titanium/prebuilt/common/etc/init/*.rc),\
	$(eval PRODUCT_COPY_FILES += $(f):system/etc/init/$(notdir $f)))

# Copy over added mimetype supported in libcore.net.MimeUtils
PRODUCT_COPY_FILES += \
    vendor/titanium/prebuilt/common/lib/content-types.properties:system/lib/content-types.properties

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Enable wireless Xbox 360 controller support
PRODUCT_COPY_FILES += \
    frameworks/base/data/keyboards/Vendor_045e_Product_028e.kl:system/usr/keylayout/Vendor_045e_Product_0719.kl

# This is titanium!
PRODUCT_COPY_FILES += \
    vendor/titanium/config/permissions/privapp-permissions-titanium.xml:system/etc/permissions/privapp-permissions-titanium.xml

# Power whitelist
PRODUCT_COPY_FILES += \
    vendor/titanium/config/permissions/titanium-power-whitelist.xml:system/etc/sysconfig/titanium-power-whitelist.xml

# Include AOSP audio files
include vendor/titanium/config/aosp_audio.mk

# Include Google fonts
include vendor/titanium/config/fonts.mk

# Do not include art debug targets
PRODUCT_ART_TARGET_INCLUDE_DEBUG_BUILD := false

# Strip the local variable table and the local variable type table to reduce
# the size of the system image. This has no bearing on stack traces, but will
# leave less information available via JDWP.
PRODUCT_MINIMIZE_JAVA_DEBUG_INFO := true

# Bootanimation
PRODUCT_PACKAGES += \
    bootanimatiom.zip

# Lawnchair
PRODUCT_PACKAGES += \
    Lawnchair

PRODUCT_COPY_FILES += \
    vendor/titanium/prebuilt/common/etc/permissions/privapp-permissions-lawnchair.xml:system/etc/permissions/privapp-permissions-lawnchair.xml \
    vendor/titanium/prebuilt/common/etc/sysconfig/lawnchair-hiddenapi-package-whitelist.xml:system/etc/sysconfig/lawnchair-hiddenapi-package-whitelist.xml

# Accents
PRODUCT_PACKAGES += \
    AccentColorYellowOverlay \
    AccentColorVioletOverlay \
    AccentColorTealOverlay \
    AccentColorRedOverlay \
    AccentColorQGreenOverlay \
    AccentColorPinkOverlay \
    AccentColorLightPurpleOverlay \
    AccentColorIndigoOverlay \
    AccentColorFlatPinkOverlay \
    AccentColorCyanOverlay \
    AccentColorBlueGrayOverlay

# Charger
PRODUCT_PACKAGES += \
    charger_res_images

# Storage manager
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.storage_manager.enabled=true

# Media
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    media.recorder.show_manufacturer_and_model=true

PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += vendor/titanium/overlay
DEVICE_PACKAGE_OVERLAYS += vendor/titanium/overlay/common

# Bootanimation
include vendor/titanium/config/bootanimation.mk

# Packages
include vendor/titanium/config/packages.mk

# Version
include vendor/titanium/config/version.mk

-include $(WORKSPACE)/build_env/image-auto-bits.mk
