# Inherit mini common Titqnium stuff
$(call inherit-product, vendor/titanium/config/common_mini.mk)

# Required packages
PRODUCT_PACKAGES += \
    LatinIME
