# Public shader ordering reconstruction — 2026-10-03

Target: SDK Summer2004 member90 section195, public
`CProgram::ReorderInstructions`, retail100910df, complete828 bytes.
The ordinary C++ draft reproduces the complete section and relocation sites.
Its seven generated transform-context definitions also pass complete V2:
constructors23+23, destructors7+7, default Apply6, deleting destructors34+34.
Total962 bytes. The8/12-byte vtables receive zero instruction-byte credit.
Whole-DLL SHA identity is NOT established.

Clean source: `target/src/codex_shader_program_order/program_order.cpp`.
The class prefixes describe observed accesses; they are not original headers
or a claim about historical TU grouping. Virtual methods are real C++ methods,
not byte wrappers or invented table arrays.

## Procedure and bounded attempts

1. Inspected the entire828-byte SDK section and retail placement. Reused the
   accepted program/transform declarations; verified base Apply's E_NOTIMPL
   return and both virtual tables before writing the caller.
2. Initial source808/828: stack6c versus70, direct Apply call, different depth
   registers and allocation-failure placement. Four23/34-byte constructors/
   deleting-destructors already matched; caller was uncredited.
3. Pointer virtual dispatch (`transform = &instance; transform->Apply(1)`)
   restores the target's indirect constant-vtable+8 call. Switch special-op
   selection gives812, but sorts its cases differently from the target.
4. Cached argument-array and explicit if/else gives812. Sharing the opcode
   variable alone makes no improvement. Shared loop locals and the two separate
   caps bit tests give816; the optimizer combines the caps tests into exactly
   the target's DWORD load/test, unlike the single-mask BYTE-test form.
5. Repeated masks of a full token in the predicate loop preserve the required
   token spill, argument-array register and70-byte stack frame:819 bytes.
   Remaining differences are reverse-depth register allocation and the final
   allocation-success/failure layout.
6. Repeated full-token masks in the reverse-depth loop plus a real final copies
   allocation-success block gives full828-byte equality. No volatile, padding,
   ABI change, emitted bytes or compiler-impossibility claim.
7. Fresh scratch and clean V2 checks prove all eight complete definitions, exact
   typed vtable slots, weak fallback records and wrong-binding negatives.
   Final clean V2, V3/622 retaining all614, and1284 integrated CPU outputs pass;
   all three packet input sets were rehashed current. SDK selector259 distinct/
   279 removed definitions is exact. Full aggregate inclusion remains pending.

Final authoritative evidence is clean_packet.json, link_packet.json and
clean_fixture_packet.json. The earlier scratch packet.json is historical and
was not refreshed after the tooling/formatting fixes; do not use it as current
proof. Earlier source forms were not retained as individually replayable
snapshots; their observed diagnostic sizes are not source-acceptance evidence.

The broad scanner deliberately skips6/7-byte functions. Three exact named V3
locators require the already passing full V2 and full linked-section proof.
They do not waive a byte, boundary or binding check. An extension of the parent
table proof initially reused its global `prior_prove` name and recursed; the
new extension now keeps `ordering_prior_prove` separate, and affected proofs
were rebuilt/replayed. Never overwrite the inherited proof's helper globals.

## Pinned virtual context

- Base constructor10086d08/23 selects vtable10110440; its adjacent complete
  vptr-reset destructor is10086d1f/7. Default Apply10086d26/6 returns80004001.
  Base deleting-destructor slot selects10086d2c/34.
- Derived constructor10086d4e/23 selects vtable10110448; its adjacent complete
  destructor10086d65/7 resets the base vtable. Derived deleting-destructor slot
  selects1008c825/34; both34-byte bodies are identical apart from placement.
  The class-specific table slots distinguish the two locations.
- Both SDK and fresh source `_E` weak externals have COFF search kind2 and a
  `_G` fallback tag index. It is NOT search-kind3. The exact kind, fallback,
  full table bytes/relocations and every actual pointee are checked.
- Derived table+4 is the base Apply; derived table+8 is accepted Apply100cc228.
  No opaque SDK body, table or data bytes are new reconstructed-code credit.

## Behavior and cost

This routine orders shader instructions while preserving their dependencies
and conditional execution. Keep the original flag4 early return1, pool-flag8
predicate handling, unsigned root selection, ignored gaps and cleanup order;
this phase must not repair the original algorithm.

Clear/propagation and permutation passes are linear in instruction/edge counts;
predicate sorting uses the original heap sort and comparator. The non-predicate
path uses the already reconstructed recursive ordering helper. Extra arrays
consume linear space. Optimizing this algorithm now would break byte identity.
Integrated CPU equality is not direct branch coverage of every helper/method.

Commands from gfx/target:

    sh scratch/codex35_program_order/build.sh
    python3 scratch/codex35_program_order/check.py --clean
    python3 scratch/codex35_program_order/check_link.py
    python3 scratch/codex35_program_order/run_clean_test.py

Compile fixtures with compile_clean_test.sh in the pinned CPU image first.
Read the packets' input hashes; do not treat stale local artifacts as evidence.
