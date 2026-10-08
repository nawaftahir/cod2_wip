NODE_OBJS := $(B)/libraries/nodes.obj
XL += $(NODE_OBJS)
include scratch/codex30_instructions/link.mk
$(OUT): $(NODE_OBJS)
$(NODE_OBJS): src/codex_shader_nodes/nodes.cpp scratch/codex19_dxerr/compiler/cl.exe scratch/codex35_nodes/link.mk
	@mkdir -p $(dir $@)
	INCLUDE='Z:\opt\msvc710\Vc7\include;Z:\opt\msvc710\Vc7\PlatformSDK\include;Z:\dxsdk\Include' \
	wine $(DXERR_COMPILER) /nologo /c /O1 /Oy- /hotpatch /MT /Gy /Fo$(subst /,\\,$@) $(subst /,\\,$(filter %.cpp,$^))
