# Inherit full common Titanium stuff
$(call inherit-product, vendor/titanium/config/common_full.mk)

# Required packages
PRODUCT_PACKAGES += \
    LatinIME

# Include Titanium LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/titanium/overlay/dictionaries

$(call inherit-product, vendor/titanium/config/telephony.mk)
