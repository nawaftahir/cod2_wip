PP_OBJ := $(B)/libraries/preprocessor.obj
XL += $(PP_OBJ) $(B)/dependencies/runtime_new.lib
include scratch/codex35_lexer/link.mk
$(OUT): $(PP_OBJ)
$(PP_OBJ): src/codex_shader_preprocessor/preprocessor.cpp src/codex_shader_lexer/lexer.cpp src/codex_shader_nodes/nodes.cpp src/codex_shader_support/support.h scratch/codex19_dxerr/compiler/cl.exe scratch/codex35_preprocessor/link.mk
	@mkdir -p $(dir $@)
	INCLUDE='Z:\opt\msvc710\Vc7\include;Z:\opt\msvc710\Vc7\PlatformSDK\include;Z:\dxsdk\Include' \
	wine $(DXERR_COMPILER) /nologo /c /O1 /Oy- /hotpatch /MT /Gy /Fo$(subst /,\\,$@) $(subst /,\\,$<)
