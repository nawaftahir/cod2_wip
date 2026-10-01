LEXER_OBJ := $(B)/libraries/lexer.obj
XL += $(LEXER_OBJ)
include scratch/codex30_support/link.mk
$(OUT): $(LEXER_OBJ)
$(LEXER_OBJ): src/codex_shader_lexer/lexer.cpp src/codex_shader_nodes/nodes.cpp src/codex_shader_support/support.h scratch/codex19_dxerr/compiler/cl.exe scratch/codex35_lexer/link.mk
	@mkdir -p $(dir $@)
	INCLUDE='Z:\opt\msvc710\Vc7\include;Z:\opt\msvc710\Vc7\PlatformSDK\include;Z:\dxsdk\Include' \
	wine $(DXERR_COMPILER) /nologo /c /O1 /Oy- /hotpatch /MT /Gy /Fo$(subst /,\\,$@) $(subst /,\\,$<)
