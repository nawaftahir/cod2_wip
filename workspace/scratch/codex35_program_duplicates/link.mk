DUPLICATES_OBJ := $(B)/libraries/duplicates.obj
XL += $(DUPLICATES_OBJ)
include scratch/codex35_program_sort/link.mk
$(OUT): $(DUPLICATES_OBJ)
$(DUPLICATES_OBJ): src/codex_shader_program_duplicates/duplicates.cpp scratch/codex19_dxerr/compiler/cl.exe scratch/codex35_program_duplicates/link.mk
	@mkdir -p $(dir $@)
	INCLUDE='Z:\opt\msvc710\Vc7\include;Z:\opt\msvc710\Vc7\PlatformSDK\include;Z:\dxsdk\Include' \
	wine $(DXERR_COMPILER) /nologo /c /O1 /Oy- /hotpatch /MT /Gy /d2QIftol /Fo$(subst /,\\,$@) $(subst /,\\,$<)
