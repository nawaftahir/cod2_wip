PROGRAM_OBJ := $(B)/libraries/program.obj
XL += $(PROGRAM_OBJ)
include scratch/codex35_compiler_types/link.mk
$(OUT): $(PROGRAM_OBJ)
$(PROGRAM_OBJ): src/codex_shader_program/program.cpp src/codex_shader_nodes/nodes.cpp src/codex_shader_support/support.h scratch/codex19_dxerr/compiler/cl.exe scratch/codex31_program/link.mk
	@mkdir -p $(dir $@)
	INCLUDE='Z:\opt\msvc710\Vc7\include;Z:\opt\msvc710\Vc7\PlatformSDK\include;Z:\dxsdk\Include' \
	wine $(DXERR_COMPILER) /nologo /c /O1 /Oy- /hotpatch /MT /Gy /d2QIftol /Fo$(subst /,\\,$@) $(subst /,\\,$<)
