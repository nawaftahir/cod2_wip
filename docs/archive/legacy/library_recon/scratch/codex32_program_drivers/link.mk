PROGRAM_DRIVERS_OBJ := $(B)/libraries/drivers.obj
XL += $(PROGRAM_DRIVERS_OBJ)
include scratch/codex35_pool_helpers/link.mk
$(OUT): $(PROGRAM_DRIVERS_OBJ)
$(PROGRAM_DRIVERS_OBJ): src/codex_shader_program_drivers/drivers.cpp scratch/codex19_dxerr/compiler/cl.exe scratch/codex32_program_drivers/link.mk
	@mkdir -p $(dir $@)
	INCLUDE='Z:\opt\msvc710\Vc7\include;Z:\opt\msvc710\Vc7\PlatformSDK\include;Z:\dxsdk\Include' \
	wine $(DXERR_COMPILER) /nologo /c /O1 /Oy- /hotpatch /MT /Gy /d2QIftol /Fo$(subst /,\\,$@) $(subst /,\\,$<)
