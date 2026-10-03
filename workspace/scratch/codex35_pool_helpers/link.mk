POOL_HELPERS_OBJ := $(B)/libraries/pool_helpers.obj
XL += $(POOL_HELPERS_OBJ)
include scratch/codex35_program_order/link.mk
$(OUT): $(POOL_HELPERS_OBJ)
$(POOL_HELPERS_OBJ): src/codex_shader_pool_helpers/pool_helpers.cpp scratch/codex19_dxerr/compiler/cl.exe scratch/codex35_pool_helpers/link.mk
	@mkdir -p $(dir $@)
	INCLUDE='Z:\opt\msvc710\Vc7\include;Z:\opt\msvc710\Vc7\PlatformSDK\include;Z:\dxsdk\Include' \
	wine $(DXERR_COMPILER) /nologo /c /O1 /Oy- /hotpatch /MT /Gy /d2QIftol /Fo$(subst /,\\,$@) $(subst /,\\,$<)
