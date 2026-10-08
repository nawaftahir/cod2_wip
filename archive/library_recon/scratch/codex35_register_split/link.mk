REGISTER_SPLIT_OBJ := $(B)/libraries/register_split.obj
XL += $(REGISTER_SPLIT_OBJ)
include scratch/codex32_argument_helpers/link.mk
$(OUT): $(REGISTER_SPLIT_OBJ)
$(REGISTER_SPLIT_OBJ): src/codex_shader_register_split/register_split.cpp scratch/codex19_dxerr/compiler/cl.exe scratch/codex35_register_split/link.mk
	@mkdir -p $(dir $@)
	INCLUDE='Z:\opt\msvc710\Vc7\include;Z:\opt\msvc710\Vc7\PlatformSDK\include;Z:\dxsdk\Include' \
	wine $(DXERR_COMPILER) /nologo /c /O1 /Oy- /hotpatch /MT /Gy /d2QIftol /Fo$(subst /,\\,$@) $(subst /,\\,$<)
