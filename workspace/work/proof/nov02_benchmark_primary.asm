
10032d80/160
10032d80 mov      eax, dword ptr [0x101d4810]
10032d85 sub      esp, 8
10032d88 cmp      eax, 3
10032d8b je       0x10032d95
10032d8d add      esp, 8
10032d90 jmp      0x10032cd0
10032d95 push     ebp
10032d96 push     esi
10032d97 push     edi
10032d98 xor      edi, edi
10032d9a mov      dword ptr [esp + 0x10], edi
10032d9e rdtsc    
10032da0 mov      ecx, eax
10032da2 mov      eax, dword ptr [0x101d4954]
10032da7 mov      esi, edx
10032da9 cdq      
10032daa sub      ecx, eax
10032dac sbb      esi, edx
10032dae mov      ebp, ecx
10032db0 mov      dword ptr [0x101d4954], edi
10032db6 mov      al, byte ptr [0x101d4958]
10032dbb test     al, al
10032dbd je       0x10032e00
10032dbf mov      eax, dword ptr [0x101d494c]
10032dc4 mov      ecx, dword ptr [eax]
10032dc6 push     1
10032dc8 push     0
10032dca push     0
10032dcc push     eax
10032dcd call     dword ptr [ecx + 0x1c]
10032dd0 cmp      eax, 0x88760868
10032dd5 je       0x10032df9
10032dd7 cmp      eax, 1
10032dda setne    al
10032ddd test     al, al
10032ddf jne      0x10032df9
10032de1 rdtsc    
10032de3 sub      eax, ebp
10032de5 sbb      edx, esi
10032de7 test     edx, edx
10032de9 mov      edi, eax
10032deb jg       0x10032e19
10032ded jl       0x10032db6
10032def cmp      edi, 0x7fffffff
10032df5 ja       0x10032e19
10032df7 jmp      0x10032db6
10032df9 mov      byte ptr [0x101d4958], 0
10032e00 mov      ecx, dword ptr [0x101d4950]
10032e06 mov      eax, ecx
10032e08 sub      eax, edi
10032e0a cdq      
10032e0b sub      eax, edx
10032e0d sar      eax, 1
10032e0f neg      eax
10032e11 add      ecx, eax
10032e13 mov      dword ptr [0x101d4950], ecx
10032e19 pop      edi
10032e1a pop      esi
10032e1b pop      ebp
10032e1c add      esp, 8
10032e1f ret      

10032e20/76
10032e20 mov      al, byte ptr [0x101d4958]
10032e25 test     al, al
10032e27 je       0x10032e52
10032e29 mov      eax, dword ptr [0x101d494c]
10032e2e mov      ecx, dword ptr [eax]
10032e30 push     1
10032e32 push     0
10032e34 push     0
10032e36 push     eax
10032e37 call     dword ptr [ecx + 0x1c]
10032e3a cmp      eax, 0x88760868
10032e3f je       0x10032e4b
10032e41 cmp      eax, 1
10032e44 setne    al
10032e47 test     al, al
10032e49 je       0x10032e6b
10032e4b mov      byte ptr [0x101d4958], 0
10032e52 mov      eax, dword ptr [0x101d4950]
10032e57 add      eax, 0xffffb1e0
10032e5c mov      edx, eax
10032e5e sar      edx, 0x1f
10032e61 not      edx
10032e63 and      edx, eax
10032e65 mov      dword ptr [0x101d4950], edx
10032e6b ret      

10032e80/177
10032e80 mov      al, byte ptr [0x101d4958]
10032e85 sub      esp, 8
10032e88 test     al, al
10032e8a je       0x10032f2d
10032e90 mov      eax, dword ptr [0x101d494c]
10032e95 mov      ecx, dword ptr [eax]
10032e97 push     1
10032e99 push     0
10032e9b push     0
10032e9d push     eax
10032e9e call     dword ptr [ecx + 0x1c]
10032ea1 cmp      eax, 0x88760868
10032ea6 je       0x10032eb2
10032ea8 cmp      eax, 1
10032eab setne    al
10032eae test     al, al
10032eb0 je       0x10032ebd
10032eb2 mov      byte ptr [0x101d4958], 0
10032eb9 add      esp, 8
10032ebc ret      
10032ebd push     esi
10032ebe rdtsc    
10032ec0 mov      dword ptr [esp + 8], edx
10032ec4 mov      esi, eax
10032ec6 mov      al, byte ptr [0x101d4958]
10032ecb test     al, al
10032ecd je       0x10032f0a
10032ecf mov      eax, dword ptr [0x101d494c]
10032ed4 mov      edx, dword ptr [eax]
10032ed6 push     1
10032ed8 push     0
10032eda push     0
10032edc push     eax
10032edd call     dword ptr [edx + 0x1c]
10032ee0 cmp      eax, 0x88760868
10032ee5 je       0x10032f03
10032ee7 cmp      eax, 1
10032eea setne    al
10032eed test     al, al
10032eef jne      0x10032f03
10032ef1 rdtsc    
10032ef3 mov      ecx, dword ptr [0x101d4950]
10032ef9 sub      eax, esi
10032efb cmp      eax, ecx
10032efd mov      dword ptr [esp + 8], edx
10032f01 jle      0x10032ec6
10032f03 mov      byte ptr [0x101d4958], 0
10032f0a rdtsc    
10032f0c mov      ecx, dword ptr [0x101d4950]
10032f12 sub      eax, esi
10032f14 lea      eax, [eax + eax*2]
10032f17 mov      dword ptr [esp + 8], edx
10032f1b cdq      
10032f1c and      edx, 3
10032f1f add      eax, edx
10032f21 sar      eax, 2
10032f24 add      ecx, eax
10032f26 mov      dword ptr [0x101d4950], ecx
10032f2c pop      esi
10032f2d add      esp, 8
10032f30 ret      

10032f40/59
10032f40 mov      al, byte ptr [0x101d4958]
10032f45 test     al, al
10032f47 je       0x10032f75
10032f49 mov      eax, dword ptr [0x101d494c]
10032f4e mov      ecx, dword ptr [eax]
10032f50 push     1
10032f52 push     0
10032f54 push     0
10032f56 push     eax
10032f57 call     dword ptr [ecx + 0x1c]
10032f5a cmp      eax, 0x88760868
10032f5f je       0x10032f6e
10032f61 cmp      eax, 1
10032f64 setne    al
10032f67 test     al, al
10032f69 jne      0x10032f6e
10032f6b xor      eax, eax
10032f6d ret      
10032f6e mov      byte ptr [0x101d4958], 0
10032f75 mov      eax, 1
10032f7a ret      

10032f90/115
10032f90 call     0x10032cd0
10032f95 call     0x10032d10
10032f9a call     0x10032cd0
10032f9f mov      eax, dword ptr [esp + 4]
10032fa3 push     eax
10032fa4 call     dword ptr [0x1010c028]
10032faa mov      byte ptr [0x101d492d], 1
10032fb1 mov      ecx, dword ptr [0x101ce7ec]
10032fb7 mov      eax, dword ptr [ecx + 8]
10032fba test     eax, eax
10032fbc je       0x10032feb
10032fbe mov      eax, dword ptr [0x10764584]
10032fc3 test     eax, eax
10032fc5 setne    cl
10032fc8 test     cl, cl
10032fca je       0x10032feb
10032fcc push     0x10197ed8
10032fd1 push     0x10193358
10032fd6 push     eax
10032fd7 call     0x100f6d05
10032fdc mov      edx, dword ptr [0x10764584]
10032fe2 push     edx
10032fe3 call     0x100f6c3d
10032fe8 add      esp, 0x10
10032feb mov      eax, dword ptr [0x101d1bf8]
10032ff0 mov      ecx, dword ptr [eax]
10032ff2 push     eax
10032ff3 call     dword ptr [ecx + 0xa4]
10032ff9 mov      eax, dword ptr [0x1076a830]
10032ffe test     eax, eax
10033000 jne      0x10032fb1
10033002 ret      

10033010/114
10033010 mov      eax, dword ptr [0x101ce7ec]
10033015 mov      ecx, dword ptr [eax + 8]
10033018 test     ecx, ecx
1003301a je       0x10033049
1003301c mov      eax, dword ptr [0x10764584]
10033021 test     eax, eax
10033023 setne    cl
10033026 test     cl, cl
10033028 je       0x10033049
1003302a push     0x10197ec0
1003302f push     0x10193358
10033034 push     eax
10033035 call     0x100f6d05
1003303a mov      ecx, dword ptr [0x10764584]
10033040 push     ecx
10033041 call     0x100f6c3d
10033046 add      esp, 0x10
10033049 mov      eax, dword ptr [0x101d1bf8]
1003304e mov      edx, dword ptr [eax]
10033050 push     eax
10033051 call     dword ptr [edx + 0xa8]
10033057 mov      eax, dword ptr [0x1076a830]
1003305c test     eax, eax
1003305e jne      0x10033010
10033060 mov      byte ptr [0x101d492d], 0
10033067 call     0x10032cd0
1003306c call     0x10032d10
10033071 call     0x10032cd0
10033076 mov      eax, dword ptr [esp + 4]
1003307a push     eax
1003307b call     dword ptr [0x1010c028]
10033081 ret      

10033090/48
10033090 sub      esp, 0x10
10033093 lea      eax, [esp + 8]
10033097 push     eax
10033098 call     dword ptr [0x1010c02c]
1003309e mov      edx, dword ptr [edi]
100330a0 mov      ecx, dword ptr [esi]
100330a2 mov      eax, dword ptr [edi + 4]
100330a5 sub      ecx, edx
100330a7 mov      edx, dword ptr [esi + 4]
100330aa sbb      edx, eax
100330ac mov      dword ptr [esp], ecx
100330af mov      dword ptr [esp + 4], edx
100330b3 fild     qword ptr [esp]
100330b6 fild     qword ptr [esp + 8]
100330ba fdivp    st(1)
100330bc add      esp, 0x10
100330bf ret      

100330c0/201
100330c0 sub      esp, 0x18
100330c3 push     ebx
100330c4 push     ebp
100330c5 push     esi
100330c6 mov      esi, eax
100330c8 mov      eax, dword ptr [0x101d1b2c]
100330cd mov      ecx, dword ptr [esi + 0x3c]
100330d0 cmp      ecx, dword ptr [eax + 0x3c]
100330d3 push     edi
100330d4 mov      edi, dword ptr [esp + 0x34]
100330d8 jne      0x100330f8
100330da mov      edx, dword ptr [esi + 0x40]
100330dd cmp      edx, dword ptr [eax + 0x40]
100330e0 jne      0x100330f8
100330e2 mov      ecx, dword ptr [esi + 0x38]
100330e5 cmp      ecx, dword ptr [eax + 0x38]
100330e8 jne      0x100330f8
100330ea fld      dword ptr [0x1019bc84]
100330f0 pop      edi
100330f1 pop      esi
100330f2 pop      ebp
100330f3 pop      ebx
100330f4 add      esp, 0x18
100330f7 ret      
100330f8 lea      edx, [esp + 0x18]
100330fc push     edx
100330fd call     0x10032f90
10033102 add      esp, 4
10033105 test     edi, edi
10033107 jle      0x10033138
10033109 mov      ebp, dword ptr [esp + 0x30]
1003310d lea      ecx, [ecx]
10033110 mov      eax, dword ptr [esp + 0x2c]
10033114 push     0x3f800000
10033119 push     0x3f800000
1003311e push     0
10033120 push     0
10033122 push     ebp
10033123 push     eax
10033124 push     0
10033126 push     0
10033128 or       ebx, 0xffffffff
1003312b mov      eax, esi
1003312d call     0x1002e850
10033132 add      esp, 0x20
10033135 dec      edi
10033136 jne      0x10033110
10033138 call     0x1003a8d0
1003313d lea      ecx, [esp + 0x10]
10033141 push     ecx
10033142 call     0x10033010
10033147 add      esp, 4
1003314a lea      edx, [esp + 0x20]
1003314e push     edx
1003314f call     dword ptr [0x1010c02c]
10033155 fild     dword ptr [esp + 0x34]
10033159 mov      esi, dword ptr [esp + 0x18]
1003315d mov      eax, dword ptr [esp + 0x10]
10033161 mov      edx, dword ptr [esp + 0x1c]
10033165 mov      ecx, dword ptr [esp + 0x14]
10033169 sub      eax, esi
1003316b sbb      ecx, edx
1003316d mov      dword ptr [esp + 0x18], eax
10033171 mov      dword ptr [esp + 0x1c], ecx
10033175 fild     qword ptr [esp + 0x18]
10033179 fild     qword ptr [esp + 0x20]
1003317d pop      edi
1003317e pop      esi
1003317f pop      ebp
10033180 fdivp    st(1)
10033182 pop      ebx
10033183 fdivp    st(1)
10033185 add      esp, 0x18
10033188 ret      

100331d0/1009
100331d0 sub      esp, 0xbc
100331d6 push     ebx
100331d7 xor      ebx, ebx
100331d9 push     ebp
100331da mov      ebp, 0x3f800000
100331df push     esi
100331e0 push     edi
100331e1 lea      ecx, [esp + 0x48]
100331e5 lea      edx, [esp + 0x18]
100331e9 lea      eax, [esp + 0x88]
100331f0 mov      dword ptr [esp + 0x18], ebx
100331f4 mov      dword ptr [esp + 0x1c], ebx
100331f8 mov      dword ptr [esp + 0x20], ebx
100331fc mov      dword ptr [esp + 0x48], ebp
10033200 mov      dword ptr [esp + 0x4c], ebx
10033204 mov      dword ptr [esp + 0x50], ebx
10033208 mov      dword ptr [esp + 0x54], ebx
1003320c mov      dword ptr [esp + 0x58], ebp
10033210 mov      dword ptr [esp + 0x5c], ebx
10033214 mov      dword ptr [esp + 0x60], ebx
10033218 mov      dword ptr [esp + 0x64], ebx
1003321c mov      dword ptr [esp + 0x68], ebp
10033220 call     0x1005bcb0
10033225 push     0x3f666666
1003322a push     0x42b40000
1003322f push     0x42b40000
10033234 lea      esi, [esp + 0x54]
10033238 call     0x1005bbe0
1003323d add      esp, 0xc
10033240 call     0x1002e380
10033245 mov      eax, dword ptr [0x10730550]
1003324a imul     eax, eax, 0xcd0
10033250 lea      esi, [eax + 0x1072dee0]
10033256 lea      edi, [eax + 0x1072ebb0]
1003325c mov      ecx, 0x334
10033261 rep movsd dword ptr es:[edi], dword ptr [esi]
10033263 mov      edi, dword ptr [0x10730550]
10033269 inc      edi
1003326a mov      dword ptr [0x10730550], edi
10033270 imul     edi, edi, 0xcd0
10033276 add      edi, 0x1072def0
1003327c mov      ecx, 0x10
10033281 mov      esi, 0x10191368
10033286 push     ebp
10033287 rep movsd dword ptr es:[edi], dword ptr [esi]
10033289 call     0x1003de30
1003328e lea      eax, [esp + 0x8c]
10033295 add      esp, 4
10033298 push     eax
10033299 call     0x1003df90
1003329e mov      edi, dword ptr [0x10730550]
100332a4 imul     edi, edi, 0xcd0
100332aa add      edi, 0x1072e220
100332b0 mov      ecx, 0x10
100332b5 lea      esi, [esp + 0x4c]
100332b9 add      esp, 4
100332bc rep movsd dword ptr es:[edi], dword ptr [esi]
100332be call     0x1003e130
100332c3 mov      esi, dword ptr [esp + 0xd4]
100332ca mov      edi, dword ptr [esp + 0xd0]
100332d1 push     ebx
100332d2 mov      dword ptr [0x1072de40], 0x1072de48
100332dc mov      dword ptr [0x1072de44], ebx
100332e2 mov      dword ptr [0x1072da50], ebp
100332e8 mov      dword ptr [0x1072da54], ebp
100332ee mov      dword ptr [0x1072da58], ebp
100332f4 mov      dword ptr [0x1072da5c], ebp
100332fa mov      dword ptr [0x1072da30], ebx
10033300 mov      dword ptr [0x1072da34], ebx
10033306 mov      dword ptr [0x1072da38], ebx
1003330c mov      dword ptr [0x1072da3c], ebp
10033312 mov      dword ptr [0x1072dab0], ebx
10033318 mov      dword ptr [0x1072dab4], ebx
1003331e mov      dword ptr [0x1072dab8], ebx
10033324 mov      dword ptr [0x1072dabc], ebp
1003332a call     0x1003a5f0
1003332f fld      dword ptr [0x1019bc78]
10033335 add      esp, 4
10033338 fadd     dword ptr [0x1019bc84]
1003333e fstp     dword ptr [esp + 0x14]
10033342 mov      ecx, dword ptr [esp + 0x14]
10033346 mov      dword ptr [esp + 0x18], ecx
1003334a fld      dword ptr [0x1019bc84]
10033350 push     ebx
10033351 fadd     st(0), st(0)
10033353 push     ebx
10033354 sub      esp, 0xc
10033357 lea      ecx, [esp + 0x38]
1003335b fstp     dword ptr [esp + 0x44]
1003335f mov      eax, dword ptr [esp + 0x44]
10033363 fld      dword ptr [esp + 0x28]
10033367 mov      dword ptr [esp + 0x34], eax
1003336b fadd     dword ptr [esp + 0x34]
1003336f mov      dword ptr [esp + 0x30], eax
10033373 xor      eax, eax
10033375 mov      dword ptr [esp + 0x38], 0xffffffff
1003337d fstp     dword ptr [esp + 8]
10033381 fld      dword ptr [esp + 0x28]
10033385 fadd     dword ptr [esp + 0x30]
10033389 fstp     dword ptr [esp + 4]
1003338d fld      dword ptr [esp + 0x44]
10033391 fadd     dword ptr [esp + 0x2c]
10033395 fstp     dword ptr [esp]
10033398 call     0x1002e550
1003339d fld      dword ptr [esp + 0x34]
100333a1 add      esp, 0x14
100333a4 fsub     dword ptr [0x1019bc84]
100333aa push     ebx
100333ab push     ebp
100333ac sub      esp, 0xc
100333af fstp     dword ptr [esp + 0x44]
100333b3 lea      ecx, [esp + 0x38]
100333b7 fld      dword ptr [esp + 0x30]
100333bb xor      eax, eax
100333bd fsub     dword ptr [0x1019bc78]
100333c3 fstp     dword ptr [esp + 0x28]
100333c7 fld      dword ptr [esp + 0x2c]
100333cb fsub     dword ptr [0x1019bc84]
100333d1 fstp     dword ptr [esp + 0x3c]
100333d5 fld      dword ptr [esp + 0x44]
100333d9 fadd     dword ptr [0x1019bc78]
100333df fstp     dword ptr [esp + 8]
100333e3 fld      dword ptr [esp + 0x28]
100333e7 fadd     dword ptr [0x1019bc84]
100333ed fstp     dword ptr [esp + 4]
100333f1 fld      dword ptr [esp + 0x3c]
100333f5 fadd     dword ptr [0x1019bc84]
100333fb fstp     dword ptr [esp]
100333fe call     0x1002e550
10033403 fld      dword ptr [esp + 0x44]
10033407 add      esp, 0x14
1003340a fsub     dword ptr [0x1019bc78]
10033410 push     ebp
10033411 push     ebp
10033412 sub      esp, 0xc
10033415 fstp     dword ptr [esp + 8]
10033419 lea      ecx, [esp + 0x38]
1003341d fld      dword ptr [esp + 0x28]
10033421 xor      eax, eax
10033423 fsub     dword ptr [0x1019bc84]
10033429 fstp     dword ptr [esp + 4]
1003342d fld      dword ptr [esp + 0x3c]
10033431 fsub     dword ptr [0x1019bc84]
10033437 fstp     dword ptr [esp]
1003343a call     0x1002e550
1003343f fld      dword ptr [esp + 0x34]
10033443 add      esp, 0x14
10033446 fadd     dword ptr [0x1019bc84]
1003344c push     ebp
1003344d push     ebx
1003344e sub      esp, 0xc
10033451 fsub     dword ptr [0x1019bc78]
10033457 lea      ecx, [esp + 0x38]
1003345b xor      eax, eax
1003345d fstp     dword ptr [esp + 8]
10033461 fld      dword ptr [esp + 0x30]
10033465 fadd     dword ptr [0x1019bc78]
1003346b fsub     dword ptr [0x1019bc84]
10033471 fstp     dword ptr [esp + 4]
10033475 fld      dword ptr [esp + 0x2c]
10033479 fadd     dword ptr [0x1019bc84]
1003347f fsub     dword ptr [0x1019bc84]
10033485 fstp     dword ptr [esp]
10033488 call     0x1002e550
1003348d mov      edx, dword ptr [0x101ce75c]
10033493 mov      dword ptr [0x1072d9d4], 4
1003349d mov      eax, dword ptr [edx + 8]
100334a0 add      esp, 0x14
100334a3 cmp      eax, ebx
100334a5 mov      dword ptr [esp + 0x28], eax
100334a9 jle      0x10033539
100334af mov      ecx, 2
100334b4 mov      edx, 1
100334b9 lea      esp, [esp]
100334c0 mov      edi, dword ptr [0x1072d9d0]
100334c6 mov      esi, dword ptr [0x1072d9b0]
100334cc mov      word ptr [esi + edi*2], 3
100334d2 mov      edi, dword ptr [0x1072d9d0]
100334d8 mov      esi, dword ptr [0x1072d9b0]
100334de mov      word ptr [esi + edi*2 + 2], bx
100334e3 mov      edi, dword ptr [0x1072d9d0]
100334e9 mov      esi, dword ptr [0x1072d9b0]
100334ef mov      word ptr [esi + edi*2 + 4], cx
100334f4 mov      edi, dword ptr [0x1072d9d0]
100334fa mov      esi, dword ptr [0x1072d9b0]
10033500 mov      word ptr [esi + edi*2 + 6], cx
10033505 mov      edi, dword ptr [0x1072d9d0]
1003350b mov      esi, dword ptr [0x1072d9b0]
10033511 mov      word ptr [esi + edi*2 + 8], bx
10033516 mov      esi, dword ptr [0x1072d9d0]
1003351c mov      edi, dword ptr [0x1072d9b0]
10033522 mov      word ptr [edi + esi*2 + 0xa], dx
10033527 mov      edi, dword ptr [0x1072d9d0]
1003352d add      edi, 6
10033530 dec      eax
10033531 mov      dword ptr [0x1072d9d0], edi
10033537 jne      0x100334c0
10033539 lea      eax, [esp + 0x38]
1003353d push     eax
1003353e call     0x10032f90
10033543 add      esp, 4
10033546 call     0x1003a8d0
1003354b lea      ecx, [esp + 0x40]
1003354f push     ecx
10033550 call     0x10033010
10033555 add      esp, 4
10033558 call     0x1003e4b0
1003355d lea      edx, [esp + 0x30]
10033561 push     edx
10033562 call     dword ptr [0x1010c02c]
10033568 fild     dword ptr [esp + 0x28]
1003356c mov      esi, dword ptr [esp + 0x38]
10033570 mov      eax, dword ptr [esp + 0x40]
10033574 mov      edx, dword ptr [esp + 0x3c]
10033578 fstp     qword ptr [esp + 0x28]
1003357c mov      ecx, dword ptr [esp + 0x44]
10033580 sub      eax, esi
10033582 sbb      ecx, edx
10033584 mov      dword ptr [esp + 0x38], eax
10033588 mov      dword ptr [esp + 0x3c], ecx
1003358c fild     qword ptr [esp + 0x38]
10033590 pop      edi
10033591 pop      esi
10033592 fstp     qword ptr [esp + 0x30]
10033596 pop      ebp
10033597 fild     qword ptr [esp + 0x24]
1003359b pop      ebx
1003359c fstp     qword ptr [esp + 0x30]
100335a0 fld      qword ptr [esp + 0x28]
100335a4 fdiv     qword ptr [esp + 0x30]
100335a8 fdivr    qword ptr [esp + 0x18]
100335ac fdiv     qword ptr [0x1019bf30]
100335b2 fstp     dword ptr [esp + 0x18]
100335b6 fld      dword ptr [esp + 0x18]
100335ba add      esp, 0xbc
100335c0 ret      

100335d0/918
100335d0 push     ecx
100335d1 mov      eax, dword ptr [0x101ce79c]
100335d6 mov      cl, byte ptr [eax + 8]
100335d9 test     cl, cl
100335db jne      0x100335fc
100335dd push     0x10197e70
100335e2 push     0
100335e4 call     dword ptr [0x101d49c8]
100335ea push     0x10197e20
100335ef push     0
100335f1 call     dword ptr [0x101d49c8]
100335f7 add      esp, 0x10
100335fa pop      ecx
100335fb ret      
100335fc push     0x10197dec
10033601 push     0
10033603 call     dword ptr [0x101d49c8]
10033609 fild     dword ptr [0x10766720]
1003360f mov      ecx, dword ptr [0x101ce75c]
10033615 mov      edx, dword ptr [ecx + 8]
10033618 mov      eax, dword ptr [0x101d1b5c]
1003361d add      esp, 8
10033620 push     edx
10033621 sub      esp, 8
10033624 fstp     dword ptr [esp + 4]
10033628 fild     dword ptr [0x1076671c]
1003362e fstp     dword ptr [esp]
10033631 call     0x100330c0
10033636 fmul     dword ptr [0x1019bf40]
1003363c add      esp, 4
1003363f fstp     qword ptr [esp]
10033642 push     0x10197db8
10033647 push     0
10033649 call     dword ptr [0x101d49c8]
1003364f fild     dword ptr [0x10766720]
10033655 mov      eax, dword ptr [0x101ce75c]
1003365a mov      ecx, dword ptr [eax + 8]
1003365d mov      eax, dword ptr [0x101d1b60]
10033662 add      esp, 0x10
10033665 push     ecx
10033666 sub      esp, 8
10033669 fstp     dword ptr [esp + 4]
1003366d fild     dword ptr [0x1076671c]
10033673 fstp     dword ptr [esp]
10033676 call     0x100330c0
1003367b fmul     dword ptr [0x1019bf40]
10033681 add      esp, 4
10033684 fstp     qword ptr [esp]
10033687 push     0x10197d84
1003368c push     0
1003368e call     dword ptr [0x101d49c8]
10033694 fild     dword ptr [0x10766720]
1003369a mov      edx, dword ptr [0x101ce75c]
100336a0 mov      eax, dword ptr [edx + 8]
100336a3 add      esp, 0x10
100336a6 push     eax
100336a7 mov      eax, dword ptr [0x101d1b64]
100336ac sub      esp, 8
100336af fstp     dword ptr [esp + 4]
100336b3 fild     dword ptr [0x1076671c]
100336b9 fstp     dword ptr [esp]
100336bc call     0x100330c0
100336c1 fmul     dword ptr [0x1019bf40]
100336c7 add      esp, 4
100336ca fstp     qword ptr [esp]
100336cd push     0x10197d50
100336d2 push     0
100336d4 call     dword ptr [0x101d49c8]
100336da fild     dword ptr [0x10766720]
100336e0 mov      ecx, dword ptr [0x101ce75c]
100336e6 mov      edx, dword ptr [ecx + 8]
100336e9 mov      eax, dword ptr [0x101d1b68]
100336ee add      esp, 0x10
100336f1 push     edx
100336f2 sub      esp, 8
100336f5 fstp     dword ptr [esp + 4]
100336f9 fild     dword ptr [0x1076671c]
100336ff fstp     dword ptr [esp]
10033702 call     0x100330c0
10033707 fmul     dword ptr [0x1019bf40]
1003370d add      esp, 4
10033710 fstp     qword ptr [esp]
10033713 push     0x10197d1c
10033718 push     0
1003371a call     dword ptr [0x101d49c8]
10033720 fild     dword ptr [0x10766720]
10033726 mov      eax, dword ptr [0x101ce75c]
1003372b mov      ecx, dword ptr [eax + 8]
1003372e mov      eax, dword ptr [0x101d1b6c]
10033733 add      esp, 0x10
10033736 push     ecx
10033737 sub      esp, 8
1003373a fstp     dword ptr [esp + 4]
1003373e fild     dword ptr [0x1076671c]
10033744 fstp     dword ptr [esp]
10033747 call     0x100330c0
1003374c fmul     dword ptr [0x1019bf40]
10033752 add      esp, 4
10033755 fstp     qword ptr [esp]
10033758 push     0x10197ce8
1003375d push     0
1003375f call     dword ptr [0x101d49c8]
10033765 fild     dword ptr [0x10766720]
1003376b mov      edx, dword ptr [0x101ce75c]
10033771 mov      eax, dword ptr [edx + 8]
10033774 add      esp, 0x10
10033777 push     eax
10033778 mov      eax, dword ptr [0x101d1b70]
1003377d sub      esp, 8
10033780 fstp     dword ptr [esp + 4]
10033784 fild     dword ptr [0x1076671c]
1003378a fstp     dword ptr [esp]
1003378d call     0x100330c0
10033792 fmul     dword ptr [0x1019bf40]
10033798 add      esp, 4
1003379b fstp     qword ptr [esp]
1003379e push     0x10197cb4
100337a3 push     0
100337a5 call     dword ptr [0x101d49c8]
100337ab fild     dword ptr [0x10766720]
100337b1 mov      ecx, dword ptr [0x101ce75c]
100337b7 mov      edx, dword ptr [ecx + 8]
100337ba mov      eax, dword ptr [0x101d1b74]
100337bf add      esp, 0x10
100337c2 push     edx
100337c3 sub      esp, 8
100337c6 fstp     dword ptr [esp + 4]
100337ca fild     dword ptr [0x1076671c]
100337d0 fstp     dword ptr [esp]
100337d3 call     0x100330c0
100337d8 fmul     dword ptr [0x1019bf40]
100337de add      esp, 4
100337e1 fstp     qword ptr [esp]
100337e4 push     0x10197c80
100337e9 push     0
100337eb call     dword ptr [0x101d49c8]
100337f1 fild     dword ptr [0x10766720]
100337f7 mov      eax, dword ptr [0x101ce75c]
100337fc mov      ecx, dword ptr [eax + 8]
100337ff mov      eax, dword ptr [0x101d1b78]
10033804 add      esp, 0x10
10033807 push     ecx
10033808 sub      esp, 8
1003380b fstp     dword ptr [esp + 4]
1003380f fild     dword ptr [0x1076671c]
10033815 fstp     dword ptr [esp]
10033818 call     0x100330c0
1003381d fmul     dword ptr [0x1019bf40]
10033823 add      esp, 4
10033826 fstp     qword ptr [esp]
10033829 push     0x10197c4c
1003382e push     0
10033830 call     dword ptr [0x101d49c8]
10033836 mov      al, byte ptr [0x101d4968]
1003383b add      esp, 0x10
1003383e test     al, al
10033840 je       0x100338d2
10033846 mov      edx, dword ptr [0x101ce75c]
1003384c fild     dword ptr [0x10766720]
10033852 mov      eax, dword ptr [edx + 8]
10033855 push     eax
10033856 mov      eax, dword ptr [0x101d1b7c]
1003385b sub      esp, 8
1003385e fstp     dword ptr [esp + 4]
10033862 fild     dword ptr [0x1076671c]
10033868 fstp     dword ptr [esp]
1003386b call     0x100330c0
10033870 fmul     dword ptr [0x1019bf40]
10033876 add      esp, 4
10033879 fstp     qword ptr [esp]
1003387c push     0x10197c18
10033881 push     0
10033883 call     dword ptr [0x101d49c8]
10033889 fild     dword ptr [0x10766720]
1003388f mov      ecx, dword ptr [0x101ce75c]
10033895 mov      edx, dword ptr [ecx + 8]
10033898 mov      eax, dword ptr [0x101d1b80]
1003389d add      esp, 0x10
100338a0 push     edx
100338a1 sub      esp, 8
100338a4 fstp     dword ptr [esp + 4]
100338a8 fild     dword ptr [0x1076671c]
100338ae fstp     dword ptr [esp]
100338b1 call     0x100330c0
100338b6 fmul     dword ptr [0x1019bf40]
100338bc add      esp, 4
100338bf fstp     qword ptr [esp]
100338c2 push     0x10197be4
100338c7 push     0
100338c9 call     dword ptr [0x101d49c8]
100338cf add      esp, 0x10
100338d2 mov      eax, dword ptr [0x101d1b84]
100338d7 push     0x12
100338d9 push     eax
100338da call     0x100331d0
100338df fstp     qword ptr [esp]
100338e2 push     0x10197bb0
100338e7 push     0
100338e9 call     dword ptr [0x101d49c8]
100338ef mov      ecx, dword ptr [0x101d1b88]
100338f5 push     0x12
100338f7 push     ecx
100338f8 call     0x100331d0
100338fd fstp     qword ptr [esp + 0x10]
10033901 add      esp, 0x10
10033904 push     0x10197b7c
10033909 push     0
1003390b call     dword ptr [0x101d49c8]
10033911 mov      edx, dword ptr [0x101d1b84]
10033917 push     9
10033919 push     edx
1003391a call     0x100331d0
1003391f fstp     qword ptr [esp + 0x10]
10033923 add      esp, 0x10
10033926 push     0x10197b48
1003392b push     0
1003392d call     dword ptr [0x101d49c8]
10033933 mov      eax, dword ptr [0x101d1b88]
10033938 push     9
1003393a push     eax
1003393b call     0x100331d0
10033940 fstp     qword ptr [esp + 0x10]
10033944 add      esp, 0x10
10033947 push     0x10197b14
1003394c push     0
1003394e call     dword ptr [0x101d49c8]
10033954 push     0x10197dec
10033959 push     0
1003395b call     dword ptr [0x101d49c8]
10033961 add      esp, 0x18
10033964 pop      ecx
10033965 ret      

100339b0/214
100339b0 push     ecx
100339b1 mov      eax, dword ptr [0x101d1b38]
100339b6 push     0x552
100339bb push     0
100339bd push     0
100339bf call     0x100330c0
100339c4 add      esp, 0xc
100339c7 fmul     dword ptr [0x1019bf40]
100339cd push     0x10197dec
100339d2 push     0
100339d4 fstp     dword ptr [esp + 8]
100339d8 call     dword ptr [0x101d49c8]
100339de fld      qword ptr [0x1019be20]
100339e4 fstp     qword ptr [esp]
100339e7 push     0x10197ae4
100339ec push     0
100339ee call     dword ptr [0x101d49c8]
100339f4 fld      qword ptr [0x1019be20]
100339fa add      esp, 8
100339fd fstp     qword ptr [esp]
10033a00 push     0x10197ab4
10033a05 push     0
10033a07 call     dword ptr [0x101d49c8]
10033a0d fld      qword ptr [0x1019be20]
10033a13 add      esp, 8
10033a16 fstp     qword ptr [esp]
10033a19 push     0x10197a84
10033a1e push     0
10033a20 call     dword ptr [0x101d49c8]
10033a26 fld      qword ptr [0x1019be20]
10033a2c add      esp, 8
10033a2f fstp     qword ptr [esp]
10033a32 push     0x10197a54
10033a37 push     0
10033a39 call     dword ptr [0x101d49c8]
10033a3f fld      dword ptr [esp + 0x10]
10033a43 fmul     dword ptr [0x1019bdf4]
10033a49 add      esp, 8
10033a4c fstp     qword ptr [esp]
10033a4f push     0x10197a24
10033a54 push     0
10033a56 call     dword ptr [0x101d49c8]
10033a5c fld      dword ptr [esp + 0x10]
10033a60 fadd     st(0), st(0)
10033a62 add      esp, 8
10033a65 fstp     qword ptr [esp]
10033a68 push     0x101979f4
10033a6d push     0
10033a6f call     dword ptr [0x101d49c8]
10033a75 push     0x10197dec
10033a7a push     0
10033a7c call     dword ptr [0x101d49c8]
10033a82 add      esp, 0x1c
10033a85 ret      
