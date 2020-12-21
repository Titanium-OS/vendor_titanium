# Charger
ifeq ($(WITH_TITANIUM_CHARGER),true)
    BOARD_HAL_STATIC_LIBRARIES := libhealthd.titanium
endif

include vendor/titanium/config/BoardConfigKernel.mk

ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include vendor/titanium/config/BoardConfigQcom.mk
endif

include vendor/titanium/config/BoardConfigSoong.mk
