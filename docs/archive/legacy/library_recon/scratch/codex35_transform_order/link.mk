TRANSFORM_OBJ := $(B)/libraries/transform.obj
XL += $(TRANSFORM_OBJ)
include scratch/codex35_instruction_order/link.mk
$(OUT): $(TRANSFORM_OBJ)
$(TRANSFORM_OBJ): src/codex_shader_transform_order/transform.cpp scratch/codex19_dxerr/compiler/cl.exe scratch/codex35_transform_order/link.mk
	@mkdir -p $(dir $@)
	INCLUDE='Z:\opt\msvc710\Vc7\include;Z:\opt\msvc710\Vc7\PlatformSDK\include;Z:\dxsdk\Include' \
	wine $(DXERR_COMPILER) /nologo /c /O1 /Oy- /hotpatch /MT /Gy /d2QIftol /Fo$(subst /,\\,$@) $(subst /,\\,$<)
