PATH_OVERRIDE_SOONG := $(shell echo $(TOOLS_PATH_OVERRIDE) | sed -e 's|$$|$$$$|g')

# Add variables that we wish to make available to soong here.
EXPORT_TO_SOONG := \
    KERNEL_ARCH \
    KERNEL_BUILD_OUT_PREFIX \
    KERNEL_CROSS_COMPILE \
    KERNEL_DTC_CMD \
    KERNEL_MAKE_CMD \
    KERNEL_MAKE_FLAGS \
    PATH_OVERRIDE_SOONG \
    TARGET_KERNEL_CONFIG \
    TARGET_KERNEL_SOURCE

SOONG_CONFIG_NAMESPACES += titaniumVarsPlugin

SOONG_CONFIG_titaniumVarsPlugin :=

define addVar
  SOONG_CONFIG_titaniumVarsPlugin += $(1)
  SOONG_CONFIG_titaniumVarsPlugin_$(1) := $$(subst ",\",$$($1))
endef

$(foreach v,$(EXPORT_TO_SOONG),$(eval $(call addVar,$(v))))
