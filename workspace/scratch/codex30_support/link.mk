SUPPORT_OBJS := $(B)/libraries/alloc.obj $(B)/libraries/errors.obj
XL += $(SUPPORT_OBJS)
include scratch/codex30_assembler/link.mk
$(OUT): $(SUPPORT_OBJS)
$(SUPPORT_OBJS): $(B)/libraries/%.obj: src/codex_shader_support/%.cpp src/codex_shader_nodes/nodes.cpp src/codex_shader_support/support.h scratch/codex19_dxerr/compiler/cl.exe scratch/codex30_support/link.mk
	@mkdir -p $(dir $@)
	INCLUDE='Z:\opt\msvc710\Vc7\include;Z:\opt\msvc710\Vc7\PlatformSDK\include;Z:\dxsdk\Include' \
	wine $(DXERR_COMPILER) /nologo /c /O1 /Oy- /hotpatch /MT /Gy /Fo$(subst /,\\,$@) $(subst /,\\,$<)
