CASTS_OBJ := $(B)/libraries/casts.obj
XL += $(CASTS_OBJ)
include scratch/codex35_shader_buffers/link.mk
LFLAGS := $(filter-out $(CASTS_OBJ),$(LFLAGS)) $(CASTS_OBJ)
$(OUT): $(CASTS_OBJ)
$(CASTS_OBJ): src/codex_shader_parse_casts/casts.cpp src/codex_shader_nodes/nodes.cpp scratch/codex19_dxerr/compiler/cl.exe scratch/codex35_parse_casts/link.mk
	@mkdir -p $(dir $@)
	INCLUDE='Z:\opt\msvc710\Vc7\include;Z:\opt\msvc710\Vc7\PlatformSDK\include;Z:\dxsdk\Include' \
	wine $(DXERR_COMPILER) /nologo /c /O1 /Oy- /hotpatch /MT /Gy /d2QIftol /Fo$(subst /,\\,$@) $(subst /,\\,$<)
