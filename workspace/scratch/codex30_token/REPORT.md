# Tokenizer and opcode-initialization draft — DEFER

No tokenizer or opcode-initialization bytes are accepted. The exact instruction
copy, two shader-profile selectors and cast compatibility method have clean source and proofs
under `src/codex_shader_instructions` and `scratch/codex30_instructions`.

`token.cpp` is readable target-backed `CParse::Token`, original `1009f7dc`.
The SDK section is 2,907 bytes: 2,759 instructions and 148 bytes of tables.
The latest source produces 2,903 bytes, first masked difference +79 (a changed
branch displacement). Its decoded instruction sequence differs chiefly because
the shared final reserved-word comparison is placed under `using` rather than
`break`, with the opposite branch orientation. Do not accept an instruction
reordering or partial prefix as a match. `probe.py` is diagnostics only.

PINNED by the original SDK name undecorator: `FindDecl`'s last two arguments
are `CNode **`, not `CNodeScope **`. `GetToken` is a `CPreProcessor` thiscall,
token is at `CParse +0x20`, preprocessor at +4, scope +0x10, failure flag +0x40,
effect mode +0x48. These declarations are access prefixes, not allocation sizes.
The tokenizer preserves the target's signed initial-character promotion.

Bounded source control-flow trials: explicit invalid label, common identifier
block placement, return-versus-goto reserved comparisons, explicit default,
and a shared `memcmp` experiment. `memcmp` changes even-length comparisons to
word/dword comparisons and is rejected; the retained draft uses intrinsic
`strcmp`, matching the target byte comparisons. No marker helpers or assembly.

A fresh pinned-compiler batch using `/G5`, `/G6`, `/G7`, `/GB`, `/Ob2` produced
the same 2,903-byte mismatch as its then-current base source. `/Og-` produces
14,520 bytes and is rejected. Those probe JSON files preserve that earlier
source hash; later control-flow edits changed the source hash. Do not claim
the cached variant objects are fresh builds of the current draft or repeat
the unchanged flag sweep.

`instruction_init.cpp`: original opcode initializer is 607 bytes at `1008585f`.
Target-confirmed category/arity switches, inline operand buffers, allocation
cutoffs and sentinel fills are implemented. Source variants still differ in
register lifetime, switch-body placement and size (most recently 624 bytes).
Its copy overload matches separately; the whole draft file is not verified.

Next source work: resolve the actual tokenizer shared-block arrangement, then
target larger semantic groups (`CParse::Production`/related node/type routines).
Unmodified library sweeps and these flag variants are exhausted. No coverage
increase, compiler-impossibility claim, or historical-TU claim for this draft.

Further bounded trials this turn: moving the invalid-return label to the `b`
case still produces 2,903 bytes; reversing that comparison produces 2,918.
Putting the `u` case before `b` produces 2,899 but changes physical block order
and remains rejected. The retained source restores ascending character cases;
these variants establish no tokenizer coverage. Rebuild it before using its
diagnostic object, which was produced before the last source restoration.

PINNED: `CParse::IsCast` uses nested destination switches. That readable source
matches its complete 185-byte section: 137 instructions plus a 48-byte table.
Source 4/8 permits destination 5 as well as 1/4/8; the earlier boolean draft
missed this behavior. Accepted clean source is `src/codex_shader_instructions/cparse_cast.cpp`;
the draft copy here receives no duplicate credit. Destination enumerator names
remain unknown; numeric codes are pinned by the original function.
