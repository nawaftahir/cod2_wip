CONSTANT_TABLE_OBJ := $(B)/libraries/matched.obj
XL += $(CONSTANT_TABLE_OBJ)
include scratch/codex35_parse_casts/link.mk
LFLAGS := $(filter-out $(CONSTANT_TABLE_OBJ),$(LFLAGS)) $(CONSTANT_TABLE_OBJ)
$(OUT): $(CONSTANT_TABLE_OBJ)
$(CONSTANT_TABLE_OBJ): src/codex_shader_constant_table/elements.cpp
$(CONSTANT_TABLE_OBJ): src/codex_shader_constant_table/matched.cpp src/codex_shader_constant_table/constants_inline.h src/codex_shader_constant_table/constants.h src/codex_shader_constant_table/create.cpp src/codex_shader_constant_table/initialization.cpp scratch/codex19_dxerr/compiler/cl.exe scratch/codex33_constant_table/link.mk
	@mkdir -p $(dir $@)
	INCLUDE='Z:\opt\msvc710\Vc7\include;Z:\opt\msvc710\Vc7\PlatformSDK\include;Z:\dxsdk\Include' \
	wine $(DXERR_COMPILER) /nologo /c /O1 /Oy- /hotpatch /MT /Gy /d2QIftol /Fo$(subst /,\\,$@) $(subst /,\\,$<)
