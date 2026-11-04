VARYING_OBJ := $(B)/libraries/varying.obj
XL += $(VARYING_OBJ)
include scratch/codex35_program_flow/link.mk
$(OUT): $(VARYING_OBJ)
$(VARYING_OBJ): src/codex_shader_program_varying/varying.cpp src/codex_shader_nodes/nodes.cpp src/codex_shader_support/support.h scratch/codex19_dxerr/compiler/cl.exe scratch/codex35_program_varying/link.mk
	@mkdir -p $(dir $@)
	INCLUDE='Z:\opt\msvc710\Vc7\include;Z:\opt\msvc710\Vc7\PlatformSDK\include;Z:\dxsdk\Include' \
	wine $(DXERR_COMPILER) /nologo /c /O1 /Oy- /hotpatch /MT /Gy /d2QIftol /Fo$(subst /,\\,$@) $(subst /,\\,$<)
