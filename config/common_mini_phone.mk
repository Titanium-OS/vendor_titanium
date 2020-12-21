# Inherit mini common Titanium stuff
$(call inherit-product, vendor/titanium/config/common_mini.mk)

# Required packages
PRODUCT_PACKAGES += \
    LatinIME

$(call inherit-product, vendor/titanium/config/telephony.mk)
