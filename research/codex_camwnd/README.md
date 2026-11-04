# Camera-window setup

PINNED: factory 0x402ee0 requests 0x168 bytes; runtime record 0x53f110 agrees.
Constructor 0x402f50 clears 31 dwords at +0x54 and initializes camera defaults,
clip byte +0x11c, two integers +0x120/+0x124 and a byte at +0x128.
SetXYFriend 0x403280 writes +0x50. The camera is 0x7c bytes, following that pointer.
Camera timing/origin/color offsets are independently exercised by Cam_Init.
The inherited CWnd is 0x50 in this toolchain. CPoint mouse offsets follow target
handlers; +0xe4 is the last cursor. InitCull 0x405380 reads two float triplets at
+0x138 and writes two integer triplets at +0x150. Unknown intervening storage
is represented explicitly, without invented field meaning or initializer bytes.
DEFER: decode +0xec..+0x11b and +0x12c..+0x137 before methods accessing them.

SUPPORTED names and logic: Q3Radiant CamWnd.cpp/.h. Retail has no giant transparent
brush array from the Q3 class. PreCreateWindow uses CS_NOCLOSE (not CS_OWNDC),
"QCamera", "CAM" and exact styles 0x56c70000 / 0x56000000. Its actual callback
at 0x403010 handles focus and NCCALCSIZE. The 19-entry message map is reconstructed
from 0x53ef30, including inherited CWnd handlers rather than duplicate bodies.
Unwritten callbacks remain declarations. No dummy callers or fake ABI adapters.

Ten game routines / 569 B pass the stock referee. Compiler scalar destructors and
header functions are excluded. Narrow byte equality can alias the two six-byte
getters: test_window.py checks their actual runtime-record/message-map pointers.
It also checks factory size, parent class, map signatures/known callbacks, strings,
Win32 import identities and window-procedure registration.

AfxRegisterClass is named in the original analysis inventory at 0x4fae53. All 257
bytes, including the final 16-byte EH cleanup, match the linked MFC function after
stock relocation masks, with known callees checked. Linked.code stops at a local
cleanup label after 241 B, so stock standalone checking reports a size mismatch.
This boundary issue is recorded, not hidden by changing inventory or referee.
The research check reads the complete original extent and verifies it separately;
no library bytes are added to game coverage.

Run inside the pinned image:

    python3 research/codex_camwnd/test_window.py

Current proof logs: scratch/codex_1028_camwnd/accepted_{try,gate,tests,ci}.log.
Remaining work is camera motion/rendering and the global state shared with the
other editor TUs. Preserve proven field offsets while decoding the remaining data.

## Mouse caller group

Q3's OriginalMouseDown body also matches the retail middle/right callbacks
in the reference sweep. Reconstructing the real wrappers and helper together
matches all four bodies (94 + 78 + 78 + 74 B). The retail mouse-up core also
matches (65 B): clear buttons, call 0x462760, reset the two pinned integers and
cursor byte, and restore cursor visibility. Class size/fields remain unchanged.
The live import check now covers fifteen accesses across all accepted methods.

The full initial ten-method group retained the existing ledger, but release
wrappers were 27/55 B and OriginalMouseUp was 106/46 B due to different inlining.
Mouse move was 71/69 B (57%, first +0x1a). Pruning those unmatched definitions
retains the five passing methods without fabricated keepalive callers. Their
real declarations remain for later reconstruction with new caller evidence.
