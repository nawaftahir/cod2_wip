# Closed source-only link (no /FORCE, no shims) of verified/src, the verified-coverage build.
#   make -f closed.mk          build/closed/gfx.dll
#   make -f closed.mk verify   bindcheck against the original DLL

IMAGE  := cod2-msvc71-build
SRCDIR ?= verified/src
B      ?= build/closed
# retail was linked /DEBUG (CodeView entry names gfx_d3d_mp_x86_s.pdb); the PDB also gives bindcheck file-static data
DBG    ?= 1
OUT    := $(B)/gfx.dll
MAP    := $(B)/gfx.map
ANCHOR ?= ../../cod2engineold/binaries/windows/1.0/gfx_d3d_mp_x86_s.dll
DXSDK  ?= $(abspath ../../sdk/sum2004)

ifndef IN_IMAGE

$(OUT) all:
	docker run --rm --network none -v $(CURDIR):/w -v $(DXSDK):/dxsdk:ro -w /w $(IMAGE) sh -c 'make -f closed.mk -j$$(nproc) IN_IMAGE=1 SRCDIR=$(SRCDIR) B=$(B) XL="$(XL)" DBG=$(DBG) $(OUT); s=$$?; chown -R $(shell id -u):$(shell id -g) build; exit $$s'

verify: all
	python3 ../tools/cmp.py $(OUT) $(MAP) $(ANCHOR) $(B)/cmp.json >/dev/null
	python3 ../tools/bindcheck.py $(OUT) $(MAP) $(ANCHOR) $(B)/cmp.json --json $(B)/bind.json $(if $(DBG),--pdb $(B)/gfx.pdb)

.PHONY: $(OUT) all verify

else

TUS    := $(shell sed -e 's/\#.*//' $(SRCDIR)/tus.txt | awk 'NF{print $$1}')
OBJS   := $(patsubst %,$(B)/obj/%.obj,$(basename $(TUS)))
# universal TUs shared with the client recon, built with its header tree and flags
CLTUS  := $(shell test -f $(SRCDIR)/cltus.txt && sed -e 's/\#.*//' $(SRCDIR)/cltus.txt | awk 'NF{print $$1}')
OBJS   += $(patsubst %,$(B)/cl/%.obj,$(basename $(CLTUS)))
CLFLAGS := /nologo /c /O2 /GL /MT /DNDEBUG /DWIN32 /FI.\\compat\\msvc71.h /I.\\compat\\include \
	/I.\\universal /I. /I.\\qcommon /I.\\game /I.\\server /I.\\bgame /I.\\script /I.\\xanim
ROOTS  := $(shell sed -e 's/\#.*//' $(SRCDIR)/roots.txt | awk 'NF{printf "/EXPORT:%s ", $$1}')
CL     := wine /opt/msvc710/Vc7/bin/cl.exe
LINK   := wine /opt/msvc710/Vc7/bin/link.exe
CFLAGS := /nologo /c /O2 /GL /MT /TP /DNDEBUG /DWIN32 /D_WIN32 /DWIN32_LEAN_AND_MEAN /DNOMINMAX \
	/FIstdint.h /FImsvc_c89.h /FImsvc_gcc_compat.h /FIwin32_compat.h /FIfloat.h /FIprocess.h \
	/DCOD2_PATCH_10 /D_GNU_SOURCE=1 /Disfinite=_finite /Dvsnprintf=_vsnprintf /Dsnprintf=_snprintf \
	/IZ:\\w\\src\\shims /IZ:\\w\\src\\shims\\msvc /IZ:\\w\\src\\shims\\posix /IZ:\\w\\src\\opencod2\\headers /IZ:\\w\\src\\opencod2 /IZ:\\w\\$(subst /,\\,$(SRCDIR)) $(if $(wildcard $(SRCDIR)/gfx_d3d),,/IZ:\\w\\src\\claude) /I. /IZ:\\dxsdk\\Include
ifdef DBG
CFLAGS += /Zi
CLFLAGS += /Zi
endif
LFLAGS := /nologo /DLL /LTCG $(if $(DBG),/DEBUG /PDB:$(subst /,\\,$(B))\\gfx.pdb) /OPT:NOREF /OPT:NOICF /BASE:0x10000000 \
	/MAP:$(subst /,\\,$(MAP)) $(XL) /LIBPATH:Z:\\dxsdk\\Lib /LIBPATH:Z:\\dxsdk\\Lib\\x86

ifneq ($(wildcard $(SRCDIR)/gfx_d3d),)
# one-tree layout (verified/src): gfx_d3d/ with the renderer flags, the rest with the engine flags
TUFLAGS = $(shell awk '$$1=="$(1)"{$$1="";print}' $(SRCDIR)/tus.txt)
W       = Z:\\w\\$(subst /,\\,$(1))

$(B)/obj/gfx_d3d/%.obj: $(SRCDIR)/gfx_d3d/%.cpp $(wildcard $(SRCDIR)/gfx_d3d/*.h)
	@mkdir -p $(dir $@)
	@$(CL) $(CFLAGS) $(if $(DBG),/Fd$(call W,$@).pdb) /Fo$(call W,$@) $(call W,$<) > $@.log 2>&1 || (cat $@.log; false)

$(B)/obj/%.obj: $(SRCDIR)/%.cpp
	@mkdir -p $(dir $@)
	@cd $(SRCDIR) && $(CL) $(CLFLAGS) $(if $(DBG),/Fd$(call W,$@).pdb) $(call TUFLAGS,$*.cpp) /Fo$(call W,$@) .\\$(subst /,\\,$*.cpp) > /w/$@.log 2>&1 || (cat /w/$@.log; false)
else
$(B)/obj/%.obj: $(SRCDIR)/%.cpp src/claude/gfx.h
	@mkdir -p $(dir $@)
	@$(CL) $(CFLAGS) $(if $(DBG),/FdZ:\\w\\$(subst /,\\,$@).pdb) /FoZ:\\w\\$(subst /,\\,$@) Z:\\w\\$(subst /,\\,$<) > $@.log 2>&1 || (cat $@.log; false)
endif

$(B)/cl/%.obj: src/cl/%.cpp
	@mkdir -p $(dir $@)
	@cd src/cl && $(CL) $(CLFLAGS) $(if $(DBG),/Fd..\\..\\$(subst /,\\,$@).pdb) $(shell awk '$$1=="$*.cpp"{$$1="";print}' $(SRCDIR)/cltus.txt) /Fo..\\..\\$(subst /,\\,$@) .\\$(subst /,\\,$*.cpp) > ../../$@.log 2>&1 || (cat ../../$@.log; false)

$(OUT): $(OBJS)
	$(LINK) $(LFLAGS) $(ROOTS) /OUT:$(subst /,\\,$(OUT)) $(subst /,\\,$(OBJS)) d3d9.lib d3dx9.lib DxErr9.lib user32.lib gdi32.lib advapi32.lib

endif
