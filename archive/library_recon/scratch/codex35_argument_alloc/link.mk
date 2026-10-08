ARGUMENT_ALLOC_OBJ := $(B)/libraries/argument_alloc.obj
XL += $(ARGUMENT_ALLOC_OBJ)
include scratch/codex35_output_groups/link.mk
LFLAGS := $(filter-out $(ARGUMENT_ALLOC_OBJ),$(LFLAGS)) $(ARGUMENT_ALLOC_OBJ)
$(OUT): $(ARGUMENT_ALLOC_OBJ)
$(ARGUMENT_ALLOC_OBJ): src/codex_shader_argument_alloc/argument_alloc.cpp scratch/codex19_dxerr/compiler/cl.exe scratch/codex35_argument_alloc/link.mk
	@mkdir -p $(dir $@)
	INCLUDE='Z:\opt\msvc710\Vc7\include;Z:\opt\msvc710\Vc7\PlatformSDK\include;Z:\dxsdk\Include' \
	wine $(DXERR_COMPILER) /nologo /c /O1 /Oy- /hotpatch /MT /Gy /d2QIftol /Fo$(subst /,\\,$@) $(subst /,\\,$<)
