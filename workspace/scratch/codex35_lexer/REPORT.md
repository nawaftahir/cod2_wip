# Tokenizer acceptance — 2026-10-01

Seven clean source functions / **1,037 instruction bytes** pass V2, the
fresh private closed-link regression (523 accepted, all 516 retained), and
**9,976 full-output CPU comparisons**. Proof packets are `clean_packet.json`,
`link_packet.json`, and `fixture_packet.json`. Replay instructions and pinned
code-generation facts are in `target/src/codex_shader_lexer/README.md`.

The fresh full disjoint coverage audit passes: **328,122 / 1,089,680 =
30.111776%**, up from 30.016610%. Full output is in `aggregate.log`.
The active 35% goal still requires **53,266** verified instruction bytes.

`lexer.cpp` is the full 16-method draft. Seven complete section matches were
extracted to `lexer_matched.cpp`, then freshly compiled from the clean path.
The nine non-matches stay in scratch at **zero credit**; their exact sizes and
first differences remain in `probe_lexer.json`. Do not retry all variants
blindly or claim near-matches. `probe_lexer_matched.json` is diagnostic only;
the acceptance packets establish the actual gates.

The full batch's SDK sections total 3,473 bytes, not a 35% shortcut. Next
larger family: SDK CPreProcessor, 36 uniquely located methods / 11,993 section
bytes before excluding tables and proving source. Work starts privately in
`scratch/codex35_preprocessor/`; discovery alone receives zero coverage.

The full DLL hash, asset rendering, allocation failure, GPU/game boot, and
the active 35% goal are **not achieved**. No release-tree edits or push.
