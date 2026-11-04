READ_NAMES := read_typed shader_version
READ_OBJS := $(addprefix $(B)/libraries/,$(addsuffix .obj,$(READ_NAMES)))
XL += $(READ_OBJS)
include scratch/codex30_parser/link.mk
$(OUT): $(READ_OBJS)
$(READ_OBJS): scratch/codex19_dxerr/compiler/cl.exe scratch/codex30_reads/link.mk
$(B)/libraries/read_typed.obj: src/codex_shader_constants/read_typed.cpp
$(B)/libraries/shader_version.obj: src/codex_shader_constants/shader_version.cpp
$(B)/libraries/%.obj: src/codex_shader_constants/%.cpp
	@mkdir -p $(dir $@)
	INCLUDE='Z:\opt\msvc710\Vc7\include;Z:\opt\msvc710\Vc7\PlatformSDK\include;Z:\dxsdk\Include' \
	wine $(DXERR_COMPILER) /nologo /c /O1 /Oy- /hotpatch /MT /Gy /Fo$(subst /,\\,$@) $(subst /,\\,$<)
