10013270 push     esi
10013271 mov      esi, dword ptr [esp + 0xc]
10013275 push     edi
10013276 mov      ecx, 0xa9
1001327b mov      edi, 0x101d49c8
10013280 rep movsd dword ptr es:[edi], dword ptr [esi]
10013282 xor      eax, eax
10013284 mov      ecx, 0x6c
10013289 mov      edi, 0x1076a880
1001328e rep stosd dword ptr es:[edi], eax
10013290 mov      eax, dword ptr [esp + 0xc]
10013294 cmp      eax, 0x3b
10013297 pop      edi
10013298 pop      esi
10013299 je       0x100132b1
1001329b push     eax
1001329c push     0x3b
1001329e push     0x10193aa8
100132a3 push     0
100132a5 call     dword ptr [0x101d49c8]
100132ab add      esp, 0x10
100132ae xor      eax, eax
100132b0 ret      
100132b1 mov      dword ptr [0x1076a880], 0x10013080
100132bb mov      dword ptr [0x1076a884], 0x10013190
100132c5 mov      dword ptr [0x1076a888], 0x1001d830
100132cf mov      dword ptr [0x1076a88c], 0x1001d8a0
100132d9 mov      dword ptr [0x1076a8b0], 0x1000c8d0
100132e3 mov      dword ptr [0x1076a890], 0x10017290
100132ed mov      dword ptr [0x1076a894], 0x100172b0
100132f7 mov      dword ptr [0x1076a898], 0x10017020
10013301 mov      dword ptr [0x1076a89c], 0x10001690
1001330b mov      dword ptr [0x1076a8a0], 0x10001230
10013315 mov      dword ptr [0x1076a8a4], 0x1001d8c0
1001331f mov      dword ptr [0x1076a8a8], 0x1001d8f0
10013329 mov      dword ptr [0x1076a8ac], 0x1001d900
10013333 mov      dword ptr [0x1076a8c4], 0x100131b0
1001333d mov      dword ptr [0x1076a8b4], 0x10017300
10013347 mov      dword ptr [0x1076a8b8], 0x10017310
10013351 mov      dword ptr [0x1076a8bc], 0x10017320
1001335b mov      dword ptr [0x1076a8c0], 0x1000aa60
10013365 mov      dword ptr [0x1076a93c], 0x10021f40
1001336f mov      dword ptr [0x1076a940], 0x10021f90
10013379 mov      dword ptr [0x1076a944], 0x10021ff0
10013383 mov      dword ptr [0x1076a948], 0x10022040
1001338d mov      dword ptr [0x1076a94c], 0x10013200
10013397 mov      dword ptr [0x1076a950], 0x10013250
100133a1 mov      dword ptr [0x1076a954], 0x100222a0
100133ab mov      dword ptr [0x1076a958], 0x100222f0
100133b5 mov      dword ptr [0x1076a95c], 0x10022220
100133bf mov      dword ptr [0x1076a960], 0x10021bf0
100133c9 mov      dword ptr [0x1076a964], 0x10015ba0
100133d3 mov      dword ptr [0x1076a968], 0x1001d910
100133dd mov      dword ptr [0x1076a8c8], 0x10025510
100133e7 mov      dword ptr [0x1076a8cc], 0x10020ce0
100133f1 mov      dword ptr [0x1076a8d0], 0x10023db0
100133fb mov      dword ptr [0x1076a8d4], 0x10020cd0
10013405 mov      dword ptr [0x1076a8d8], 0x10020cb0
1001340f mov      dword ptr [0x1076a8dc], 0x10020cc0
10013419 mov      dword ptr [0x1076a8e0], 0x10023e90
10013423 mov      dword ptr [0x1076a8e4], 0x10023ed0
1001342d mov      dword ptr [0x1076a8e8], 0x10023fd0
10013437 mov      dword ptr [0x1076a8ec], 0x10001390
10013441 mov      dword ptr [0x1076a8f0], 0x10001280
1001344b mov      dword ptr [0x1076a8f4], 0x1000aac0
10013455 mov      dword ptr [0x1076a8f8], 0x1000bb30
1001345f mov      dword ptr [0x1076a8fc], 0x1000bbc0
10013469 mov      dword ptr [0x1076a900], 0x1000bc40
10013473 mov      dword ptr [0x1076a904], 0x1000bb10
1001347d mov      dword ptr [0x1076a908], 0x10001430
10013487 mov      dword ptr [0x1076a90c], 0x10001460
10013491 mov      dword ptr [0x1076a910], 0x100257a0
1001349b mov      dword ptr [0x1076a914], 0x10020f10
100134a5 mov      dword ptr [0x1076a918], 0x10020f70
100134af mov      dword ptr [0x1076a91c], 0x10020fe0
100134b9 mov      dword ptr [0x1076a920], 0x1000bad0
100134c3 mov      dword ptr [0x1076a928], 0x10021100
100134cd mov      dword ptr [0x1076a92c], 0x100211a0
100134d7 mov      dword ptr [0x1076a930], 0x10021270
100134e1 mov      dword ptr [0x1076a934], 0x100214e0
100134eb mov      dword ptr [0x1076a938], 0x100215d0
100134f5 mov      dword ptr [0x1076a924], 0x100216f0
100134ff mov      dword ptr [0x1076a974], 0x1000bce0
10013509 mov      dword ptr [0x1076a978], 0x1000ce60
10013513 mov      dword ptr [0x1076a97c], 0x1000ce70
1001351d mov      dword ptr [0x1076a980], 0x10026a50
10013527 mov      dword ptr [0x1076a984], 0x10026a70
10013531 mov      dword ptr [0x1076a988], 0x10026a90
1001353b mov      dword ptr [0x1076a98c], 0x100270e0
10013545 mov      dword ptr [0x1076a990], 0x10005980
1001354f mov      dword ptr [0x1076a994], 0x100059e0
10013559 mov      dword ptr [0x1076a998], 0x10005a40
10013563 mov      dword ptr [0x1076a99c], 0x10005970
1001356d mov      dword ptr [0x1076a96c], 0x10013260
10013577 mov      dword ptr [0x1076a970], 0x1002c100
10013581 mov      dword ptr [0x1076a9a0], 0x10032540
1001358b mov      dword ptr [0x1076a9a4], 0x1000bf40
10013595 mov      dword ptr [0x1076a9a8], 0x1000bf60
1001359f mov      dword ptr [0x1076a9ac], 0x1000c000
100135a9 mov      dword ptr [0x1076a9b0], 0x1000c010
100135b3 mov      dword ptr [0x1076a9b4], 0x100213f0
100135bd mov      dword ptr [0x1076a9b8], 0x1000c390
100135c7 mov      dword ptr [0x1076a9bc], 0x1000c4b0
100135d1 mov      dword ptr [0x1076a9c0], 0x10021300
100135db mov      dword ptr [0x1076a9c4], 0x100201b0
100135e5 mov      dword ptr [0x1076a9c8], 0x10020270
100135ef mov      dword ptr [0x1076a9cc], 0x10003430
100135f9 mov      dword ptr [0x1076a9d0], 0x10016f30
10013603 mov      dword ptr [0x1076a9d4], 0x1000bdc0
1001360d mov      dword ptr [0x1076aa00], 0x1002d4a0
10013617 mov      dword ptr [0x1076aa04], 0x10020400
10013621 mov      dword ptr [0x1076aa08], 0x1002cee0
1001362b mov      dword ptr [0x1076aa0c], 0x1002ce40
10013635 mov      dword ptr [0x1076aa10], 0x1002ce30
1001363f mov      dword ptr [0x1076aa14], 0x1002ce20
10013649 mov      dword ptr [0x1076aa18], 0x10020cf0
10013653 mov      dword ptr [0x1076aa1c], 0x10020dc0
1001365d mov      dword ptr [0x1076aa20], 0x10032f40
10013667 mov      dword ptr [0x1076aa24], 0x10032d80
10013671 mov      dword ptr [0x1076aa28], 0x10032d70
1001367b mov      dword ptr [0x1076aa2c], 0x100256c0
10013685 mov      eax, 0x1076a880
1001368a ret      
