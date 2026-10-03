CLEANUP_OBJ := $(B)/libraries/cleanup.obj
XL += $(CLEANUP_OBJ)
include scratch/codex35_vectorize_helpers/link.mk
$(OUT): $(CLEANUP_OBJ)
$(CLEANUP_OBJ): src/codex_shader_program_cleanup/cleanup.cpp scratch/codex19_dxerr/compiler/cl.exe scratch/codex35_program_cleanup/link.mk
	@mkdir -p $(dir $@)
	INCLUDE='Z:\opt\msvc710\Vc7\include;Z:\opt\msvc710\Vc7\PlatformSDK\include;Z:\dxsdk\Include' \
	wine $(DXERR_COMPILER) /nologo /c /O1 /Oy- /hotpatch /MT /Gy /d2QIftol /Fo$(subst /,\\,$@) $(subst /,\\,$<)
