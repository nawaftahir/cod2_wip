OUTPUT_GROUPS_OBJ := $(B)/libraries/output_groups.obj
XL += $(OUTPUT_GROUPS_OBJ)
include scratch/codex35_register_split/link.mk
$(OUT): $(OUTPUT_GROUPS_OBJ)
$(OUTPUT_GROUPS_OBJ): src/codex_shader_output_groups/output_groups.cpp scratch/codex19_dxerr/compiler/cl.exe scratch/codex35_output_groups/link.mk
	@mkdir -p $(dir $@)
	INCLUDE='Z:\opt\msvc710\Vc7\include;Z:\opt\msvc710\Vc7\PlatformSDK\include;Z:\dxsdk\Include' \
	wine $(DXERR_COMPILER) /nologo /c /O1 /Oy- /hotpatch /MT /Gy /d2QIftol /Fo$(subst /,\\,$@) $(subst /,\\,$<)
