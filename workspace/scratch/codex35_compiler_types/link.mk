TYPES_OBJ := $(B)/libraries/types.obj
XL += $(TYPES_OBJ)
include scratch/codex35_clip/link.mk
$(OUT): $(TYPES_OBJ)
$(TYPES_OBJ): src/codex_shader_compiler_types/types.cpp src/codex_shader_compiler_clip/compiler.cpp src/codex_shader_nodes/nodes.cpp src/codex_shader_support/support.h scratch/codex19_dxerr/compiler/cl.exe scratch/codex35_compiler_types/link.mk
	@mkdir -p $(dir $@)
	INCLUDE='Z:\opt\msvc710\Vc7\include;Z:\opt\msvc710\Vc7\PlatformSDK\include;Z:\dxsdk\Include' \
	wine $(DXERR_COMPILER) /nologo /c /O1 /Oy- /hotpatch /MT /Gy /d2QIftol /Fo$(subst /,\\,$@) $(subst /,\\,$<)
