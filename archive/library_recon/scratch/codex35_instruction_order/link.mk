ORDER_OBJ := $(B)/libraries/order.obj
XL += $(ORDER_OBJ)
include scratch/codex35_program_cleanup/link.mk
$(OUT): $(ORDER_OBJ)
$(ORDER_OBJ): src/codex_shader_instruction_order/order.cpp scratch/codex19_dxerr/compiler/cl.exe scratch/codex35_instruction_order/link.mk
	@mkdir -p $(dir $@)
	INCLUDE='Z:\opt\msvc710\Vc7\include;Z:\opt\msvc710\Vc7\PlatformSDK\include;Z:\dxsdk\Include' \
	wine $(DXERR_COMPILER) /nologo /c /O1 /Oy- /hotpatch /MT /Gy /d2QIftol /Fo$(subst /,\\,$@) $(subst /,\\,$<)
