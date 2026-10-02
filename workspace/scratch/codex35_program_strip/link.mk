STRIP_OBJ := $(B)/libraries/strip.obj
XL += $(STRIP_OBJ)
include scratch/codex35_program_pruning/link.mk
$(OUT): $(STRIP_OBJ)
$(STRIP_OBJ): src/codex_shader_program_strip/strip.cpp src/codex_shader_nodes/nodes.cpp src/codex_shader_support/support.h scratch/codex19_dxerr/compiler/cl.exe scratch/codex35_program_strip/link.mk
	@mkdir -p $(dir $@)
	INCLUDE='Z:\opt\msvc710\Vc7\include;Z:\opt\msvc710\Vc7\PlatformSDK\include;Z:\dxsdk\Include' \
	wine $(DXERR_COMPILER) /nologo /c /O1 /Oy- /hotpatch /MT /Gy /d2QIftol /Fo$(subst /,\\,$@) $(subst /,\\,$<)
