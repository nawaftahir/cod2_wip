VALIDATION_OBJ := $(B)/libraries/validation.obj
XL += $(VALIDATION_OBJ)
include scratch/codex35_argument_alloc/link.mk
LFLAGS := $(filter-out $(VALIDATION_OBJ),$(LFLAGS)) $(VALIDATION_OBJ)
$(OUT): $(VALIDATION_OBJ)
$(VALIDATION_OBJ): src/codex_shader_validation/validation.cpp scratch/codex19_dxerr/compiler/cl.exe scratch/codex35_validation/link.mk
	@mkdir -p $(dir $@)
	INCLUDE='Z:\opt\msvc710\Vc7\include;Z:\opt\msvc710\Vc7\PlatformSDK\include;Z:\dxsdk\Include' \
	wine $(DXERR_COMPILER) /nologo /c /O1 /Oy- /hotpatch /MT /Gy /d2QIftol /Fo$(subst /,\\,$@) $(subst /,\\,$<)
