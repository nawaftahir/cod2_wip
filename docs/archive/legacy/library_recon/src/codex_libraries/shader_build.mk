SHADER_NAMES := instruction_predicates shader_native_constants
SHADER_OBJS := $(addprefix $(B)/libraries/,$(addsuffix .obj,$(SHADER_NAMES)))

.PHONY: shader-libraries
shader-libraries: $(SHADER_OBJS)

$(SHADER_OBJS): $(DXERR_COMPILER) $(wildcard scratch/codex19_dxerr/compiler/*.dll) src/codex_libraries/shader_build.mk

$(B)/libraries/instruction_predicates.obj: src/codex_libraries/instruction_predicates.cpp
	@mkdir -p $(dir $@)
	INCLUDE='Z:\opt\msvc710\Vc7\include;Z:\opt\msvc710\Vc7\PlatformSDK\include' \
	wine $(DXERR_COMPILER) /nologo /c /O1 /Oy- /hotpatch /MT /Fo$(subst /,\\,$@) $(subst /,\\,$<)

$(B)/libraries/shader_native_constants.obj: src/codex_libraries/shader_native_constants.cpp
	@mkdir -p $(dir $@)
	INCLUDE='Z:\opt\msvc710\Vc7\include;Z:\opt\msvc710\Vc7\PlatformSDK\include;Z:\dxsdk\Include' \
	wine $(DXERR_COMPILER) /nologo /c /O1 /Oy- /hotpatch /MT /Fo$(subst /,\\,$@) $(subst /,\\,$<)
