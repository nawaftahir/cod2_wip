include src/codex_libraries/build.mk
include src/codex_libraries/shader_build.mk
PARSER_NAMES := d3dxtok d3dxasm d3dxshader
PARSER_OBJS := $(addprefix $(B)/libraries/,$(addsuffix .obj,$(PARSER_NAMES)))
XL += $(DXERR_OBJS) $(SHADER_OBJS) $(PARSER_OBJS)
include closed.mk
LFLAGS := /LIBPATH:$(subst /,\\,$(B))\\dependencies $(LFLAGS)
$(OUT): $(DXERR_OBJS) $(SHADER_OBJS) $(PARSER_OBJS) $(B)/dependencies/d3dx9.lib
$(PARSER_OBJS): scratch/codex19_dxerr/compiler/cl.exe $(wildcard scratch/codex19_dxerr/compiler/*.dll) src/codex_parsers/parser_core.h scratch/codex30_parser/link.mk
$(B)/libraries/d3dx%.obj: src/codex_parsers/d3dx%.cpp src/codex_parsers/d3dx%_actions.inc
	@mkdir -p $(dir $@)
	INCLUDE='Z:\opt\msvc710\Vc7\include;Z:\opt\msvc710\Vc7\PlatformSDK\include' \
	wine $(DXERR_COMPILER) /nologo /c /O1 /Oy- /hotpatch /MT /Gy /Fo$(subst /,\\,$@) $(subst /,\\,$<)
