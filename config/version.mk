#Titanium Version
TITANIUM_BUILD_VERSION = 1.1

# Custom Titanium Platform Version
TITANIUM_PLATFORM_VERSION := 10.0

# Titanium Release
ifeq ($(TITANIUM_BUILD_TYPE), OFFICIAL)
  OFFICIAL_DEVICES = $(shell cat vendor/titanium/titanium.devices)
  FOUND_DEVICE =  $(filter $(TITANIUM_BUILD), $(OFFICIAL_DEVICES))
    ifeq ($(FOUND_DEVICE),$(TITANIUM_BUILD))
      TITANIUM_BUILD_TYPE := OFFICIAL
    else
      TITANIUM_BUILD_TYPE := UNOFFICIAL
      $(error Device is not official "$(TITANIUM_BUILD)")
    endif
endif

ifndef TITANIUM_BUILD_TYPE
  TITANIUM_BUILD_TYPE := UNOFFICIAL
endif

# TitaniumOS OTA
$(call inherit-product-if-exists, vendor/titanium/config/ota.mk)

# system version
TARGET_PRODUCT_SHORT := $(subst titanium_,,$(TITANIUM_BUILD_TYPE))

TITANIUM_DATE_YEAR := $(shell date -u +%Y)
TITANIUM_DATE_MONTH := $(shell date -u +%m)
TITANIUM_DATE_DAY := $(shell date -u +%d)
TITANIUM_DATE_HOUR := $(shell date -u +%H)
TITANIUM_DATE_MINUTE := $(shell date -u +%M)
TITANIUM_BUILD_DATE_UTC := $(shell date -d '$(TITANIUM_DATE_YEAR)-$(TITANIUM_DATE_MONTH)-$(TITANIUM_DATE_DAY) $(TITANIUM_DATE_HOUR):$(TITANIUM_DATE_MINUTE) UTC' +%s)
TITANIUM_BUILD_DATE := $(TITANIUM_DATE_YEAR)$(TITANIUM_DATE_MONTH)$(TITANIUM_DATE_DAY)-$(TITANIUM_DATE_HOUR)$(TITANIUM_DATE_MINUTE)
ROM_FINGERPRINT := TitaniumOS/$(TITANIUM_BUILD_VERSION)/$(PLATFORM_VERSION)/$(TARGET_PRODUCT_SHORT)/$(TITANIUM_BUILD_DATE)

ifeq ($(WITH_GAPPS),true)
    TITANIUM_VERSION := TitaniumOS-$(PLATFORM_VERSION)-v$(TITANIUM_BUILD_VERSION)-$(TITANIUM_BUILD_TYPE)-GApps-$(TITANIUM_BUILD)-$(TITANIUM_BUILD_DATE)
else
    TITANIUM_VERSION := TitaniumOS-$(PLATFORM_VERSION)-v$(TITANIUM_BUILD_VERSION)-$(TITANIUM_BUILD_TYPE)-$(TITANIUM_BUILD)-$(TITANIUM_BUILD_DATE)
endif

PRODUCT_GENERIC_PROPERTIES += \
  ro.titanium.build.version=$(TITANIUM_BUILD_VERSION) \
  ro.titanium.platform.version=$(TITANIUM_PLATFORM_VERSION) \
  ro.titanium.build.date=$(TITANIUM_BUILD_DATE) \
  ro.titanium.build_date_utc=$(TITANIUM_BUILD_DATE_UTC) \
  ro.titanium.buildtype=$(TITANIUM_BUILD_TYPE) \
  ro.titanium.fingerprint=$(ROM_FINGERPRINT) \
  ro.titanium.version=$(TITANIUM_VERSION) \
  ro.titanium.device=$(TITANIUM_BUILD) \
  ro.modversion=$(TITANIUM_VERSION)
