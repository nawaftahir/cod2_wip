
10034010/184
10034010 push     ebp
10034011 mov      ebp, dword ptr [esp + 0xc]
10034015 push     esi
10034016 push     edi
10034017 mov      edi, dword ptr [esp + 0x1c]
1003401b mov      esi, eax
1003401d lea      eax, [edi + 2]
10034020 cmp      eax, ecx
10034022 jle      0x1003403e
10034024 mov      ecx, dword ptr [esp + 0x18]
10034028 push     ecx
10034029 mov      eax, edi
1003402b cdq      
1003402c push     esi
1003402d sub      eax, edx
1003402f sar      eax, 1
10034031 push     1
10034033 push     eax
10034034 call     0x10031780
10034039 add      esp, 0x10
1003403c xor      edi, edi
1003403e mov      edx, edi
10034040 shl      edx, 4
10034043 add      esi, edx
10034045 test     ebx, ebx
10034047 jne      0x10034052
10034049 mov      dword ptr [esi + 0xc], 0xffffffff
10034050 jmp      0x10034095
10034052 fld      dword ptr [ebx + 8]
10034055 fmul     dword ptr [0x1019bcac]
1003405b call     0x1010a8a8
10034060 mov      byte ptr [esi + 0xc], al
10034063 fld      dword ptr [ebx + 4]
10034066 fmul     dword ptr [0x1019bcac]
1003406c call     0x1010a8a8
10034071 mov      byte ptr [esi + 0xd], al
10034074 fld      dword ptr [ebx]
10034076 fmul     dword ptr [0x1019bcac]
1003407c call     0x1010a8a8
10034081 mov      byte ptr [esi + 0xe], al
10034084 fld      dword ptr [ebx + 0xc]
10034087 fmul     dword ptr [0x1019bcac]
1003408d call     0x1010a8a8
10034092 mov      byte ptr [esi + 0xf], al
10034095 mov      eax, dword ptr [esi + 0xc]
10034098 mov      dword ptr [esi + 0x1c], eax
1003409b mov      eax, dword ptr [esp + 0x10]
1003409f mov      ecx, dword ptr [eax]
100340a1 mov      dword ptr [esi], ecx
100340a3 mov      edx, dword ptr [eax + 4]
100340a6 mov      dword ptr [esi + 4], edx
100340a9 mov      eax, dword ptr [eax + 8]
100340ac mov      dword ptr [esi + 8], eax
100340af mov      ecx, dword ptr [ebp]
100340b2 mov      dword ptr [esi + 0x10], ecx
100340b5 mov      edx, dword ptr [ebp + 4]
100340b8 mov      dword ptr [esi + 0x14], edx
100340bb mov      eax, dword ptr [ebp + 8]
100340be mov      dword ptr [esi + 0x18], eax
100340c1 lea      eax, [edi + 2]
100340c4 pop      edi
100340c5 pop      esi
100340c6 pop      ebp
100340c7 ret      

100340f0/211
100340f0 mov      edx, dword ptr [0x101ce708]
100340f6 push     esi
100340f7 cmp      dword ptr [edx + 8], 2
100340fb mov      edx, dword ptr [ecx]
100340fd jne      0x1003414d
100340ff lea      eax, [eax + eax*8]
10034102 shl      eax, 2
10034105 mov      dword ptr [eax + 0x106d3200], edx
1003410b mov      edx, dword ptr [ecx + 4]
1003410e mov      dword ptr [eax + 0x106d3204], edx
10034114 mov      ecx, dword ptr [ecx + 8]
10034117 mov      edx, dword ptr [esp + 8]
1003411b mov      dword ptr [eax + 0x106d3208], ecx
10034121 xor      ecx, ecx
10034123 mov      dword ptr [eax + 0x106d320c], ecx
10034129 mov      dword ptr [eax + 0x106d3210], ecx
1003412f mov      dword ptr [eax + 0x106d3214], 0x3f800000
10034139 mov      dword ptr [eax + 0x106d3218], edx
1003413f mov      dword ptr [eax + 0x106d321c], ecx
10034145 mov      dword ptr [eax + 0x106d3220], ecx
1003414b pop      esi
1003414c ret      
1003414d mov      esi, dword ptr [esp + 8]
10034151 shl      eax, 6
10034154 mov      dword ptr [eax + 0x106d3200], edx
1003415a mov      edx, dword ptr [ecx + 4]
1003415d mov      dword ptr [eax + 0x106d3204], edx
10034163 mov      ecx, dword ptr [ecx + 8]
10034166 mov      dword ptr [eax + 0x106d3208], ecx
1003416c xor      ecx, ecx
1003416e mov      edx, 0x3f800000
10034173 mov      dword ptr [eax + 0x106d320c], edx
10034179 mov      dword ptr [eax + 0x106d3210], ecx
1003417f mov      dword ptr [eax + 0x106d3214], ecx
10034185 mov      dword ptr [eax + 0x106d3218], edx
1003418b mov      dword ptr [eax + 0x106d321c], esi
10034191 mov      dword ptr [eax + 0x106d3228], ecx
10034197 mov      dword ptr [eax + 0x106d322c], edx
1003419d mov      dword ptr [eax + 0x106d3230], ecx
100341a3 mov      dword ptr [eax + 0x106d3234], edx
100341a9 mov      dword ptr [eax + 0x106d3238], ecx
100341af mov      dword ptr [eax + 0x106d323c], ecx
100341b5 mov      dword ptr [eax + 0x106d3220], ecx
100341bb mov      dword ptr [eax + 0x106d3224], ecx
100341c1 pop      esi
100341c2 ret      

100341d0/510
100341d0 sub      esp, 0x14
100341d3 push     ebx
100341d4 push     ebp
100341d5 push     esi
100341d6 push     edi
100341d7 mov      edi, dword ptr [0x101d1b38]
100341dd xor      ebx, ebx
100341df push     ebx
100341e0 mov      esi, 3
100341e5 call     0x1003a5f0
100341ea mov      ecx, dword ptr [0x106d3194]
100341f0 mov      eax, dword ptr [ecx + 0x249d28]
100341f6 add      esp, 4
100341f9 cmp      eax, ebx
100341fb mov      dword ptr [esp + 0x1c], ebx
100341ff jle      0x100343c2
10034205 mov      dword ptr [esp + 0x18], ebx
10034209 lea      esp, [esp]
10034210 mov      ebx, dword ptr [ecx + 0x249d24]
10034216 mov      edx, dword ptr [esp + 0x18]
1003421a mov      eax, dword ptr [ebx + edx + 0x10]
1003421e fld      dword ptr [ebx + edx + 8]
10034222 mov      ecx, dword ptr [ecx + 0x249d18]
10034228 fmul     dword ptr [0x1019bcac]
1003422e add      ebx, edx
10034230 lea      eax, [eax + eax*2]
10034233 lea      edx, [ecx + eax*4]
10034236 mov      dword ptr [esp + 0x20], edx
1003423a call     0x1010a8a8
1003423f fld      dword ptr [ebx + 4]
10034242 fmul     dword ptr [0x1019bcac]
10034248 mov      byte ptr [esp + 0x14], al
1003424c call     0x1010a8a8
10034251 fld      dword ptr [ebx]
10034253 fmul     dword ptr [0x1019bcac]
10034259 mov      byte ptr [esp + 0x15], al
1003425d call     0x1010a8a8
10034262 fld      dword ptr [ebx + 0xc]
10034265 fmul     dword ptr [0x1019bcac]
1003426b mov      byte ptr [esp + 0x16], al
1003426f call     0x1010a8a8
10034274 mov      ecx, dword ptr [0x1072d9d4]
1003427a mov      byte ptr [esp + 0x17], al
1003427e mov      eax, dword ptr [ebx + 0x14]
10034281 lea      edx, [eax + ecx]
10034284 cmp      edx, 0x154a
1003428a jg       0x100342a2
1003428c mov      ecx, dword ptr [0x1072d9d0]
10034292 add      eax, -2
10034295 lea      edx, [ecx + eax*2]
10034298 add      edx, eax
1003429a cmp      edx, 0x100000
100342a0 jle      0x100342ed
100342a2 mov      ebp, dword ptr [0x1072d9cc]
100342a8 call     0x1003a8d0
100342ad mov      eax, dword ptr [0x1072d9c4]
100342b2 mov      esi, dword ptr [0x1072d9c0]
100342b8 mov      edi, dword ptr [0x1072d9bc]
100342be push     eax
100342bf call     0x1003a5f0
100342c4 mov      eax, dword ptr [0x1072d9cc]
100342c9 add      esp, 4
100342cc cmp      eax, ebp
100342ce je       0x100342ed
100342d0 mov      eax, dword ptr [0x1072d9d0]
100342d5 test     eax, eax
100342d7 jne      0x100342e2
100342d9 mov      eax, dword ptr [0x1072d9e0]
100342de test     eax, eax
100342e0 je       0x100342e7
100342e2 call     0x1003a8d0
100342e7 mov      dword ptr [0x1072d9cc], ebp
100342ed mov      eax, dword ptr [ebx + 0x14]
100342f0 xor      esi, esi
100342f2 test     eax, eax
100342f4 jle      0x1003431f
100342f6 mov      edi, dword ptr [esp + 0x20]
100342fa mov      ebp, dword ptr [esp + 0x14]
100342fe mov      edi, edi
10034300 mov      ecx, dword ptr [0x1072d9d4]
10034306 lea      eax, [ecx + esi]
10034309 push     ebp
1003430a mov      ecx, edi
1003430c call     0x100340f0
10034311 mov      eax, dword ptr [ebx + 0x14]
10034314 add      esp, 4
10034317 inc      esi
10034318 add      edi, 0xc
1003431b cmp      esi, eax
1003431d jl       0x10034300
1003431f mov      ecx, dword ptr [ebx + 0x14]
10034322 mov      eax, 2
10034327 cmp      ecx, eax
10034329 jle      0x10034389
1003432b mov      ecx, 3
10034330 mov      edi, dword ptr [0x1072d9d0]
10034336 mov      edx, dword ptr [0x1072d9b0]
1003433c mov      si, word ptr [0x1072d9d4]
10034343 mov      word ptr [edx + edi*2], si
10034347 mov      edx, dword ptr [0x1072d9d4]
1003434d mov      edi, dword ptr [0x1072d9d0]
10034353 mov      esi, dword ptr [0x1072d9b0]
10034359 add      edx, eax
1003435b mov      word ptr [esi + edi*2 + 2], dx
10034360 mov      edx, dword ptr [0x1072d9d4]
10034366 mov      esi, dword ptr [0x1072d9d0]
1003436c mov      edi, dword ptr [0x1072d9b0]
10034372 lea      edx, [eax + edx - 1]
10034376 mov      word ptr [edi + esi*2 + 4], dx
1003437b add      dword ptr [0x1072d9d0], ecx
10034381 mov      edx, dword ptr [ebx + 0x14]
10034384 inc      eax
10034385 cmp      eax, edx
10034387 jl       0x10034330
10034389 mov      eax, dword ptr [ebx + 0x14]
1003438c mov      ebx, dword ptr [0x1072d9d4]
10034392 mov      esi, dword ptr [esp + 0x18]
10034396 mov      ecx, dword ptr [0x106d3194]
1003439c add      ebx, eax
1003439e mov      eax, dword ptr [esp + 0x1c]
100343a2 mov      dword ptr [0x1072d9d4], ebx
100343a8 mov      edx, dword ptr [ecx + 0x249d28]
100343ae inc      eax
100343af add      esi, 0x18
100343b2 cmp      eax, edx
100343b4 mov      dword ptr [esp + 0x1c], eax
100343b8 mov      dword ptr [esp + 0x18], esi
100343bc jl       0x10034210
100343c2 pop      edi
100343c3 pop      esi
100343c4 pop      ebp
100343c5 pop      ebx
100343c6 add      esp, 0x14
100343c9 jmp      0x1003a8d0

100343d0/233
100343d0 sub      esp, 0xc
100343d3 push     ebx
100343d4 push     ebp
100343d5 push     esi
100343d6 push     edi
100343d7 push     0xaa50
100343dc call     dword ptr [0x101d49dc]
100343e2 mov      edx, dword ptr [0x106d3194]
100343e8 mov      ecx, dword ptr [edx + 0x249d28]
100343ee mov      esi, eax
100343f0 xor      eax, eax
100343f2 add      esp, 4
100343f5 cmp      ecx, eax
100343f7 mov      dword ptr [esp + 0x18], esi
100343fb mov      dword ptr [esp + 0x14], eax
100343ff jle      0x10034490
10034405 mov      dword ptr [esp + 0x10], eax
10034409 lea      esp, [esp]
10034410 mov      edi, dword ptr [esp + 0x10]
10034414 mov      ebx, dword ptr [edx + 0x249d24]
1003441a mov      ecx, dword ptr [ebx + edi + 0x10]
1003441e mov      esi, dword ptr [edx + 0x249d18]
10034424 add      ebx, edi
10034426 lea      ecx, [ecx + ecx*2]
10034429 lea      ebp, [esi + ecx*4]
1003442c mov      ecx, dword ptr [ebx + 0x14]
1003442f xor      edi, edi
10034431 test     ecx, ecx
10034433 jle      0x1003446e
10034435 lea      ecx, [ecx + ecx*2 - 3]
10034439 shl      ecx, 2
1003443c xor      esi, esi
1003443e mov      edi, edi
10034440 push     eax
10034441 mov      eax, dword ptr [esp + 0x1c]
10034445 push     0
10034447 lea      edx, [esi + ebp]
1003444a add      ecx, ebp
1003444c push     edx
1003444d push     ecx
1003444e mov      ecx, 0xaa5
10034453 call     0x10034010
10034458 mov      edx, dword ptr [ebx + 0x14]
1003445b add      esp, 0x10
1003445e mov      ecx, esi
10034460 inc      edi
10034461 add      esi, 0xc
10034464 cmp      edi, edx
10034466 jl       0x10034440
10034468 mov      edx, dword ptr [0x106d3194]
1003446e mov      ecx, dword ptr [esp + 0x14]
10034472 mov      edi, dword ptr [esp + 0x10]
10034476 mov      esi, dword ptr [edx + 0x249d28]
1003447c inc      ecx
1003447d add      edi, 0x18
10034480 cmp      ecx, esi
10034482 mov      dword ptr [esp + 0x14], ecx
10034486 mov      dword ptr [esp + 0x10], edi
1003448a jl       0x10034410
1003448c mov      esi, dword ptr [esp + 0x18]
10034490 cdq      
10034491 sub      eax, edx
10034493 sar      eax, 1
10034495 test     eax, eax
10034497 je       0x100344a7
10034499 push     0
1003449b push     esi
1003449c push     1
1003449e push     eax
1003449f call     0x10031780
100344a4 add      esp, 0x10
100344a7 push     esi
100344a8 call     dword ptr [0x101d49e0]
100344ae add      esp, 4
100344b1 pop      edi
100344b2 pop      esi
100344b3 pop      ebp
100344b4 pop      ebx
100344b5 add      esp, 0xc
100344b8 ret      

10034500/215
10034500 sub      esp, 0xc
10034503 push     ebx
10034504 push     ebp
10034505 push     esi
10034506 push     edi
10034507 mov      edi, eax
10034509 test     edi, edi
1003450b mov      esi, ecx
1003450d je       0x100345cf
10034513 mov      al, byte ptr [0x1072debd]
10034518 test     al, al
1003451a je       0x10034521
1003451c call     0x1002e380
10034521 push     0xaa50
10034526 call     dword ptr [0x101d49dc]
1003452c mov      edx, dword ptr [esi + 0x28]
1003452f add      esp, 4
10034532 test     edx, edx
10034534 setne    byte ptr [esp + 0x14]
10034539 mov      ebp, eax
1003453b xor      eax, eax
1003453d test     edi, edi
1003453f jle      0x100345ab
10034541 mov      dword ptr [esp + 0x18], edi
10034545 mov      edi, dword ptr [esp + 0x14]
10034549 add      esi, 0x18
1003454c lea      esp, [esp]
10034550 mov      edx, dword ptr [esi + 0x10]
10034553 mov      cl, byte ptr [esp + 0x14]
10034557 test     edx, edx
10034559 setne    bl
1003455c cmp      cl, bl
1003455e je       0x10034580
10034560 cdq      
10034561 sub      eax, edx
10034563 sar      eax, 1
10034565 test     eax, eax
10034567 je       0x10034576
10034569 push     edi
1003456a push     ebp
1003456b push     1
1003456d push     eax
1003456e call     0x10031780
10034573 add      esp, 0x10
10034576 mov      byte ptr [esp + 0x14], bl
1003457a mov      edi, dword ptr [esp + 0x14]
1003457e xor      eax, eax
10034580 push     eax
10034581 push     edi
10034582 lea      eax, [esi - 0xc]
10034585 push     eax
10034586 lea      ecx, [esi - 0x18]
10034589 push     ecx
1003458a mov      eax, ebp
1003458c mov      ecx, 0xaa5
10034591 mov      ebx, esi
10034593 call     0x10034010
10034598 mov      ecx, dword ptr [esp + 0x28]
1003459c add      esp, 0x10
1003459f add      esi, 0x2c
100345a2 dec      ecx
100345a3 mov      dword ptr [esp + 0x18], ecx
100345a7 jne      0x10034550
100345a9 jmp      0x100345af
100345ab mov      edi, dword ptr [esp + 0x14]
100345af cdq      
100345b0 sub      eax, edx
100345b2 sar      eax, 1
100345b4 test     eax, eax
100345b6 je       0x100345c5
100345b8 push     edi
100345b9 push     ebp
100345ba push     1
100345bc push     eax
100345bd call     0x10031780
100345c2 add      esp, 0x10
100345c5 push     ebp
100345c6 call     dword ptr [0x101d49e0]
100345cc add      esp, 4
100345cf pop      edi
100345d0 pop      esi
100345d1 pop      ebp
100345d2 pop      ebx
100345d3 add      esp, 0xc
100345d6 ret      

100345e0/277
100345e0 sub      esp, 0x1c
100345e3 push     ebx
100345e4 push     esi
100345e5 mov      esi, eax
100345e7 test     esi, esi
100345e9 push     edi
100345ea je       0x100346ee
100345f0 mov      al, byte ptr [0x1072debd]
100345f5 test     al, al
100345f7 je       0x100345fe
100345f9 call     0x1002e380
100345fe test     esi, esi
10034600 jle      0x100346d7
10034606 mov      edi, dword ptr [esp + 0x2c]
1003460a add      edi, 0x10
1003460d mov      ebx, esi
1003460f nop      
10034610 lea      eax, [edi - 4]
10034613 test     eax, eax
10034615 jne      0x10034621
10034617 mov      dword ptr [esp + 0xc], 0xffffffff
1003461f jmp      0x10034668
10034621 fld      dword ptr [edi + 4]
10034624 fmul     dword ptr [0x1019bcac]
1003462a call     0x1010a8a8
1003462f fld      dword ptr [edi]
10034631 fmul     dword ptr [0x1019bcac]
10034637 mov      byte ptr [esp + 0xc], al
1003463b call     0x1010a8a8
10034640 fld      dword ptr [edi - 4]
10034643 fmul     dword ptr [0x1019bcac]
10034649 mov      byte ptr [esp + 0xd], al
1003464d call     0x1010a8a8
10034652 fld      dword ptr [edi + 8]
10034655 fmul     dword ptr [0x1019bcac]
1003465b mov      byte ptr [esp + 0xe], al
1003465f call     0x1010a8a8
10034664 mov      byte ptr [esp + 0xf], al
10034668 fld      dword ptr [edi + 0xc]
1003466b mov      eax, dword ptr [0x1072ddc8]
10034670 fchs     
10034672 mov      ecx, dword ptr [esp + 0xc]
10034676 fld      st(0)
10034678 push     ecx
10034679 fld      st(0)
1003467b mov      ecx, dword ptr [0x10764558]
10034681 fmul     dword ptr [eax + 0x18]
10034684 lea      edx, [esp + 0x14]
10034688 push     edx
10034689 push     ecx
1003468a fstp     dword ptr [esp + 0x28]
1003468e lea      edx, [edi + 0x10]
10034691 push     edx
10034692 fld      st(0)
10034694 lea      esi, [esp + 0x2c]
10034698 fmul     dword ptr [eax + 0x1c]
1003469b fstp     dword ptr [esp + 0x30]
1003469f fmul     dword ptr [eax + 0x20]
100346a2 fstp     dword ptr [esp + 0x34]
100346a6 fld      st(0)
100346a8 fmul     dword ptr [eax + 0x24]
100346ab fstp     dword ptr [esp + 0x20]
100346af fld      st(0)
100346b1 fmul     dword ptr [eax + 0x28]
100346b4 fstp     dword ptr [esp + 0x24]
100346b8 fmul     dword ptr [eax + 0x2c]
100346bb lea      eax, [edi - 0x10]
100346be fstp     dword ptr [esp + 0x28]
100346c2 call     0x10032a50
100346c7 add      esp, 0x10
100346ca add      edi, 0x80
100346d0 dec      ebx
100346d1 jne      0x10034610
100346d7 mov      eax, dword ptr [0x1072d9d0]
100346dc test     eax, eax
100346de jne      0x100346e9
100346e0 mov      eax, dword ptr [0x1072d9e0]
100346e5 test     eax, eax
100346e7 je       0x100346ee
100346e9 call     0x1003a8d0
100346ee pop      edi
100346ef pop      esi
100346f0 pop      ebx
100346f1 add      esp, 0x1c
100346f4 ret      

10034700/297
10034700 sub      esp, 0x14
10034703 mov      eax, dword ptr [0x106d3194]
10034708 mov      ecx, dword ptr [eax + 0x249d64]
1003470e push     ebp
1003470f mov      ebp, dword ptr [esp + 0x1c]
10034713 push     esi
10034714 xor      esi, esi
10034716 cmp      ecx, esi
10034718 mov      dword ptr [esp + 8], esi
1003471c jle      0x1003482d
10034722 push     ebx
10034723 push     edi
10034724 jmp      0x10034730
10034726 lea      esp, [esp]
1003472d lea      ecx, [ecx]
10034730 mov      ecx, dword ptr [eax + 0x249d60]
10034736 mov      edi, dword ptr [esi + ecx + 0x20]
1003473a lea      edx, [esi + ecx]
1003473d mov      ecx, dword ptr [0x1072ddb8]
10034743 sub      ecx, edi
10034745 mov      dword ptr [esp + 0x14], ecx
10034749 js       0x10034811
1003474f cmp      ecx, dword ptr [edx + 0x24]
10034752 jg       0x10034811
10034758 mov      edx, dword ptr [eax + 0x249d60]
1003475e mov      dword ptr [esi + edx + 0x18], 0x3f800000
10034766 mov      edx, dword ptr [eax + 0x249d60]
1003476c mov      edi, dword ptr [esi + edx + 0x24]
10034770 add      ecx, ecx
10034772 cmp      ecx, edi
10034774 jle      0x1003478b
10034776 fild     dword ptr [esp + 0x14]
1003477a lea      ecx, [esi + edx]
1003477d fadd     st(0), st(0)
1003477f fidiv    dword ptr [ecx + 0x24]
10034782 fsubr    dword ptr [0x1019bcb4]
10034788 fstp     dword ptr [ecx + 0x18]
1003478b fild     dword ptr [esp + 0x14]
1003478f mov      eax, dword ptr [eax + 0x249d60]
10034795 fld      dword ptr [0x1019bdf8]
1003479b add      eax, esi
1003479d mov      ecx, dword ptr [eax + 0x1c]
100347a0 fmul     st(1)
100347a2 push     ecx
100347a3 push     0x10196ccc
100347a8 fiadd    dword ptr [esp + 0x18]
100347ac fsin     
100347ae fmul     dword ptr [0x1019bdf4]
100347b4 fld      st(0)
100347b6 fmul     dword ptr [ebp + 0x18]
100347b9 fadd     dword ptr [eax]
100347bb fstp     dword ptr [esp + 0x20]
100347bf fld      st(0)
100347c1 fmul     dword ptr [ebp + 0x1c]
100347c4 fadd     dword ptr [eax + 4]
100347c7 fstp     dword ptr [esp + 0x24]
100347cb fmul     dword ptr [ebp + 0x20]
100347ce fadd     dword ptr [eax + 8]
100347d1 fxch     st(1)
100347d3 fmul     dword ptr [0x1019bdf0]
100347d9 faddp    st(1)
100347db fstp     dword ptr [esp + 0x28]
100347df call     0x10060c70
100347e4 push     eax
100347e5 mov      eax, dword ptr [0x106d3194]
100347ea mov      edx, dword ptr [eax + 0x249d60]
100347f0 lea      ecx, [esp + 0x24]
100347f4 push     0x3f000000
100347f9 lea      ebx, [edx + esi + 0xc]
100347fd push     ecx
100347fe lea      edi, [eax + 0x249d18]
10034804 call     0x10005680
10034809 mov      eax, dword ptr [0x106d3194]
1003480e add      esp, 0x14
10034811 mov      ecx, dword ptr [esp + 0x10]
10034815 mov      edx, dword ptr [eax + 0x249d64]
1003481b inc      ecx
1003481c add      esi, 0x28
1003481f cmp      ecx, edx
10034821 mov      dword ptr [esp + 0x10], ecx

10034840/170
10034840 push     ecx
10034841 push     eax
10034842 call     0x10034700
10034847 mov      ecx, dword ptr [0x106d3194]
1003484d mov      eax, dword ptr [ecx + 0x249d28]
10034853 add      esp, 4
10034856 test     eax, eax
10034858 je       0x10034882
1003485a mov      al, byte ptr [0x1072debd]
1003485f test     al, al
10034861 je       0x10034868
10034863 call     0x1002e380
10034868 call     0x100341d0
1003486d call     0x100343d0
10034872 mov      ecx, dword ptr [0x106d3194]
10034878 mov      dword ptr [ecx + 0x249d28], 0
10034882 mov      eax, dword ptr [ecx + 0x249d4c]
10034888 mov      ecx, dword ptr [ecx + 0x249d48]
1003488e call     0x10034500
10034893 mov      ecx, dword ptr [0x106d3194]
10034899 mov      eax, dword ptr [ecx + 0x249d58]
1003489f mov      ecx, dword ptr [ecx + 0x249d54]
100348a5 call     0x10034500
100348aa mov      eax, dword ptr [0x106d3194]
100348af mov      ecx, dword ptr [eax + 0x249d30]
100348b5 mov      dword ptr [eax + 0x249d4c], 0
100348bf mov      eax, dword ptr [eax + 0x249d34]
100348c5 push     ecx
100348c6 call     0x100345e0
100348cb mov      eax, dword ptr [0x106d3194]
100348d0 mov      edx, dword ptr [eax + 0x249d3c]
100348d6 mov      eax, dword ptr [eax + 0x249d40]
100348dc add      esp, 4
100348df push     edx
100348e0 call     0x100345e0
100348e5 add      esp, 4
100348e8 pop      ecx
100348e9 ret      
