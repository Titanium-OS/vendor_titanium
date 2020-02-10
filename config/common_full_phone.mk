# Inherit full common Titanium stuff
$(call inherit-product, vendor/titanium/config/common_full.mk)

# World APN list
PRODUCT_PACKAGES += \
    apns-conf.xml

# Telephony packages
PRODUCT_PACKAGES += \
    Stk \
    CellBroadcastReceiver

# Tethering - allow without requiring a provisioning app
# (for devices that check this)
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    net.tethering.noprovisioning=true

# Sensitive Phone Numbers list
PRODUCT_COPY_FILES += \
    vendor/titanium/prebuilt/common/etc/sensitive_pn.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sensitive_pn.xml

# Include Titanium LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/titanium/overlay/dictionaries
