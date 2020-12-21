# Inherit full common Titanium stuff
$(call inherit-product, vendor/titanium/config/common_full.mk)

# Required packages
PRODUCT_PACKAGES += \
    LatinIME

$(call inherit-product, vendor/titanium/config/telephony.mk)
