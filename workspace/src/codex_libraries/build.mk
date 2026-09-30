# Include before closed.mk; compile SDK lookup source separately from /GL engine TUs.
B ?= build/closed
DXERR_COMPILER ?= scratch/codex19_dxerr/compiler/cl.exe
DXERR_NAMES := dxerr9_name dxerr9_name_w dxerr9_description_a dxerr9_description_w
DXERR_OBJS := $(addprefix $(B)/libraries/,$(addsuffix .obj,$(DXERR_NAMES)))

.PHONY: dxerr-libraries
dxerr-libraries: $(DXERR_OBJS)

$(DXERR_OBJS): $(DXERR_COMPILER) $(wildcard scratch/codex19_dxerr/compiler/*.dll) src/codex_libraries/build.mk

$(B)/libraries/%.obj: src/codex_libraries/%.cpp
	@mkdir -p $(dir $@)
	INCLUDE='Z:\opt\msvc710\Vc7\include;Z:\opt\msvc710\Vc7\PlatformSDK\include' \
	wine $(DXERR_COMPILER) /nologo /c /O1 /Oy- /hotpatch /MT \
		/Fo$(subst /,\\,$@) $(subst /,\\,$<)
