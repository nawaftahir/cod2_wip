SORT_OBJ := $(B)/libraries/sort.obj
XL += $(SORT_OBJ)
include scratch/codex35_program_strip/link.mk
$(OUT): $(SORT_OBJ)
$(SORT_OBJ): src/codex_shader_program_sort/sort.cpp scratch/codex19_dxerr/compiler/cl.exe scratch/codex35_program_sort/link.mk
	@mkdir -p $(dir $@)
	INCLUDE='Z:\opt\msvc710\Vc7\include;Z:\opt\msvc710\Vc7\PlatformSDK\include;Z:\dxsdk\Include' \
	wine $(DXERR_COMPILER) /nologo /c /O1 /Oy- /hotpatch /MT /Gy /d2QIftol /Fo$(subst /,\\,$@) $(subst /,\\,$<)
