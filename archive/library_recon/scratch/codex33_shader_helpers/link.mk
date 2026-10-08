NATIVE_HELPERS_OBJ := $(B)/libraries/native_helpers.obj
XL += $(NATIVE_HELPERS_OBJ)
include scratch/codex33_constant_table/link.mk
LFLAGS := $(filter-out $(NATIVE_HELPERS_OBJ),$(LFLAGS)) $(NATIVE_HELPERS_OBJ)
$(OUT): $(NATIVE_HELPERS_OBJ)
$(NATIVE_HELPERS_OBJ): src/codex_shader_native_helpers/native_helpers.cpp src/codex_shader_native_helpers/helpers.h scratch/codex19_dxerr/compiler/cl.exe scratch/codex33_shader_helpers/link.mk
	@mkdir -p $(dir $@)
	INCLUDE='Z:\opt\msvc710\Vc7\include;Z:\opt\msvc710\Vc7\PlatformSDK\include;Z:\dxsdk\Include' \
	wine $(DXERR_COMPILER) /nologo /c /O1 /Oy- /hotpatch /MT /Gy /d2QIftol /Fo$(subst /,\\,$@) $(subst /,\\,$<)
