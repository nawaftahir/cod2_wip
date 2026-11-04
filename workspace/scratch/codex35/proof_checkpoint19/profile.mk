include closed.mk
$(OUT): $(SRCDIR)/roots.txt $(SRCDIR)/tus.txt
$(B)/obj/gfx_d3d/r_surfbounds.obj: CFLAGS += /Op
$(B)/obj/gfx_d3d/r_shadowcookie_candidates.obj: CFLAGS += /Op
$(B)/obj/gfx_d3d/r_dpvs_winding.obj: $(SRCDIR)/gfx_d3d/r_dpvs_winding.c
	@mkdir -p $(dir $@)
	@$(CL) $(CFLAGS) /TC /Fd$(call W,$@).pdb /Fo$(call W,$@) $(call W,$<) > $@.log 2>&1 || (cat $@.log; false)
