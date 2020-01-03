ifeq ($(TITANIUM_BUILD_TYPE), OFFICIAL)
  TITANIUM_OTA_VERSION_CODE := ten

  TITANIUM_PROPERTIES += \
    ro.titanium.ota.version_code=$(TITANIUM_OTA_VERSION_CODE) \
    sys.ota.disable_uncrypt=1

  PRODUCT_PACKAGES += \
    Updates

  PRODUCT_COPY_FILES += \
    vendor/titanium/config/permissions/com.titanium.ota.xml:system/etc/permissions/com.titanium.ota.xml

endif