INSTRUCTION_NAMES := instruction_copy shader_profiles cparse_cast
INSTRUCTION_OBJS := $(addprefix $(B)/libraries/,$(addsuffix .obj,$(INSTRUCTION_NAMES)))
XL += $(INSTRUCTION_OBJS)
include scratch/codex30_reads/link.mk
$(OUT): $(INSTRUCTION_OBJS)
$(INSTRUCTION_OBJS): scratch/codex19_dxerr/compiler/cl.exe scratch/codex30_instructions/link.mk
$(B)/libraries/instruction_copy.obj: src/codex_shader_instructions/instruction_copy.cpp
$(B)/libraries/shader_profiles.obj: src/codex_shader_instructions/shader_profiles.cpp
$(B)/libraries/cparse_cast.obj: src/codex_shader_instructions/cparse_cast.cpp
$(INSTRUCTION_OBJS):
	@mkdir -p $(dir $@)
	INCLUDE='Z:\opt\msvc710\Vc7\include;Z:\opt\msvc710\Vc7\PlatformSDK\include;Z:\dxsdk\Include' \
	wine $(DXERR_COMPILER) /nologo /c /O1 /Oy- /hotpatch /MT /Gy /Fo$(subst /,\\,$@) $(subst /,\\,$(filter %.cpp,$^))
