PROGRAM_DIAGNOSTICS_OBJ := $(B)/libraries/diagnostics.obj
XL += $(PROGRAM_DIAGNOSTICS_OBJ)
include scratch/codex32_program_drivers/link.mk
$(OUT): $(PROGRAM_DIAGNOSTICS_OBJ)
$(PROGRAM_DIAGNOSTICS_OBJ): src/codex_shader_program_diagnostics/diagnostics.cpp scratch/codex19_dxerr/compiler/cl.exe scratch/codex32_program_diagnostics/link.mk
	@mkdir -p $(dir $@)
	INCLUDE='Z:\opt\msvc710\Vc7\include;Z:\opt\msvc710\Vc7\PlatformSDK\include;Z:\dxsdk\Include' \
	wine $(DXERR_COMPILER) /nologo /c /O1 /Oy- /hotpatch /MT /Gy /d2QIftol /Fo$(subst /,\\,$@) $(subst /,\\,$<)
