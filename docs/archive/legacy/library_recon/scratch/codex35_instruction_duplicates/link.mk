INSTRUCTION_DUPLICATES_OBJ := $(B)/libraries/instructions.obj
XL += $(INSTRUCTION_DUPLICATES_OBJ)
include scratch/codex35_program_duplicates/link.mk
$(OUT): $(INSTRUCTION_DUPLICATES_OBJ)
$(INSTRUCTION_DUPLICATES_OBJ): src/codex_shader_instruction_duplicates/instructions.cpp scratch/codex19_dxerr/compiler/cl.exe scratch/codex35_instruction_duplicates/link.mk
	@mkdir -p $(dir $@)
	INCLUDE='Z:\opt\msvc710\Vc7\include;Z:\opt\msvc710\Vc7\PlatformSDK\include;Z:\dxsdk\Include' \
	wine $(DXERR_COMPILER) /nologo /c /O1 /Oy- /hotpatch /MT /Gy /d2QIftol /Fo$(subst /,\\,$@) $(subst /,\\,$<)
