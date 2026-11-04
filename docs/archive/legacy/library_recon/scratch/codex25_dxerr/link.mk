include src/codex_libraries/build.mk
XL += $(DXERR_OBJS)
include closed.mk
$(OUT): $(DXERR_OBJS)
