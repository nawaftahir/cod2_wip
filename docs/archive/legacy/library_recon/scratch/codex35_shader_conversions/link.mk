CONVERSIONS_OBJ := $(B)/libraries/conversions.obj
XL += $(CONVERSIONS_OBJ)
include scratch/codex35_shader_comment/link.mk
LFLAGS := $(filter-out $(CONVERSIONS_OBJ),$(LFLAGS)) $(CONVERSIONS_OBJ)
$(OUT): $(CONVERSIONS_OBJ)
$(CONVERSIONS_OBJ): src/codex_shader_conversions/conversions.cpp scratch/codex19_dxerr/compiler/cl.exe scratch/codex35_shader_conversions/link.mk
	@mkdir -p $(dir $@)
	INCLUDE='Z:\opt\msvc710\Vc7\include;Z:\opt\msvc710\Vc7\PlatformSDK\include;Z:\dxsdk\Include' \
	wine $(DXERR_COMPILER) /nologo /c /O1 /Oy- /hotpatch /MT /Gy /d2QIftol /Fo$(subst /,\\,$@) $(subst /,\\,$<)
