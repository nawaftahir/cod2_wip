include closed.mk
$(OUT): $(SRCDIR)/roots.txt $(SRCDIR)/tus.txt
$(B)/obj/jpeg-6b/%.obj: $(SRCDIR)/jpeg-6b/%.c $(wildcard $(SRCDIR)/jpeg-6b/*.h)
	@mkdir -p $(dir $@)
	@$(CL) /nologo /c /O2 /GL /MT /TC /DNDEBUG /DWIN32 /DNO_GETENV $(if $(DBG),/Zi /Fd$(call W,$@).pdb) /I$(call W,$(SRCDIR)/jpeg-6b) /Fo$(call W,$@) $(call W,$<) > $@.log 2>&1 || (cat $@.log; false)
# renderer-side qcommon/win32 copies use the renderer flags
$(B)/obj/qcommon/common.obj $(B)/obj/win32/win_threads.obj: $(B)/obj/%.obj: $(SRCDIR)/%.cpp $(wildcard $(SRCDIR)/gfx_d3d/*.h)
	@mkdir -p $(dir $@)
	@$(CL) $(CFLAGS) $(if $(DBG),/Fd$(call W,$@).pdb) /Fo$(call W,$@) $(call W,$<) > $@.log 2>&1 || (cat $@.log; false)
$(B)/obj/gfx_d3d/r_surfbounds.obj: CFLAGS += /Op
$(B)/obj/gfx_d3d/r_shadowcookie.obj: CFLAGS += /Op
$(B)/obj/gfx_d3d/r_lightgrid_weights.obj: CFLAGS += /Op
$(B)/obj/gfx_d3d/r_model_lod.obj: CFLAGS += /Op
