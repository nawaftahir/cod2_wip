COMMENT_OBJ := $(B)/libraries/comment.obj
XL += $(COMMENT_OBJ)
include scratch/codex35_pool_reads/link.mk
LFLAGS := $(filter-out $(COMMENT_OBJ),$(LFLAGS)) $(COMMENT_OBJ)
$(OUT): $(COMMENT_OBJ)
$(COMMENT_OBJ): src/codex_shader_comment/comment.cpp scratch/codex19_dxerr/compiler/cl.exe scratch/codex35_shader_comment/link.mk
	@mkdir -p $(dir $@)
	INCLUDE='Z:\opt\msvc710\Vc7\include;Z:\opt\msvc710\Vc7\PlatformSDK\include;Z:\dxsdk\Include' \
	wine $(DXERR_COMPILER) /nologo /c /O1 /Oy- /hotpatch /MT /Gy /d2QIftol /Fo$(subst /,\\,$@) $(subst /,\\,$<)
