
10041140 read_window=276 (inventory, not independently bounded)
10041140 sub      esp, 0x18
10041143 push     ebx
10041144 push     esi
10041145 mov      esi, eax
10041147 mov      eax, dword ptr [0x1072d9d0]
1004114c xor      ebx, ebx
1004114e cmp      eax, ebx
10041150 push     edi
10041151 jne      0x1004115b
10041153 cmp      dword ptr [0x1072d9e0], ebx
10041159 je       0x10041160
1004115b call     0x1003a8d0
10041160 mov      eax, dword ptr [0x101ce7ec]
10041165 cmp      dword ptr [eax + 8], ebx
10041168 je       0x100411ba
1004116a mov      ecx, dword ptr [0x1072d9bc]
10041170 mov      edx, dword ptr [ecx]
10041172 push     edx
10041173 push     0x1019a42c
10041178 call     0x10060c70
1004117d mov      ecx, dword ptr [0x101ce7ec]
10041183 mov      edx, dword ptr [ecx + 8]
10041186 add      esp, 8
10041189 cmp      edx, ebx
1004118b je       0x100411ba
1004118d mov      edx, dword ptr [0x10764584]
10041193 cmp      edx, ebx
10041195 setne    cl
10041198 cmp      cl, bl
1004119a je       0x100411ba
1004119c push     eax
1004119d push     0x10193358
100411a2 push     edx
100411a3 call     0x100f6d05
100411a8 mov      edx, dword ptr [0x10764584]
100411ae add      esp, 0xc
100411b1 push     edx
100411b2 call     0x100f6c3d
100411b7 add      esp, 4
100411ba mov      edx, dword ptr [0x101ce708]
100411c0 mov      edi, dword ptr [edx + 8]
100411c3 xor      eax, eax
100411c5 cmp      edi, 2
100411c8 setne    al
100411cb mov      ecx, dword ptr [esi + 4]
100411ce mov      dword ptr [esp + 0x20], ebx
100411d2 mov      dword ptr [esp + 0x10], ebx
100411d6 dec      eax
100411d7 and      eax, 0xffffffe4
100411da add      eax, 0x40
100411dd mov      edi, eax
100411df mov      eax, dword ptr [esi + 8]
100411e2 cdq      
100411e3 idiv     edi
100411e5 movsx    edx, word ptr [ecx + 4]
100411e9 mov      dword ptr [esp + 0x18], edx
100411ed mov      dword ptr [esp + 0x1c], eax
100411f1 movsx    eax, word ptr [ecx + 2]
100411f5 mov      ecx, dword ptr [ecx + 0x14]
100411f8 mov      dword ptr [esp + 0x14], eax
100411fc cmp      dword ptr [0x1076674c], ecx
10041202 je       0x1004120b
10041204 mov      esi, ecx
10041206 call     0x1003ecb0
1004120b mov      eax, dword ptr [0x106d3194]
10041210 mov      ecx, dword ptr [eax + 0x217c78]
10041216 mov      eax, dword ptr [ecx + 8]
10041219 cmp      dword ptr [0x10766750], eax
1004121f jne      0x10041231
10041221 cmp      dword ptr [0x10766754], ebx
10041227 jne      0x10041231
10041229 cmp      dword ptr [0x10766758], edi
1004122f je       0x1004123e
10041231 push     eax
10041232 xor      ebx, ebx
10041234 xor      esi, esi
10041236 call     0x1003ed20
1004123b add      esp, 4
1004123e lea      edx, [esp + 0x10]
10041242 push     edx
10041243 push     0
10041245 call     0x1003a580
1004124a add      esp, 8
1004124d pop      edi
1004124e pop      esi
1004124f pop      ebx
10041250 add      esp, 0x18
10041253 ret      

10041260 read_window=304 (inventory, not independently bounded)
10041260 mov      eax, dword ptr [0x101ce7ec]
10041265 mov      ecx, dword ptr [eax + 8]
10041268 test     ecx, ecx
1004126a push     ebx
1004126b push     ebp
1004126c push     esi
1004126d push     edi
1004126e je       0x100412c0
10041270 mov      ecx, dword ptr [0x1072d9bc]
10041276 mov      edx, dword ptr [ecx]
10041278 push     edx
10041279 push     0x1019a400
1004127e call     0x10060c70
10041283 mov      ecx, dword ptr [0x101ce7ec]
10041289 mov      edx, dword ptr [ecx + 8]
1004128c add      esp, 8
1004128f test     edx, edx
10041291 je       0x100412c0
10041293 mov      edx, dword ptr [0x10764584]
10041299 test     edx, edx
1004129b setne    cl
1004129e test     cl, cl
100412a0 je       0x100412c0
100412a2 push     eax
100412a3 push     0x10193358
100412a8 push     edx
100412a9 call     0x100f6d05
100412ae mov      edx, dword ptr [0x10764584]
100412b4 add      esp, 0xc
100412b7 push     edx
100412b8 call     0x100f6c3d
100412bd add      esp, 4
100412c0 mov      eax, dword ptr [esp + 0x14]
100412c4 mov      edi, dword ptr [eax + 4]
100412c7 movsx    esi, word ptr [edi + 2]
100412cb mov      ecx, dword ptr [0x1072d9d4]
100412d1 movsx    eax, word ptr [edi + 4]
100412d5 add      ecx, esi
100412d7 cmp      ecx, 0x154a
100412dd lea      ebp, [eax + eax*2]
100412e0 jg       0x100412f2
100412e2 mov      edx, dword ptr [0x1072d9d0]
100412e8 add      edx, ebp
100412ea cmp      edx, 0x100000
100412f0 jle      0x100412f7
100412f2 call     0x1002df40
100412f7 test     byte ptr [0x1072d9d0], 1
100412fe je       0x10041305
10041300 call     0x1002df40
10041305 mov      eax, dword ptr [0x101ce708]
1004130a cmp      dword ptr [eax + 8], 2
1004130e mov      ebx, dword ptr [0x1072d9d4]
10041314 jne      0x10041335
10041316 mov      edx, dword ptr [esp + 0x14]
1004131a mov      eax, dword ptr [edx + 0xc]
1004131d lea      ecx, [esi + esi*8]
10041320 shl      ecx, 2
10041323 push     ecx
10041324 push     eax
10041325 movzx    eax, bx
10041328 lea      ecx, [eax + eax*8]
1004132b lea      edx, [ecx*4 + 0x106d3200]
10041332 push     edx
10041333 jmp      0x1004134f
10041335 mov      ecx, dword ptr [esp + 0x14]
10041339 mov      edx, dword ptr [ecx + 0xc]
1004133c mov      eax, esi
1004133e shl      eax, 6
10041341 push     eax
10041342 movzx    eax, bx
10041345 shl      eax, 6
10041348 push     edx
10041349 add      eax, 0x106d3200
1004134e push     eax
1004134f call     0x1005eaf0
10041354 mov      ecx, dword ptr [0x1072d9d4]
1004135a mov      edx, dword ptr [0x1072d9b0]
10041360 add      ecx, esi
10041362 add      esp, 0xc
10041365 mov      dword ptr [0x1072d9d4], ecx
1004136b mov      ecx, dword ptr [0x1072d9d0]
10041371 push     ebx
10041372 lea      eax, [edx + ecx*2]
10041375 push     eax
10041376 push     edi
10041377 call     0x1002ce40
1004137c mov      eax, dword ptr [0x1072d9d0]
10041381 add      esp, 0xc
10041384 pop      edi
10041385 pop      esi
10041386 add      eax, ebp
10041388 pop      ebp
10041389 mov      dword ptr [0x1072d9d0], eax
1004138e pop      ebx
1004138f ret      

100410b0 read_window=92 (inventory, not independently bounded)
100410b0 push     ecx
100410b1 mov      ecx, dword ptr [eax]
100410b3 add      ecx, -4
100410b6 cmp      ecx, 5
100410b9 ja       0x1004110a
100410bb jmp      dword ptr [ecx*4 + 0x1004110c]
100410c2 call     0x1003fb50
100410c7 pop      ecx
100410c8 ret      
100410c9 call     0x1003fba0
100410ce pop      ecx
100410cf ret      
100410d0 mov      ecx, eax
100410d2 call     0x10040c00
100410d7 pop      ecx
100410d8 ret      
100410d9 call     0x10041030
100410de pop      ecx
100410df ret      
100410e0 mov      ecx, dword ptr [0x101ce708]
100410e6 cmp      dword ptr [ecx + 8], 2
100410ea push     eax
100410eb jne      0x100410f7
100410ed call     0x100401a0
100410f2 add      esp, 4
100410f5 pop      ecx
100410f6 ret      
100410f7 call     0x1003fdb0
100410fc add      esp, 4
100410ff pop      ecx
10041100 ret      
10041101 push     eax
10041102 call     0x10040f30
10041107 add      esp, 4
1004110a pop      ecx
1004110b ret      

10041130 read_window=128 (inventory, not independently bounded)
10041130 mov      eax, dword ptr [0x1072de40]
10041135 jmp      0x100410b0
1004113a int3     
1004113b int3     
1004113c int3     
1004113d int3     
1004113e int3     
1004113f int3     
10041140 sub      esp, 0x18
10041143 push     ebx
10041144 push     esi
10041145 mov      esi, eax
10041147 mov      eax, dword ptr [0x1072d9d0]
1004114c xor      ebx, ebx
1004114e cmp      eax, ebx
10041150 push     edi
10041151 jne      0x1004115b
10041153 cmp      dword ptr [0x1072d9e0], ebx
10041159 je       0x10041160
1004115b call     0x1003a8d0
10041160 mov      eax, dword ptr [0x101ce7ec]
10041165 cmp      dword ptr [eax + 8], ebx
10041168 je       0x100411ba
1004116a mov      ecx, dword ptr [0x1072d9bc]
10041170 mov      edx, dword ptr [ecx]
10041172 push     edx
10041173 push     0x1019a42c
10041178 call     0x10060c70
1004117d mov      ecx, dword ptr [0x101ce7ec]
10041183 mov      edx, dword ptr [ecx + 8]
10041186 add      esp, 8
10041189 cmp      edx, ebx
1004118b je       0x100411ba
1004118d mov      edx, dword ptr [0x10764584]
10041193 cmp      edx, ebx
10041195 setne    cl
10041198 cmp      cl, bl
1004119a je       0x100411ba
1004119c push     eax
1004119d push     0x10193358
100411a2 push     edx
100411a3 call     0x100f6d05
100411a8 mov      edx, dword ptr [0x10764584]

1003ef20 read_window=128 (inventory, not independently bounded)
1003ef20 ret      
1003ef21 int3     
1003ef22 int3     
1003ef23 int3     
1003ef24 int3     
1003ef25 int3     
1003ef26 int3     
1003ef27 int3     
1003ef28 int3     
1003ef29 int3     
1003ef2a int3     
1003ef2b int3     
1003ef2c int3     
1003ef2d int3     
1003ef2e int3     
1003ef2f int3     
1003ef30 push     ebp
1003ef31 mov      ebp, esp
1003ef33 and      esp, 0xfffffff8
1003ef36 push     ecx
1003ef37 mov      eax, dword ptr [0x1072d9cc]
1003ef3c push     ebx
1003ef3d push     esi
1003ef3e mov      esi, 1
1003ef43 cmp      eax, esi
1003ef45 push     edi
1003ef46 je       0x1003ef65
1003ef48 mov      eax, dword ptr [0x1072d9d0]
1003ef4d test     eax, eax
1003ef4f jne      0x1003ef5a
1003ef51 mov      eax, dword ptr [0x1072d9e0]
1003ef56 test     eax, eax
1003ef58 je       0x1003ef5f
1003ef5a call     0x1003a8d0
1003ef5f mov      dword ptr [0x1072d9cc], esi
1003ef65 mov      ebx, dword ptr [ebp + 8]
1003ef68 movzx    eax, word ptr [ebx + 0xa]
1003ef6c mov      ecx, dword ptr [0x1072d9d4]
1003ef72 lea      edx, [eax + ecx]
1003ef75 cmp      edx, 0x154a
1003ef7b jg       0x1003ef93
1003ef7d mov      ecx, dword ptr [0x1072d9d0]
1003ef83 add      eax, -2
1003ef86 lea      edx, [ecx + eax*2]
1003ef89 add      edx, eax
1003ef8b cmp      edx, 0x100000
1003ef91 jle      0x1003ef98
1003ef93 call     0x1002df40
1003ef98 mov      eax, dword ptr [0x101ce708]
