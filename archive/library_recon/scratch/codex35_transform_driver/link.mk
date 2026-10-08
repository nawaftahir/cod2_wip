DRIVER_OBJ := $(B)/libraries/driver.obj
XL += $(DRIVER_OBJ)
include scratch/codex35_transform_order/link.mk
$(OUT): $(DRIVER_OBJ)
$(DRIVER_OBJ): src/codex_shader_transform_driver/driver.cpp scratch/codex19_dxerr/compiler/cl.exe scratch/codex35_transform_driver/link.mk
	@mkdir -p $(dir $@)
	INCLUDE='Z:\opt\msvc710\Vc7\include;Z:\opt\msvc710\Vc7\PlatformSDK\include;Z:\dxsdk\Include' \
	wine $(DXERR_COMPILER) /nologo /c /O1 /Oy- /hotpatch /MT /Gy /d2QIftol /Fo$(subst /,\\,$@) $(subst /,\\,$<)
