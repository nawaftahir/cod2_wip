# Web worker checkpoint

Assignment: src/radiant/FindTextureDlg.cpp, exclusively on web/reconstruction.

## Trial 1 — reference reconstruction

A full first-pass class draft is reconstructed from the bundled Q3 source and the
retail instruction inventory. CoD2-specific evidence adds the BOOL at +0x80
(DDX control 1525 and the fifth FindReplaceTextures argument) while preserving
the Q3 field order. The constructor deliberately does not assign that +0x80
member: retail initializes +0x70, +0x7c and +0x84 but has no +0x80 store; the
global object's zero-initialized storage supplies its initial zero.

The draft also preserves the Q3 global object + reference pattern, the live
find/replace routing flag, registry window placement, five-argument replacement
call, and message-map order. All sixteen inventoried entries are requested in
research/web/trial.tsv so CI can classify authored, generated and message-map
bodies in one bounded attempt.

Result: PENDING hosted web-trial. No new game credit is claimed until exact
MATCH results are observed. Baseline remains 569 / 68,749 game bytes.
