PRUNING_OBJ := $(B)/libraries/pruning.obj
XL += $(PRUNING_OBJ)
include scratch/codex35_program_varying/link.mk
$(OUT): $(PRUNING_OBJ)
$(PRUNING_OBJ): src/codex_shader_program_pruning/pruning.cpp src/codex_shader_nodes/nodes.cpp src/codex_shader_support/support.h scratch/codex19_dxerr/compiler/cl.exe scratch/codex35_program_pruning/link.mk
	@mkdir -p $(dir $@)
	INCLUDE='Z:\opt\msvc710\Vc7\include;Z:\opt\msvc710\Vc7\PlatformSDK\include;Z:\dxsdk\Include' \
	wine $(DXERR_COMPILER) /nologo /c /O1 /Oy- /hotpatch /MT /Gy /d2QIftol /Fo$(subst /,\\,$@) $(subst /,\\,$<)
