# VM_Notify handoff (11-20) - CLOSED 11-20: matched in both clients, see KNOWLEDGE

Last diff in both clients: 1.3 same-offset 1974266/1974272, 1.0 1699834/1699840. Retail loop is identical in both.

## Pinned
- Source = server 1.3 text (Mac demo STABS line table, server + 607 lines):
  `do { newSize++; currentValue--; assert(...); } while ( currentValue->type != VAR_PRECODEPOS ); len = STACKBUF_BUFFER_SIZE * size;`
- Our build of it: 22 lines (load folds into `cmp [cv+4],8`, the 8 gets a register).
- Any form with a separate load (F4 13 lines, D4 29, __assume) gives retail's loop schedule and immediate 8,
  but swaps size/load colours: `_size` scores 62, load temp 64, needs >= 65 (tie goes to the later web).
- Constant symbols are interned by value only: no spelling separates the compare 8 from the step 8.
- F4 `_size` table: def block +32, c2 preheader side block -2, loop -16, exit block +48. Preheader rule: KNOWLEDGE.

## Next attack (c2, not spellings)
1. c2dbg13 / c2opwalk13 (GAIN=2) on F4: per-block terms of `_size`; find which source shape adds one ref in
   the def or exit block, or removes the preheader -2 (block before the loop header empty + predecessor in parent loop).
2. Apply that lever to the SERVER text (with a no-code labelled stand-in if needed), not F4.
3. Gate on 1.3 (clean build, ratchet13), then port to 1.0 (w10o, ratchet10).

## Rules
No __asm, volatile, fake callees, behaviour changes, __assume. Labelled no-code stand-ins OK. Skip every VM_Notify
TRIED row. Lab tools: ~/cod2/lab (glab.sh SLOT TAG < edit.py, common.py, hdr.py, mac/stabs.py). Slots w29a/b/c.
