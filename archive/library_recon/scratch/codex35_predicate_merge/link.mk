PREDICATE_MERGE_OBJ := $(B)/libraries/merge.obj
XL += $(PREDICATE_MERGE_OBJ)
include scratch/codex35_instruction_duplicates/link.mk
$(OUT): $(PREDICATE_MERGE_OBJ)
$(PREDICATE_MERGE_OBJ): src/codex_shader_predicate_merge/merge.cpp scratch/codex19_dxerr/compiler/cl.exe scratch/codex35_predicate_merge/link.mk
	@mkdir -p $(dir $@)
	INCLUDE='Z:\opt\msvc710\Vc7\include;Z:\opt\msvc710\Vc7\PlatformSDK\include;Z:\dxsdk\Include' \
	wine $(DXERR_COMPILER) /nologo /c /O1 /Oy- /hotpatch /MT /Gy /d2QIftol /Fo$(subst /,\\,$@) $(subst /,\\,$<)
