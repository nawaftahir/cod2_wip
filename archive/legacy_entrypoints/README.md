# Historical entry points, not active gates

These preserve the exploratory Makefile and library-era API checker. They depend
on old research runs and are not current renderer checks. Do not execute them
or restore their /FORCE build as a release path.

Use `sh target/work/tools/build.sh` from gfx, or `make verify` from gfx/target.
The maintained build, referees, fixtures and proof do not import dev/codex.
Pinned API evidence lives under target/work/proof/retail/refapi_pinned.json;
callback labels/signatures are not certified just because addresses are pinned.

No archived source or binary was deleted. Client tools outside gfx still
reference dev/codex; this migration does not make their deletion safe.
