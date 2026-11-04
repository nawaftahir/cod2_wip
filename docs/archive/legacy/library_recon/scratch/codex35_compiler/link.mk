COMPILER_OBJ := $(B)/libraries/compiler.obj
XL += $(COMPILER_OBJ)
include scratch/codex35_preprocessor/link.mk
$(OUT): $(COMPILER_OBJ)
$(COMPILER_OBJ): src/codex_shader_compiler/compiler.cpp src/codex_shader_nodes/nodes.cpp scratch/codex19_dxerr/compiler/cl.exe scratch/codex35_compiler/link.mk
	@mkdir -p $(dir $@)
	INCLUDE='Z:\opt\msvc710\Vc7\include;Z:\opt\msvc710\Vc7\PlatformSDK\include;Z:\dxsdk\Include' \
	wine $(DXERR_COMPILER) /nologo /c /O1 /Oy- /hotpatch /MT /Gy /d2QIftol /Fo$(subst /,\\,$@) $(subst /,\\,$<)
