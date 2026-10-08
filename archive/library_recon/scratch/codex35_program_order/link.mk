PROGRAM_ORDER_OBJ := $(B)/libraries/program_order.obj
XL += $(PROGRAM_ORDER_OBJ)
include scratch/codex35_predicate_order/link.mk
$(OUT): $(PROGRAM_ORDER_OBJ)
$(PROGRAM_ORDER_OBJ): src/codex_shader_program_order/program_order.cpp scratch/codex19_dxerr/compiler/cl.exe scratch/codex35_program_order/link.mk
	@mkdir -p $(dir $@)
	INCLUDE='Z:\opt\msvc710\Vc7\include;Z:\opt\msvc710\Vc7\PlatformSDK\include;Z:\dxsdk\Include' \
	wine $(DXERR_COMPILER) /nologo /c /O1 /Oy- /hotpatch /MT /Gy /d2QIftol /Fo$(subst /,\\,$@) $(subst /,\\,$<)
