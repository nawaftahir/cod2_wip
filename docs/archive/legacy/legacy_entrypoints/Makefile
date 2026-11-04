# gfx_d3d_mp_x86_s.dll 1.0, Visual C++ .NET 2003 (cl 13.10.3077, /GL + link /LTCG).
#
#   make            build/gfx_d3d_mp_x86_s.dll (inside the cod2-msvc71-build image)
#   make measure    coverage vs the original DLL, saved as ../runs/rNNN.json

IMAGE  := cod2-msvc71-build
OUT    := build/gfx_d3d_mp_x86_s.dll
MAP    := build/gfx_d3d_mp_x86_s.map
ANCHOR ?= ../../cod2engineold/binaries/windows/1.0/gfx_d3d_mp_x86_s.dll
DXSDK  ?= $(abspath ../../sdk/sum2004)

ifndef IN_IMAGE

$(OUT) all:
	docker run --rm --network none -v $(CURDIR):/w -v $(DXSDK):/dxsdk:ro -w /w $(IMAGE) sh -c 'make -j$$(nproc) -k IN_IMAGE=1 $(OUT); s=$$?; chown -R $(shell id -u):$(shell id -g) build; exit $$s'

measure: all
	python3 ../tools/cmp.py $(OUT) $(MAP) $(ANCHOR) build/cmp.json >/dev/null
	python3 ../tools/cov.py build/cmp.json
	@prev=$$(ls ../runs | tail -1); [ -z "$$prev" ] || python3 ../tools/delta.py ../runs/$$prev build/cmp.json 10
	@cp build/cmp.json ../runs/r$$(printf %03d $$(($$(ls ../runs | wc -l) + 1))).json

verify-views:
	python3 ../../codex/renderer/check_seven_percent.py --source src/codex/renderer_views.c

verify-refapi:
	python3 ../tools/check_refapi_context.py --source src/codex/refapi_table.c

clean:
	rm -rf build

.PHONY: $(OUT) all measure clean

else

TUS    := $(shell sed -e 's/\#.*//' src/tus.txt | awk 'NF{print $$1}')
OBJS   := $(patsubst %,build/obj/%.obj,$(basename $(TUS)))
tuflags = $(shell awk '$$1=="$(1)"{$$1="";print}' src/tus.txt)

CL     := wine /opt/msvc710/Vc7/bin/cl.exe
LINK   := wine /opt/msvc710/Vc7/bin/link.exe
# Mac 1.3 decompile headers until ported to real PC headers
CFLAGS := /nologo /c /O2 /GL /MT /DNDEBUG /DWIN32 /D_WIN32 /DWIN32_LEAN_AND_MEAN /DNOMINMAX \
	/FIstdint.h /FImsvc_c89.h /FImsvc_gcc_compat.h /FIwin32_compat.h /FIfloat.h \
	/I.\\shims /I.\\shims\\msvc /I.\\shims\\posix /I.\\headers /I. /IZ:\\dxsdk\\Include
# Mac gfx_d3d drafts: originals were .cpp (Mac STABS paths); client oc flags
MACFLAGS := /TP /FIprocess.h /DCOD2_PATCH_10 /D_GNU_SOURCE=1 /Disfinite=_finite \
	/Dvsnprintf=_vsnprintf /Dsnprintf=_snprintf
# opencod2 gfx_d3d drafts: same flags on opencod2's own headers
OC2FLAGS := $(subst /I.\\headers,/I.\\opencod2\\headers /I.\\opencod2,$(CFLAGS)) $(MACFLAGS)
LFLAGS := /nologo /DLL /LTCG /FORCE /OPT:NOREF /OPT:NOICF /BASE:0x10000000 /EXPORT:GetRefAPI \
	/MAP:$(subst /,\\,$(MAP)) /LIBPATH:Z:\\dxsdk\\Lib /LIBPATH:Z:\\dxsdk\\Lib\\x86

win = $(subst /,\\,$(1))

build/obj/%.obj: src/%.cpp
	@mkdir -p $(dir $@)
	@cd src && $(CL) $(CFLAGS) /TP $(call tuflags,$*.cpp) /Fo..\\$(call win,$@) .\\$(call win,$*.cpp) > ../$@.log 2>&1 || (cat ../$@.log; false)

build/obj/%.obj: src/%.c
	@mkdir -p $(dir $@)
	@cd src && $(CL) $(if $(filter opencod2/%,$*),$(OC2FLAGS),$(CFLAGS) $(if $(filter gfx_d3d/%,$*),$(MACFLAGS))) $(call tuflags,$*.c) /Fo..\\$(call win,$@) .\\$(call win,$*.c) > ../$@.log 2>&1 || (cat ../$@.log; false)

$(OUT): $(OBJS)
	$(LINK) $(LFLAGS) /OUT:$(call win,$@) $(call win,$(OBJS)) d3d9.lib ddraw.lib d3dx9.lib DxErr9.lib user32.lib gdi32.lib advapi32.lib

endif
