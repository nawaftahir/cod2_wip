ARGUMENT_HELPERS_OBJ := $(B)/libraries/argument_helpers.obj
XL += $(ARGUMENT_HELPERS_OBJ)
include scratch/codex32_swizzle/link.mk
$(OUT): $(ARGUMENT_HELPERS_OBJ)
$(ARGUMENT_HELPERS_OBJ): src/codex_shader_argument_helpers/argument_helpers.cpp scratch/codex19_dxerr/compiler/cl.exe scratch/codex32_argument_helpers/link.mk
	@mkdir -p $(dir $@)
	INCLUDE='Z:\opt\msvc710\Vc7\include;Z:\opt\msvc710\Vc7\PlatformSDK\include;Z:\dxsdk\Include' \
	wine $(DXERR_COMPILER) /nologo /c /O1 /Oy- /hotpatch /MT /Gy /d2QIftol /Fo$(subst /,\\,$@) $(subst /,\\,$<)
