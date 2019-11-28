# system version
BUILD_DATE := $(shell date +%Y%m%d)
TARGET_PRODUCT_SHORT := $(subst titanium_,,$(TITANIUM_BUILDTYPE))

TITANIUM_BUILDTYPE ?= Alpha
TITANIUM_BUILD_VERSION := 10
TITANIUM_VERSION := TitanumOS-$(TITANIUM_BUILD_VERSION)-$(TITANIUM_BUILDTYPE)-$(TITANIUM_BUILD)-$(BUILD_DATE)
ROM_FINGERPRINT := Titanium/$(PLATFORM_VERSION)/$(TARGET_PRODUCT_SHORT)/$(shell date -u +%H%M)

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
  ro.titanium.build.version=$(TITANIUM_BUILD_VERSION) \
  ro.titanium.build.date=$(BUILD_DATE) \
  ro.titanium.buildtype=$(TITANIUM_BUILDTYPE) \
  ro.titanium.fingerprint=$(ROM_FINGERPRINT) \
  ro.titanium.version=$(TITANIUM_VERSION) \
  ro.titanium.device=$(TITANIUM_BUILD) \
  ro.modversion=$(TITANIUM_VERSION)