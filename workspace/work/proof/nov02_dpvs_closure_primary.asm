
10006300/214
10006300 push     esi
10006301 push     edi
10006302 mov      edi, dword ptr [esp + 0xc]
10006306 xor      esi, esi
10006308 test     edi, edi
1000630a jle      0x10006354
1000630c add      ecx, 0x13
1000630f nop      
10006310 movzx    eax, byte ptr [ecx]
10006313 cmp      ebx, eax
10006315 jg       0x1000634c
10006317 movzx    eax, byte ptr [ecx - 3]
1000631b mov      byte ptr [ecx], 0xff
1000631e fld      dword ptr [eax + edx]
10006321 movzx    eax, byte ptr [ecx - 2]
10006325 fmul     dword ptr [ecx - 0x13]
10006328 fld      dword ptr [eax + edx]
1000632b movzx    eax, byte ptr [ecx - 1]
1000632f fmul     dword ptr [ecx - 0xf]
10006332 faddp    st(1)
10006334 fld      dword ptr [eax + edx]
10006337 fmul     dword ptr [ecx - 0xb]
1000633a faddp    st(1)
1000633c fadd     dword ptr [ecx - 7]
1000633f fcomp    dword ptr [0x1019bc84]
10006345 fnstsw   ax
10006347 test     ah, 0x41
1000634a jnp      0x100063bb
1000634c inc      esi
1000634d add      ecx, 0x14
10006350 cmp      esi, edi
10006352 jl       0x10006310
10006354 mov      eax, dword ptr [0x101ce5c0]
10006359 push     ebp
1000635a xor      ebp, ebp
1000635c test     eax, eax
1000635e jle      0x100063ca
10006360 mov      ecx, dword ptr [0x101ce5c4]
10006366 mov      edi, dword ptr [ecx + ebp*4]
10006369 cmp      ebx, dword ptr [edi + 0x18]
1000636c jg       0x100063c0
1000636e mov      ecx, dword ptr [edi + 0x20]
10006371 xor      esi, esi
10006373 cmp      esi, dword ptr [edi + 0x1c]
10006376 jge      0x100063d0
10006378 movzx    eax, byte ptr [ecx + 0x13]
1000637c cmp      ebx, eax
1000637e jg       0x100063b5
10006380 movzx    eax, byte ptr [ecx + 0x11]
10006384 mov      byte ptr [ecx + 0x13], 0xff
10006388 fld      dword ptr [eax + edx]
1000638b movzx    eax, byte ptr [ecx + 0x10]
1000638f fmul     dword ptr [ecx + 4]
10006392 fld      dword ptr [eax + edx]
10006395 movzx    eax, byte ptr [ecx + 0x12]
10006399 fmul     dword ptr [ecx]
1000639b faddp    st(1)
1000639d fld      dword ptr [eax + edx]
100063a0 fmul     dword ptr [ecx + 8]
100063a3 faddp    st(1)
100063a5 fadd     dword ptr [ecx + 0xc]
100063a8 fcomp    dword ptr [0x1019bc84]
100063ae fnstsw   ax
100063b0 test     ah, 0x41
100063b3 je       0x100063c0
100063b5 inc      esi
100063b6 add      ecx, 0x14
100063b9 jmp      0x10006373
100063bb pop      edi
100063bc mov      al, 1
100063be pop      esi
100063bf ret      
100063c0 mov      eax, dword ptr [0x101ce5c0]
100063c5 inc      ebp
100063c6 cmp      ebp, eax
100063c8 jl       0x10006360
100063ca pop      ebp
100063cb pop      edi
100063cc xor      al, al
100063ce pop      esi
100063cf ret      
100063d0 pop      ebp
100063d1 pop      edi
100063d2 mov      al, 1
100063d4 pop      esi
100063d5 ret      

100080d0/130
100080d0 mov      eax, dword ptr [0x101d7e98]
100080d5 mov      ecx, dword ptr [eax + edi*4]
100080d8 cmp      ecx, dword ptr [0x10678500]
100080de je       0x10008151
100080e0 mov      edx, dword ptr [0x101d1b9c]
100080e6 mov      eax, dword ptr [edx + 0x14]
100080e9 mov      ecx, dword ptr [0x101ce800]
100080ef mov      dl, byte ptr [ecx + 8]
100080f2 push     esi
100080f3 lea      esi, [edi + edi*2]
100080f6 shl      esi, 2
100080f9 test     dl, dl
100080fb mov      eax, dword ptr [eax + esi + 8]
100080ff je       0x10008119
10008101 mov      edx, dword ptr [esp + 0xc]
10008105 mov      ecx, dword ptr [esp + 8]
10008109 push     edx
1000810a lea      edx, [eax + 4]
1000810d call     0x10006300
10008112 add      esp, 4
10008115 test     al, al
10008117 jne      0x10008150
10008119 mov      eax, dword ptr [0x10678500]
1000811e mov      ecx, dword ptr [0x101d7e98]
10008124 mov      dword ptr [ecx + edi*4], eax
10008127 mov      edx, dword ptr [0x101d1b9c]
1000812d mov      eax, dword ptr [edx + 0x14]
10008130 movzx    ecx, word ptr [eax + esi + 6]
10008135 mov      edx, dword ptr [eax + esi + 8]
10008139 add      eax, esi
1000813b movzx    esi, word ptr [eax + 4]
1000813f mov      eax, dword ptr [eax]
10008141 add      ecx, 0x800
10008147 push     edx
10008148 call     0x10024380
1000814d add      esp, 4
10008150 pop      esi
10008151 ret      

10008160/451
10008160 mov      eax, dword ptr [esp + 0x10]
10008164 sub      esp, 0xc
10008167 push     ebx
10008168 mov      ebx, dword ptr [esp + 0x18]
1000816c push     ebp
1000816d mov      ebp, dword ptr [esp + 0x18]
10008171 push     esi
10008172 mov      esi, dword ptr [esp + 0x24]
10008176 push     edi
10008177 push     eax
10008178 mov      eax, esi
1000817a mov      ecx, ebx
1000817c mov      edi, ebp
1000817e call     0x100064b0
10008183 add      esp, 4
10008186 test     al, al
10008188 jne      0x10008321
1000818e mov      edi, dword ptr [esp + 0x2c]
10008192 push     edi
10008193 mov      eax, esi
10008195 mov      ecx, ebx
10008197 mov      edx, ebp
10008199 call     0x100065c0
1000819e add      esp, 4
100081a1 test     al, al
100081a3 jne      0x1000825f
100081a9 mov      al, byte ptr [0x101ce5ee]
100081ae test     al, al
100081b0 je       0x100081d7
100081b2 mov      eax, dword ptr [ebp + 0x20]
100081b5 xor      esi, esi
100081b7 test     eax, eax
100081b9 jle      0x100081d7
100081bb jmp      0x100081c0
100081bd lea      ecx, [ecx]
100081c0 mov      ecx, dword ptr [ebp + 0x24]
100081c3 mov      edx, dword ptr [ecx + esi*4]
100081c6 push     edx
100081c7 call     0x10009480
100081cc mov      eax, dword ptr [ebp + 0x20]
100081cf add      esp, 4
100081d2 inc      esi
100081d3 cmp      esi, eax
100081d5 jl       0x100081c0
100081d7 mov      ecx, dword ptr [ebp + 0x18]
100081da test     ecx, ecx
100081dc mov      eax, dword ptr [ebp + 0x1c]
100081df mov      dword ptr [esp + 0x14], 0
100081e7 jle      0x10008321
100081ed mov      ecx, dword ptr [0x10678500]
100081f3 lea      ebx, [eax + eax*2]
100081f6 lea      edi, [eax*4]
100081fd mov      eax, dword ptr [0x101d7e98]
10008202 shl      ebx, 2
10008205 cmp      dword ptr [edi + eax], ecx
10008208 je       0x10008241
1000820a mov      dword ptr [edi + eax], ecx
1000820d mov      eax, dword ptr [0x101d1b9c]
10008212 mov      eax, dword ptr [eax + 0x14]
10008215 movzx    ecx, word ptr [eax + ebx + 6]
1000821a mov      edx, dword ptr [eax + ebx + 8]
1000821e movzx    esi, word ptr [eax + ebx + 4]
10008223 add      eax, ebx
10008225 mov      eax, dword ptr [eax]
10008227 add      ecx, 0x800
1000822d push     edx
1000822e call     0x10024380
10008233 mov      eax, dword ptr [0x101d7e98]
10008238 mov      ecx, dword ptr [0x10678500]
1000823e add      esp, 4
10008241 mov      edx, dword ptr [esp + 0x14]
10008245 mov      esi, dword ptr [ebp + 0x18]
10008248 inc      edx
10008249 add      edi, 4
1000824c add      ebx, 0xc
1000824f cmp      edx, esi
10008251 mov      dword ptr [esp + 0x14], edx
10008255 jl       0x10008205
10008257 pop      edi
10008258 pop      esi
10008259 pop      ebp
1000825a pop      ebx
1000825b add      esp, 0xc
1000825e ret      
1000825f mov      eax, dword ptr [ebp + 0x28]
10008262 test     eax, eax
10008264 je       0x100082b0
10008266 mov      dword ptr [esp + 0x14], 0
1000826e jle      0x10008321
10008274 inc      edi
10008275 mov      dword ptr [esp + 0x18], edi
10008279 xor      edi, edi
1000827b jmp      0x10008280
1000827d lea      ecx, [ecx]
10008280 mov      eax, dword ptr [esp + 0x18]
10008284 mov      ecx, dword ptr [ebp + 0x2c]
10008287 push     eax
10008288 push     esi
10008289 add      ecx, edi
1000828b push     ebx
1000828c push     ecx
1000828d call     0x10008160
10008292 mov      eax, dword ptr [esp + 0x24]
10008296 mov      ecx, dword ptr [ebp + 0x28]
10008299 add      esp, 0x10
1000829c inc      eax
1000829d add      edi, 0x30
100082a0 cmp      eax, ecx
100082a2 mov      dword ptr [esp + 0x14], eax
100082a6 jl       0x10008280
100082a8 pop      edi
100082a9 pop      esi
100082aa pop      ebp
100082ab pop      ebx
100082ac add      esp, 0xc
100082af ret      
100082b0 mov      al, byte ptr [0x101ce5ee]
100082b5 test     al, al
100082b7 je       0x100082e1
100082b9 mov      eax, dword ptr [ebp + 0x20]
100082bc xor      edi, edi
100082be test     eax, eax
100082c0 jle      0x100082e1
100082c2 mov      eax, dword ptr [esp + 0x2c]
100082c6 mov      edx, dword ptr [ebp + 0x24]
100082c9 inc      eax
100082ca push     eax
100082cb mov      eax, dword ptr [edx + edi*4]
100082ce push     esi
100082cf push     ebx
100082d0 push     eax
100082d1 call     0x10009570
100082d6 mov      eax, dword ptr [ebp + 0x20]
100082d9 add      esp, 0x10
100082dc inc      edi
100082dd cmp      edi, eax
100082df jl       0x100082c2
100082e1 mov      eax, dword ptr [ebp + 0x18]
100082e4 test     eax, eax
100082e6 mov      edi, dword ptr [ebp + 0x1c]
100082e9 mov      dword ptr [esp + 0x14], 0
100082f1 jle      0x10008321
100082f3 mov      ecx, dword ptr [esp + 0x2c]
100082f7 inc      ecx
100082f8 mov      dword ptr [esp + 0x18], ecx
100082fc jmp      0x10008302
100082fe mov      ebx, dword ptr [esp + 0x24]
10008302 push     esi
10008303 push     ebx
10008304 mov      ebx, dword ptr [esp + 0x20]
10008308 call     0x100080d0
1000830d mov      eax, dword ptr [esp + 0x1c]
10008311 mov      ecx, dword ptr [ebp + 0x18]
10008314 add      esp, 8
10008317 inc      eax
10008318 inc      edi
10008319 cmp      eax, ecx
1000831b mov      dword ptr [esp + 0x14], eax
1000831f jl       0x100082fe
10008321 pop      edi
10008322 pop      esi

100083a0/288
100083a0 push     ecx
100083a1 push     ebx
100083a2 push     ebp
100083a3 mov      ebp, dword ptr [esp + 0x14]
100083a7 push     esi
100083a8 push     edi
100083a9 mov      edi, dword ptr [eax + 0x38]
100083ac test     edi, edi
100083ae je       0x100084ba
100083b4 mov      eax, dword ptr [edi]
100083b6 mov      esi, eax
100083b8 imul     esi, esi, 0x34
100083bb add      esi, 0x10678ac4
100083c1 cmp      dword ptr [esi + 0xc], 5
100083c5 je       0x100084af
100083cb mov      edx, dword ptr [0x10678510]
100083d1 imul     eax, eax, 0x74
100083d4 add      eax, edx
100083d6 mov      ebx, eax
100083d8 mov      eax, dword ptr [ebx]
100083da cmp      eax, 1
100083dd jg       0x10008482
100083e3 mov      al, byte ptr [0x101ce5ef]
100083e8 test     al, al
100083ea je       0x100084af
100083f0 cmp      dword ptr [esi + 0xc], 2
100083f4 jge      0x10008424
100083f6 mov      ecx, dword ptr [esp + 0x18]
100083fa lea      edx, [edi + 4]
100083fd mov      eax, ebp
100083ff call     0x100063e0
10008404 test     al, al
10008406 jne      0x100084af
1000840c mov      ecx, dword ptr [esi + 8]
1000840f push     ecx
10008410 call     dword ptr [0x101d4bfc]
10008416 add      esp, 4
10008419 push     esi
1000841a mov      eax, ebx
1000841c call     0x1001ffc0
10008421 add      esp, 4
10008424 mov      ecx, dword ptr [esp + 0x18]
10008428 lea      edx, [esi + 0x14]
1000842b mov      eax, ebp
1000842d call     0x100063e0
10008432 test     al, al
10008434 jne      0x100084af
10008436 mov      edx, dword ptr [esi + 8]
10008439 push     edx
1000843a call     dword ptr [0x101d4bf8]
10008440 mov      eax, dword ptr [ebx]
10008442 add      esp, 4
10008445 cmp      eax, 1
10008448 jne      0x10008467
1000844a push     -1
1000844c push     ebx
1000844d push     esi
1000844e call     0x1001f6f0
10008453 mov      dword ptr [esi + 0xc], 5
1000845a mov      eax, dword ptr [edi]
1000845c add      esp, 0xc
1000845f push     eax
10008460 call     0x10024680
10008465 jmp      0x100084ac
10008467 push     ebx
10008468 push     esi
10008469 call     0x1001fa70
1000846e mov      dword ptr [esi + 0xc], 5
10008475 mov      eax, dword ptr [edi]
10008477 add      esp, 8
1000847a push     eax
1000847b call     0x10024680
10008480 jmp      0x100084ac
10008482 cmp      eax, 3
10008485 jne      0x100084af
10008487 mov      al, byte ptr [0x101ce5f0]
1000848c test     al, al
1000848e je       0x100084af
10008490 mov      ecx, dword ptr [esp + 0x18]
10008494 lea      edx, [edi + 4]
10008497 mov      eax, ebp
10008499 call     0x100063e0
1000849e test     al, al
100084a0 jne      0x100084af
100084a2 mov      ecx, dword ptr [edi]
100084a4 push     ecx
100084a5 mov      eax, esi
100084a7 call     0x10024610
100084ac add      esp, 4
100084af mov      edi, dword ptr [edi + 0x1c]
100084b2 test     edi, edi
100084b4 jne      0x100083b4
100084ba pop      edi
100084bb pop      esi
100084bc pop      ebp
100084bd pop      ebx
100084be pop      ecx
100084bf ret      

10009250/88
10009250 push     ecx
10009251 mov      eax, dword ptr [0x1067850c]
10009256 push     ebp
10009257 mov      ebp, dword ptr [esp + 0xc]
1000925b push     esi
1000925c xor      esi, esi
1000925e test     eax, eax
10009260 push     edi
10009261 mov      dword ptr [esp + 0xc], eax
10009265 jle      0x100092a3
10009267 xor      edi, edi
10009269 lea      esp, [esp]
10009270 mov      eax, dword ptr [0x10678510]
10009275 mov      eax, dword ptr [edi + eax]
10009278 cmp      eax, 1
1000927b jg       0x10009287
1000927d push     ebx
1000927e push     ebp
1000927f push     esi
10009280 call     0x100087a0
10009285 jmp      0x10009294
10009287 cmp      eax, 3
1000928a jne      0x10009297
1000928c push     ebx
1000928d push     ebp
1000928e push     esi
1000928f call     0x100091d0
10009294 add      esp, 0xc
10009297 mov      eax, dword ptr [esp + 0xc]
1000929b inc      esi
1000929c add      edi, 0x74
1000929f cmp      esi, eax
100092a1 jl       0x10009270
100092a3 pop      edi
100092a4 pop      esi
100092a5 pop      ebp
100092a6 pop      ecx
100092a7 ret      

100092b0/234
100092b0 mov      al, byte ptr [0x101ce5ec]
100092b5 sub      esp, 8
100092b8 test     al, al
100092ba push     ebx
100092bb push     ebp
100092bc mov      ebp, dword ptr [esp + 0x1c]
100092c0 push     esi
100092c1 push     edi
100092c2 je       0x10009377
100092c8 mov      eax, dword ptr [esp + 0x1c]
100092cc mov      esi, dword ptr [eax + 0x1c]
100092cf mov      eax, dword ptr [esi + 0x28]
100092d2 test     eax, eax
100092d4 je       0x10009313
100092d6 mov      ecx, dword ptr [0x101ce800]
100092dc mov      dl, byte ptr [ecx + 8]
100092df test     dl, dl
100092e1 je       0x10009313
100092e3 xor      edi, edi
100092e5 test     eax, eax
100092e7 jle      0x10009377
100092ed xor      ebx, ebx
100092ef nop      
100092f0 mov      edx, dword ptr [esp + 0x20]
100092f4 mov      eax, dword ptr [esi + 0x2c]
100092f7 push     0
100092f9 push     ebp
100092fa push     edx
100092fb add      eax, ebx
100092fd push     eax
100092fe call     0x10008160
10009303 mov      eax, dword ptr [esi + 0x28]
10009306 add      esp, 0x10
10009309 inc      edi
1000930a add      ebx, 0x30
1000930d cmp      edi, eax
1000930f jl       0x100092f0
10009311 jmp      0x10009377
10009313 mov      al, byte ptr [0x101ce5ee]
10009318 test     al, al
1000931a je       0x10009344
1000931c mov      eax, dword ptr [esi + 0x20]
1000931f xor      edi, edi
10009321 test     eax, eax
10009323 jle      0x10009344
10009325 mov      ecx, dword ptr [esp + 0x20]
10009329 mov      edx, dword ptr [esi + 0x24]
1000932c mov      eax, dword ptr [edx + edi*4]
1000932f push     0
10009331 push     ebp
10009332 push     ecx
10009333 push     eax
10009334 call     0x10009570
10009339 mov      eax, dword ptr [esi + 0x20]
1000933c add      esp, 0x10
1000933f inc      edi
10009340 cmp      edi, eax
10009342 jl       0x10009325
10009344 mov      eax, dword ptr [esi + 0x18]
10009347 test     eax, eax
10009349 mov      edi, dword ptr [esi + 0x1c]
1000934c mov      dword ptr [esp + 0x14], 0
10009354 jle      0x10009377
10009356 mov      ecx, dword ptr [esp + 0x20]
1000935a push     ebp
1000935b push     ecx
1000935c xor      ebx, ebx
1000935e call     0x100080d0
10009363 mov      eax, dword ptr [esp + 0x1c]
10009367 mov      ecx, dword ptr [esi + 0x18]
1000936a add      esp, 8
1000936d inc      eax
1000936e inc      edi
1000936f cmp      eax, ecx
10009371 mov      dword ptr [esp + 0x14], eax
10009375 jl       0x10009356
10009377 mov      al, byte ptr [0x101ce5ed]
1000937c test     al, al
1000937e je       0x10009392
10009380 mov      edx, dword ptr [esp + 0x20]
10009384 mov      eax, dword ptr [esp + 0x1c]
10009388 push     ebp
10009389 push     edx
1000938a call     0x100083a0
1000938f add      esp, 8
10009392 pop      edi
10009393 pop      esi
10009394 pop      ebp
10009395 pop      ebx
10009396 add      esp, 8
10009399 ret      

100093a0/217
100093a0 push     ecx
100093a1 push     ebx
100093a2 mov      ebx, eax
100093a4 mov      eax, dword ptr [0x101d1b9c]
100093a9 mov      edx, dword ptr [eax + 0xf0]
100093af mov      eax, dword ptr [esp + 0xc]
100093b3 push     edi
100093b4 mov      edi, ebx
100093b6 shl      edi, 5
100093b9 add      edi, edx
100093bb mov      edx, edi
100093bd call     0x100063e0
100093c2 test     al, al
100093c4 jne      0x10009475
100093ca mov      ecx, dword ptr [0x101ce6e0]
100093d0 test     byte ptr [ecx + 8], 1
100093d4 push     esi
100093d5 je       0x100093f5
100093d7 mov      esi, dword ptr [0x101da9c8]
100093dd push     0x10191418
100093e2 lea      edx, [edi + 0xc]
100093e5 add      esi, 0x249d18
100093eb mov      eax, edi
100093ed call     0x10005590
100093f2 add      esp, 4
100093f5 mov      eax, dword ptr [0x10678500]
100093fa mov      edx, dword ptr [0x101d7e9c]
10009400 mov      dword ptr [edx + ebx*4], eax
10009403 mov      ecx, dword ptr [edi + 0x18]
10009406 mov      eax, dword ptr [edi + 0x1c]
10009409 push     ebp
1000940a xor      ebp, ebp
1000940c test     ecx, ecx
1000940e jle      0x10009473
10009410 lea      ebx, [eax + eax*2]
10009413 lea      ecx, [eax*4]
1000941a shl      ebx, 2
1000941d mov      dword ptr [esp + 0x10], ecx
10009421 mov      edx, dword ptr [0x101d7e98]
10009427 mov      eax, dword ptr [0x10678500]
1000942c mov      ecx, dword ptr [esp + 0x10]
10009430 mov      dword ptr [ecx + edx], eax
10009433 mov      edx, dword ptr [0x101d1b9c]
10009439 mov      eax, dword ptr [edx + 0x14]
1000943c movzx    ecx, word ptr [eax + ebx + 6]
10009441 mov      edx, dword ptr [eax + ebx + 8]
10009445 movzx    esi, word ptr [eax + ebx + 4]
1000944a add      eax, ebx
1000944c mov      eax, dword ptr [eax]
1000944e add      ecx, 0x800
10009454 push     edx
10009455 call     0x10024380
1000945a mov      edx, dword ptr [esp + 0x14]
1000945e mov      eax, dword ptr [edi + 0x18]
10009461 add      esp, 4
10009464 inc      ebp
10009465 add      edx, 4
10009468 add      ebx, 0xc
1000946b cmp      ebp, eax
1000946d mov      dword ptr [esp + 0x10], edx
10009471 jl       0x10009421
10009473 pop      ebp
10009474 pop      esi
10009475 pop      edi
10009476 pop      ebx
10009477 pop      ecx
10009478 ret      

10009480/234
10009480 mov      eax, dword ptr [0x101d7e94]
10009485 mov      ecx, dword ptr [0x10678500]
1000948b push     ebx
1000948c push     ebp
1000948d mov      ebp, dword ptr [esp + 0xc]
10009491 cmp      dword ptr [eax + ebp*8], ecx
10009494 push     esi
10009495 push     edi
10009496 je       0x10009565
1000949c fld      dword ptr [0x1019bc84]
100094a2 mov      dword ptr [eax + ebp*8], ecx
100094a5 mov      eax, dword ptr [0x101d1b9c]
100094aa mov      ecx, dword ptr [eax + 0xf8]
100094b0 lea      esi, [ebp + ebp*2]
100094b4 shl      esi, 5
100094b7 fld      dword ptr [esi + ecx]
100094ba add      esi, ecx
100094bc fucompp  
100094be fnstsw   ax
100094c0 test     ah, 0x44
100094c3 jnp      0x100094e7
100094c5 lea      ecx, [esi + 4]
100094c8 mov      eax, 0x101d7e7c
100094cd call     0x10058d20
100094d2 fmul     dword ptr [0x101d7e88]
100094d8 fadd     dword ptr [0x101d7e8c]
100094de fcomp    dword ptr [esi]
100094e0 fnstsw   ax
100094e2 test     ah, 0x41
100094e5 je       0x10009565
100094e7 mov      ecx, dword ptr [0x101ce738]
100094ed mov      al, byte ptr [ecx + 8]
100094f0 test     al, al
100094f2 je       0x10009524
100094f4 mov      eax, dword ptr [esi + 0x10]
100094f7 push     eax
100094f8 call     dword ptr [0x101d4b5c]
100094fe mov      edi, dword ptr [0x101da9c8]
10009504 add      esp, 4
10009507 push     eax
10009508 push     0x3e99999a
1000950d add      esi, 4
10009510 push     esi
10009511 add      edi, 0x249d18
10009517 mov      ebx, 0x10191488
1000951c call     0x10005680
10009521 add      esp, 0xc
10009524 push     ebp
10009525 call     0x10023b90
1000952a mov      edi, eax
1000952c add      esp, 4
1000952f test     edi, edi
10009531 jl       0x10009565
10009533 mov      eax, dword ptr [0x10678510]
10009538 mov      edx, edi
1000953a imul     edx, edx, 0x74
1000953d mov      esi, edi
1000953f imul     esi, esi, 0x34
10009542 push     ebp
10009543 add      edx, eax
10009545 push     edx
10009546 add      esi, 0x10678ac4
1000954c push     esi
1000954d call     0x1001f6f0
10009552 add      esp, 0xc
10009555 push     edi
10009556 mov      dword ptr [esi + 0xc], 5
1000955d call     0x10024680
10009562 add      esp, 4
10009565 pop      edi
10009566 pop      esi
10009567 pop      ebp
10009568 pop      ebx
10009569 ret      

10009570/283
10009570 push     ecx
10009571 mov      eax, dword ptr [0x101d7e94]
10009576 push     ebx
10009577 mov      ebx, dword ptr [0x10678500]
1000957d push     ebp
1000957e mov      ebp, dword ptr [esp + 0x10]
10009582 push     esi
10009583 push     edi
10009584 lea      edi, [eax + ebp*8]
10009587 cmp      dword ptr [edi], ebx
10009589 je       0x10009685
1000958f mov      ecx, dword ptr [0x101d1b9c]
10009595 fld      dword ptr [0x1019bc84]
1000959b mov      eax, dword ptr [ecx + 0xf8]
100095a1 lea      esi, [ebp + ebp*2]
100095a5 shl      esi, 5
100095a8 fld      dword ptr [esi + eax]
100095ab add      esi, eax
100095ad fucompp  
100095af fnstsw   ax
100095b1 test     ah, 0x44
100095b4 jnp      0x100095e0
100095b6 lea      ecx, [esi + 4]
100095b9 mov      eax, 0x101d7e7c
100095be call     0x10058d20
100095c3 fmul     dword ptr [0x101d7e88]
100095c9 fadd     dword ptr [0x101d7e8c]
100095cf fcomp    dword ptr [esi]
100095d1 fnstsw   ax
100095d3 test     ah, 0x41
100095d6 jne      0x100095e0
100095d8 mov      dword ptr [edi], ebx
100095da pop      edi
100095db pop      esi
100095dc pop      ebp
100095dd pop      ebx
100095de pop      ecx
100095df ret      
100095e0 mov      edx, dword ptr [esp + 0x20]
100095e4 mov      ebx, dword ptr [esp + 0x24]
100095e8 mov      ecx, dword ptr [esp + 0x1c]
100095ec push     edx
100095ed lea      edx, [esi + 0x14]
100095f0 call     0x10006300
100095f5 add      esp, 4
100095f8 test     al, al
100095fa jne      0x10009685
10009600 mov      eax, dword ptr [0x10678500]
10009605 mov      ecx, dword ptr [0x101ce738]
1000960b mov      dword ptr [edi], eax
1000960d mov      al, byte ptr [ecx + 8]
10009610 test     al, al
10009612 je       0x10009644
10009614 mov      eax, dword ptr [esi + 0x10]
10009617 push     eax
10009618 call     dword ptr [0x101d4b5c]
1000961e mov      edi, dword ptr [0x101da9c8]
10009624 add      esp, 4
10009627 push     eax
10009628 push     0x3e99999a
1000962d add      esi, 4
10009630 push     esi
10009631 add      edi, 0x249d18
10009637 mov      ebx, 0x10191488
1000963c call     0x10005680
10009641 add      esp, 0xc
10009644 push     ebp
10009645 call     0x10023b90
1000964a mov      edi, eax
1000964c add      esp, 4
1000964f test     edi, edi
10009651 jl       0x10009685
10009653 mov      eax, dword ptr [0x10678510]
10009658 mov      edx, edi
1000965a imul     edx, edx, 0x74
1000965d mov      esi, edi
1000965f imul     esi, esi, 0x34
10009662 push     ebp
10009663 add      edx, eax
10009665 push     edx
10009666 add      esi, 0x10678ac4
1000966c push     esi
1000966d call     0x1001f6f0
10009672 add      esp, 0xc
10009675 push     edi
10009676 mov      dword ptr [esi + 0xc], 5
1000967d call     0x10024680
10009682 add      esp, 4
10009685 pop      edi
10009686 pop      esi
10009687 pop      ebp
10009688 pop      ebx
10009689 pop      ecx
1000968a ret      

10009690/55
10009690 mov      eax, dword ptr [ecx + 0x28]
10009693 test     eax, eax
10009695 push     esi
10009696 mov      esi, dword ptr [ecx + 0x2c]
10009699 je       0x100096c5
1000969b push     ebp
1000969c mov      ebp, eax
1000969e mov      edi, edi
100096a0 mov      ecx, dword ptr [0x101d7e9c]
100096a6 mov      eax, dword ptr [esi]
100096a8 mov      edx, dword ptr [ecx + eax*4]
100096ab cmp      edx, dword ptr [0x10678500]
100096b1 je       0x100096be
100096b3 push     edi
100096b4 mov      ecx, ebx
100096b6 call     0x100093a0
100096bb add      esp, 4
100096be add      esi, 4
100096c1 dec      ebp
100096c2 jne      0x100096a0
100096c4 pop      ebp
100096c5 pop      esi
100096c6 ret      
