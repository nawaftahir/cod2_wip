COALESCE_OBJ := $(B)/libraries/coalesce.obj
XL += $(COALESCE_OBJ)
include scratch/codex35_predicate_merge/link.mk
$(OUT): $(COALESCE_OBJ)
$(COALESCE_OBJ): src/codex_shader_program_coalesce/coalesce.cpp scratch/codex19_dxerr/compiler/cl.exe scratch/codex35_program_coalesce/link.mk
	@mkdir -p $(dir $@)
	INCLUDE='Z:\opt\msvc710\Vc7\include;Z:\opt\msvc710\Vc7\PlatformSDK\include;Z:\dxsdk\Include' \
	wine $(DXERR_COMPILER) /nologo /c /O1 /Oy- /hotpatch /MT /Gy /d2QIftol /Fo$(subst /,\\,$@) $(subst /,\\,$<)
