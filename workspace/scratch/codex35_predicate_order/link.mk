PREDICATE_OBJ := $(B)/libraries/predicate.obj
XL += $(PREDICATE_OBJ)
include scratch/codex35_transform_driver/link.mk
$(OUT): $(PREDICATE_OBJ)
$(PREDICATE_OBJ): src/codex_shader_predicate_order/predicate.cpp scratch/codex19_dxerr/compiler/cl.exe scratch/codex35_predicate_order/link.mk
	@mkdir -p $(dir $@)
	INCLUDE='Z:\opt\msvc710\Vc7\include;Z:\opt\msvc710\Vc7\PlatformSDK\include;Z:\dxsdk\Include' \
	wine $(DXERR_COMPILER) /nologo /c /O1 /Oy- /hotpatch /MT /Gy /d2QIftol /Fo$(subst /,\\,$@) $(subst /,\\,$<)
