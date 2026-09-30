# Status — one line per commit to master

| Run | Coverage | Who | What |
|---|---|---|---|
| — | not built yet | Claude | workspace created |
| codex19 source audit | verified 22.020685% (239,955/1,089,680 B); no whole-DLL identity | Codex | Reconstructed SDK lookup and original CRT source add 52,927 disjoint bytes; clean helper source separated; all 359 closed-link source matches retained; 106,560 behavior comparisons pass. |
| codex25 source audit | verified 28.233151% (307,651/1,089,680 B); no whole-DLL identity | Codex | Three SDK lookup siblings add 67,696 code bytes; four clean TUs build and link together; all previous matches retained; 426,244 behavior comparisons pass. |
| codex35 source audit | verified 28.673831% (312,453/1,089,680 B); 35% pending | Codex | 37 clean SDK methods plus 29 original CRT bodies add 4,802 disjoint bytes; private link retains all 363 previous matches and accepts 400; 361,654 CPU comparisons pass. |
