SPECIAL_LITERALS_OBJ := $(B)/libraries/special_literals.obj
XL += $(SPECIAL_LITERALS_OBJ)
include scratch/codex32_program_diagnostics/link.mk
$(OUT): $(SPECIAL_LITERALS_OBJ)
$(SPECIAL_LITERALS_OBJ): src/codex_shader_special_literals/special_literals.cpp scratch/codex19_dxerr/compiler/cl.exe scratch/codex32_special_literals/link.mk
	@mkdir -p $(dir $@)
	INCLUDE='Z:\opt\msvc710\Vc7\include;Z:\opt\msvc710\Vc7\PlatformSDK\include;Z:\dxsdk\Include' \
	wine $(DXERR_COMPILER) /nologo /c /O1 /Oy- /hotpatch /MT /Gy /d2QIftol /Fo$(subst /,\\,$@) $(subst /,\\,$<)
