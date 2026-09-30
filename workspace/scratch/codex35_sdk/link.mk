include src/codex_libraries/build.mk
include src/codex_libraries/shader_build.mk
XL += $(DXERR_OBJS) $(SHADER_OBJS)
include closed.mk
$(OUT): $(DXERR_OBJS) $(SHADER_OBJS)
