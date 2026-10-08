ASM_OBJS := $(B)/libraries/asm_nodes.obj $(B)/libraries/assembler.obj
XL += $(ASM_OBJS)
include scratch/codex35_nodes/link.mk
$(OUT): $(ASM_OBJS)
$(ASM_OBJS): $(B)/libraries/%.obj: src/codex_shader_assembler/%.cpp src/codex_shader_assembler/asm_nodes.cpp src/codex_shader_nodes/nodes.cpp src/codex_shader_support/support.h scratch/codex19_dxerr/compiler/cl.exe scratch/codex30_assembler/link.mk
	@mkdir -p $(dir $@)
	INCLUDE='Z:\opt\msvc710\Vc7\include;Z:\opt\msvc710\Vc7\PlatformSDK\include;Z:\dxsdk\Include' \
	wine $(DXERR_COMPILER) /nologo /c /O1 /Oy- /hotpatch /MT /Gy /Fo$(subst /,\\,$@) $(subst /,\\,$<)
