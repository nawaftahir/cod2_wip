# One renderer build; the former exploratory /FORCE build is archived.
.PHONY: all verify measure verify-views verify-refapi
all verify:
	cd .. && sh target/work/tools/build.sh

measure:
	python3 work/tools/layout.py build/codex_boundsoutside_1016_02/gfx.dll

verify-views verify-refapi:
	@echo 'Historical checks are archived in gfx/archive/legacy_entrypoints; use make verify for current acceptance.' >&2
	@exit 2
