POOL_READS_OBJ := $(B)/libraries/pool_reads.obj
XL += $(POOL_READS_OBJ)
include scratch/codex35_validation/link.mk
LFLAGS := $(filter-out $(POOL_READS_OBJ),$(LFLAGS)) $(POOL_READS_OBJ)
$(OUT): $(POOL_READS_OBJ)
$(POOL_READS_OBJ): src/codex_shader_pool_reads/pool_reads.cpp scratch/codex19_dxerr/compiler/cl.exe scratch/codex35_pool_reads/link.mk
	@mkdir -p $(dir $@)
	INCLUDE='Z:\opt\msvc710\Vc7\include;Z:\opt\msvc710\Vc7\PlatformSDK\include;Z:\dxsdk\Include' \
	wine $(DXERR_COMPILER) /nologo /c /O1 /Oy- /hotpatch /MT /Gy /d2QIftol /Fo$(subst /,\\,$@) $(subst /,\\,$<)
