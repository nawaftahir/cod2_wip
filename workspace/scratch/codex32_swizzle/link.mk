SWIZZLE_OBJ := $(B)/libraries/swizzle.obj
XL += $(SWIZZLE_OBJ)
include scratch/codex32_special_literals/link.mk
$(OUT): $(SWIZZLE_OBJ)
$(SWIZZLE_OBJ): src/codex_shader_swizzle/swizzle.cpp scratch/codex19_dxerr/compiler/cl.exe scratch/codex32_swizzle/link.mk
	@mkdir -p $(dir $@)
	INCLUDE='Z:\opt\msvc710\Vc7\include;Z:\opt\msvc710\Vc7\PlatformSDK\include;Z:\dxsdk\Include' \
	wine $(DXERR_COMPILER) /nologo /c /O1 /Oy- /hotpatch /MT /Gy /d2QIftol /Fo$(subst /,\\,$@) $(subst /,\\,$<)
