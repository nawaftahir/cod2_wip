# CoD2Radiant.exe 1.0 reconstruction. Every target runs inside the toolchain image.
#   make show A=0x...          everything about one retail function
#   make try S=src/x.cpp A=0x...   compile one file and check one function
#   make verify  recompile every ledger row and check it (the referee)
#   make meter    progress numbers, written to build/summary.md
#   make gate     verify + meter, fails if anything broke or went down (CI runs this)
#   make accept   gate, then record the new numbers in ledger/meter.json (commit it)
#   make queue    regenerate queue/queue.tsv (owner)
#   make map      regenerate data/tu_map.tsv + link/order.txt (owner)
#   make libs     regenerate data/lib_funcs.tsv (owner, slow)
IMAGE ?= cod2-radiant-msvc71
ifdef RADIANT_IN_IMAGE
RUN =
else
RUN = docker run --rm -v $(CURDIR):/w -w /w -e RADIANT_IN_IMAGE=1 $(IMAGE)
endif

.PHONY: show try verify meter gate accept queue map libs image clean

show:
	$(RUN) python3 tools/show.py $(A)

try:
	$(RUN) python3 tools/verify.py $(S) $(A)

verify:
	$(RUN) python3 tools/verify.py --all

meter:
	$(RUN) python3 tools/meter.py

gate:
	$(RUN) sh -c 'python3 tools/verify.py --all; python3 tools/meter.py --gate'

accept:
	$(RUN) sh -c 'python3 tools/verify.py --all && python3 tools/meter.py --update'

queue:
	$(RUN) python3 tools/gen_queue.py

map:
	$(RUN) python3 tools/tu_map.py

libs:
	$(RUN) python3 tools/lib_sweep.py

image:
	toolchain/build.sh $(IMAGE)

clean:
	rm -rf build
