
1002ff80/525
1002ff80 sub      esp, 0x24
1002ff83 fild     dword ptr [0x1076671c]
1002ff89 mov      eax, dword ptr [0x1072dbb0]
1002ff8e mov      ecx, dword ptr [0x1072dbb4]
1002ff94 mov      edx, dword ptr [0x1072dbb8]
1002ff9a fmul     dword ptr [0x1019bcb0]
1002ffa0 push     ebx
1002ffa1 mov      dword ptr [esp + 0x18], eax
1002ffa5 mov      eax, dword ptr [0x1072dbbc]
1002ffaa fstp     dword ptr [esp + 0xc]
1002ffae push     ebp
1002ffaf fild     dword ptr [0x10766720]
1002ffb5 mov      dword ptr [esp + 0x20], ecx
1002ffb9 mov      ecx, dword ptr [0x101d485c]
1002ffbf push     esi
1002ffc0 fmul     dword ptr [0x1019bcb0]
1002ffc6 mov      dword ptr [esp + 0x2c], eax
1002ffca push     edi
1002ffcb xor      eax, eax
1002ffcd fstp     dword ptr [esp + 0x14]
1002ffd1 mov      dword ptr [esp + 0x2c], edx
1002ffd5 fld      dword ptr [esp + 0x18]
1002ffd9 mov      dword ptr [0x1073055c], ecx
1002ffdf fmul     dword ptr [0x1019bcb0]
1002ffe5 fstp     dword ptr [esp + 0x20]
1002ffe9 fld      dword ptr [esp + 0x14]
1002ffed fmul     dword ptr [0x1019bcb0]
1002fff3 fstp     dword ptr [esp + 0x1c]
1002fff7 call     0x1003ea30
1002fffc mov      esi, dword ptr [esp + 0x1c]
10030000 mov      edi, dword ptr [esp + 0x20]
10030004 mov      eax, dword ptr [0x101d1b8c]
10030009 push     0x3f000000
1003000e push     0x3f000000
10030013 push     0x3e800000
10030018 push     0x3e800000
1003001d push     esi
1003001e push     edi
1003001f push     esi
10030020 push     edi
10030021 or       ebx, 0xffffffff
10030024 mov      dword ptr [0x1072dbb0], 0x3f800000
1003002e mov      dword ptr [0x1072dbb4], 0
10030038 mov      dword ptr [0x1072dbb8], 0
10030042 mov      dword ptr [0x1072dbbc], 0
1003004c call     0x1002e850
10030051 call     0x1003a8d0
10030056 mov      ebp, dword ptr [esp + 0x38]
1003005a mov      eax, dword ptr [0x101d1b8c]
1003005f push     0x3f000000
10030064 push     0x3f400000
10030069 push     0x3e800000
1003006e push     0x3f000000
10030073 push     esi
10030074 push     edi
10030075 push     esi
10030076 push     ebp
10030077 or       ebx, 0xffffffff
1003007a mov      dword ptr [0x1072dbb0], 0
10030084 mov      dword ptr [0x1072dbb4], 0x3f800000
1003008e mov      dword ptr [0x1072dbb8], 0
10030098 mov      dword ptr [0x1072dbbc], 0
100300a2 call     0x1002e850
100300a7 add      esp, 0x40
100300aa call     0x1003a8d0
100300af mov      edx, dword ptr [esp + 0x14]
100300b3 mov      eax, dword ptr [0x101d1b8c]
100300b8 push     0x3f400000
100300bd push     0x3f000000
100300c2 push     0x3f000000
100300c7 push     0x3e800000
100300cc push     esi
100300cd push     edi
100300ce push     edx
100300cf push     edi
100300d0 or       ebx, 0xffffffff
100300d3 mov      dword ptr [0x1072dbb0], 0
100300dd mov      dword ptr [0x1072dbb4], 0
100300e7 mov      dword ptr [0x1072dbb8], 0x3f800000
100300f1 mov      dword ptr [0x1072dbbc], 0
100300fb call     0x1002e850
10030100 call     0x1003a8d0
10030105 mov      eax, dword ptr [esp + 0x34]
10030109 push     0x3f400000
1003010e push     0x3f400000
10030113 push     0x3f000000
10030118 push     0x3f000000
1003011d push     esi
1003011e push     edi
1003011f push     eax
10030120 mov      eax, dword ptr [0x101d1b8c]
10030125 push     ebp
10030126 or       ebx, 0xffffffff
10030129 mov      dword ptr [0x1072dbb0], 0
10030133 mov      dword ptr [0x1072dbb4], 0
1003013d mov      dword ptr [0x1072dbb8], 0
10030147 mov      dword ptr [0x1072dbbc], 0x3f800000
10030151 call     0x1002e850
10030156 add      esp, 0x40
10030159 call     0x1003a8d0
1003015e mov      ecx, dword ptr [esp + 0x24]
10030162 mov      edx, dword ptr [esp + 0x28]
10030166 mov      eax, dword ptr [esp + 0x2c]
1003016a pop      edi
1003016b pop      esi
1003016c mov      dword ptr [0x1072dbb0], ecx
10030172 mov      ecx, dword ptr [esp + 0x28]
10030176 pop      ebp
10030177 mov      dword ptr [0x1072dbb4], edx
1003017d mov      dword ptr [0x1072dbb8], eax
10030182 mov      dword ptr [0x1072dbbc], ecx
10030188 pop      ebx
10030189 add      esp, 0x24
1003018c ret      

10030190/286
10030190 sub      esp, 0x14
10030193 fild     dword ptr [0x1076671c]
10030199 push     ebx
1003019a push     ebp
1003019b push     esi
1003019c fmul     dword ptr [0x1019bcb0]
100301a2 push     edi
100301a3 push     0x3f800000
100301a8 push     0x3f800000
100301ad fstp     dword ptr [esp + 0x20]
100301b1 xor      ecx, ecx
100301b3 fild     dword ptr [0x10766720]
100301b9 push     ecx
100301ba push     ecx
100301bb mov      al, 0xff
100301bd fmul     dword ptr [0x1019bcb0]
100301c3 mov      byte ptr [esp + 0x22], al
100301c7 mov      byte ptr [esp + 0x23], al
100301cb mov      eax, dword ptr [0x101d1b90]
100301d0 fstp     dword ptr [esp + 0x24]
100301d4 mov      byte ptr [esp + 0x21], cl
100301d8 fld      dword ptr [esp + 0x28]
100301dc mov      byte ptr [esp + 0x20], cl
100301e0 fmul     dword ptr [0x1019bcb0]
100301e6 mov      ebx, dword ptr [esp + 0x20]
100301ea fstp     dword ptr [esp + 0x30]
100301ee fld      dword ptr [esp + 0x24]
100301f2 mov      edi, dword ptr [esp + 0x30]
100301f6 fmul     dword ptr [0x1019bcb0]
100301fc fstp     dword ptr [esp + 0x2c]
10030200 mov      esi, dword ptr [esp + 0x2c]
10030204 push     esi
10030205 push     edi
10030206 push     esi
10030207 push     edi
10030208 call     0x1002e850
1003020d mov      ebp, dword ptr [esp + 0x38]
10030211 push     0x3f800000
10030216 push     0x3f800000
1003021b xor      ecx, ecx
1003021d push     ecx
1003021e push     ecx
1003021f push     esi
10030220 mov      al, 0xff
10030222 push     edi
10030223 mov      byte ptr [esp + 0x49], al
10030227 mov      byte ptr [esp + 0x4b], al
1003022b mov      eax, dword ptr [0x101d1b90]
10030230 mov      byte ptr [esp + 0x4a], cl
10030234 mov      byte ptr [esp + 0x48], cl
10030238 mov      ebx, dword ptr [esp + 0x48]
1003023c push     esi
1003023d push     ebp
1003023e call     0x1002e850
10030243 add      esp, 0x40
10030246 push     0x3f800000
1003024b push     0x3f800000
10030250 xor      ecx, ecx
10030252 push     ecx
10030253 push     ecx
10030254 mov      al, 0xff
10030256 mov      byte ptr [esp + 0x20], al
1003025a mov      byte ptr [esp + 0x23], al
1003025e mov      eax, dword ptr [esp + 0x24]
10030262 push     esi
10030263 push     edi
10030264 push     eax
10030265 mov      eax, dword ptr [0x101d1b90]
1003026a mov      byte ptr [esp + 0x2e], cl
1003026e mov      byte ptr [esp + 0x2d], cl
10030272 mov      ebx, dword ptr [esp + 0x2c]
10030276 push     edi
10030277 call     0x1002e850
1003027c mov      ecx, dword ptr [esp + 0x34]
10030280 push     0x3f800000
10030285 push     0x3f800000
1003028a push     0
1003028c push     0
1003028e push     esi
1003028f push     edi
10030290 push     ecx
10030291 push     ebp
10030292 mov      eax, dword ptr [0x101d1b94]
10030297 or       ebx, 0xffffffff
1003029a call     0x1002e850
1003029f add      esp, 0x40
100302a2 pop      edi
100302a3 pop      esi
100302a4 pop      ebp
100302a5 pop      ebx
100302a6 add      esp, 0x14
100302a9 jmp      0x1003a8d0

100302b0/271
100302b0 mov      eax, dword ptr [0x101d489c]
100302b5 sub      esp, 0x18
100302b8 test     eax, eax
100302ba push     ebx
100302bb je       0x100303ba
100302c1 fild     dword ptr [0x1076671c]
100302c7 mov      eax, dword ptr [0x1072dbb0]
100302cc mov      ecx, dword ptr [0x1072dbb4]
100302d2 mov      edx, dword ptr [0x1072dbb8]
100302d8 fmul     dword ptr [0x1019bcb0]
100302de mov      dword ptr [esp + 0xc], eax
100302e2 mov      eax, dword ptr [0x1072dbbc]
100302e7 mov      dword ptr [esp + 0x18], eax
100302eb fstp     dword ptr [esp + 8]
100302ef xor      eax, eax
100302f1 fild     dword ptr [0x10766720]
100302f7 mov      dword ptr [esp + 0x10], ecx
100302fb mov      dword ptr [esp + 0x14], edx
100302ff fmul     dword ptr [0x1019bcb0]
10030305 fstp     dword ptr [esp + 4]
10030309 call     0x1003ea30
1003030e mov      edx, dword ptr [esp + 4]
10030312 fld      dword ptr [esp + 4]
10030316 mov      eax, dword ptr [esp + 8]
1003031a fmul     dword ptr [0x1019bcb0]
10030320 mov      ecx, dword ptr [0x101d4898]
10030326 push     0x3f400000
1003032b push     0x3f400000
10030330 push     0x3e800000
10030335 push     0x3e800000
1003033a push     edx
1003033b push     eax
1003033c mov      eax, dword ptr [0x101d1b8c]
10030341 sub      esp, 8
10030344 fstp     dword ptr [esp + 4]
10030348 or       ebx, 0xffffffff
1003034b fld      dword ptr [esp + 0x28]
1003034f mov      dword ptr [0x1073055c], ecx
10030355 fmul     dword ptr [0x1019bcb0]
1003035b mov      dword ptr [0x1072dbb0], 0x3a83126f
10030365 mov      dword ptr [0x1072dbb4], 0
1003036f mov      dword ptr [0x1072dbb8], 0
10030379 fstp     dword ptr [esp]
1003037c mov      dword ptr [0x1072dbbc], 0
10030386 call     0x1002e850
1003038b add      esp, 0x20
1003038e call     0x1003a8d0
10030393 mov      ecx, dword ptr [esp + 0xc]
10030397 mov      edx, dword ptr [esp + 0x10]
1003039b mov      eax, dword ptr [esp + 0x14]
1003039f mov      dword ptr [0x1072dbb0], ecx
100303a5 mov      ecx, dword ptr [esp + 0x18]
100303a9 mov      dword ptr [0x1072dbb4], edx
100303af mov      dword ptr [0x1072dbb8], eax
100303b4 mov      dword ptr [0x1072dbbc], ecx
100303ba pop      ebx
100303bb add      esp, 0x18
100303be ret      

100303c0/258
100303c0 sub      esp, 0x18
100303c3 fild     dword ptr [0x1076671c]
100303c9 mov      eax, dword ptr [0x1072dbb0]
100303ce mov      ecx, dword ptr [0x1072dbb4]
100303d4 mov      edx, dword ptr [0x1072dbb8]
100303da fmul     dword ptr [0x1019bcb0]
100303e0 mov      dword ptr [esp + 8], eax
100303e4 mov      eax, dword ptr [0x1072dbbc]
100303e9 mov      dword ptr [esp + 0x14], eax
100303ed fstp     dword ptr [esp + 4]
100303f1 push     ebx
100303f2 fild     dword ptr [0x10766720]
100303f8 xor      eax, eax
100303fa mov      dword ptr [esp + 0x10], ecx
100303fe mov      dword ptr [esp + 0x14], edx
10030402 fmul     dword ptr [0x1019bcb0]
10030408 fstp     dword ptr [esp + 4]
1003040c call     0x1003ea30
10030411 mov      edx, dword ptr [esp + 4]
10030415 fld      dword ptr [esp + 4]
10030419 mov      eax, dword ptr [esp + 8]
1003041d fmul     dword ptr [0x1019bcb0]
10030423 mov      ecx, dword ptr [0x101d485c]
10030429 push     0x3f400000
1003042e push     0x3f400000
10030433 push     0x3e800000
10030438 push     0x3e800000
1003043d push     edx
1003043e push     eax
1003043f mov      eax, dword ptr [0x101d1b8c]
10030444 sub      esp, 8
10030447 fstp     dword ptr [esp + 4]
1003044b or       ebx, 0xffffffff
1003044e fld      dword ptr [esp + 0x28]
10030452 mov      dword ptr [0x1073055c], ecx
10030458 fmul     dword ptr [0x1019bcb0]
1003045e mov      dword ptr [0x1072dbb0], 0x3eaa7efa
10030468 mov      dword ptr [0x1072dbb4], 0x3eab020c
10030472 mov      dword ptr [0x1072dbb8], 0x3eaa7efa
1003047c fstp     dword ptr [esp]
1003047f mov      dword ptr [0x1072dbbc], 0
10030489 call     0x1002e850
1003048e add      esp, 0x20
10030491 call     0x1003a8d0
10030496 mov      ecx, dword ptr [esp + 0xc]
1003049a mov      edx, dword ptr [esp + 0x10]
1003049e mov      eax, dword ptr [esp + 0x14]
100304a2 mov      dword ptr [0x1072dbb0], ecx
100304a8 mov      ecx, dword ptr [esp + 0x18]
100304ac mov      dword ptr [0x1072dbb4], edx
100304b2 mov      dword ptr [0x1072dbb8], eax
100304b7 mov      dword ptr [0x1072dbbc], ecx
100304bd pop      ebx
100304be add      esp, 0x18
100304c1 ret      

100304d0/173
100304d0 push     ecx
100304d1 mov      ecx, dword ptr [0x101d1b9c]
100304d7 mov      edx, dword ptr [ecx + 0x20]
100304da test     edx, edx
100304dc push     ebx
100304dd je       0x100304eb
100304df mov      edx, dword ptr [eax*4 + 0x101ce740]
100304e6 fld      dword ptr [edx + 8]
100304e9 jmp      0x100304f1
100304eb fld      dword ptr [0x1019bc84]
100304f1 mov      eax, dword ptr [eax*4 + 0x101ce6e8]
100304f8 fld      dword ptr [eax + 8]
100304fb fld      dword ptr [0x1019bc84]
10030501 fld      st(2)
10030503 fucompp  
10030505 fnstsw   ax
10030507 test     ah, 0x44
1003050a mov      eax, dword ptr [0x101d1bdc]
1003050f jnp      0x10030516
10030511 mov      eax, dword ptr [0x101d1bd8]
10030516 mov      ecx, dword ptr [esp + 0xc]
1003051a fxch     st(1)
1003051c push     0x3f800000
10030521 fstp     dword ptr [0x1072dc10]
10030527 push     0x3f800000
1003052c fstp     dword ptr [0x1072dc1c]
10030532 push     0
10030534 fild     dword ptr [0x10766720]
1003053a push     0
1003053c sub      esp, 8
1003053f or       ebx, 0xffffffff
10030542 fstp     dword ptr [esp + 4]
10030546 mov      dword ptr [0x1072dc14], 0
10030550 fild     dword ptr [0x1076671c]
10030556 mov      dword ptr [0x1072dc18], 0
10030560 mov      dword ptr [0x1073055c], ecx
10030566 fstp     dword ptr [esp]
10030569 push     0
1003056b push     0
1003056d call     0x1002e850
10030572 add      esp, 0x20
10030575 call     0x1003a8d0
1003057a pop      ebx
1003057b pop      ecx
1003057c ret      

10030580/71
10030580 push     ecx
10030581 mov      eax, dword ptr [0x1072ded0]
10030586 push     esi
10030587 mov      esi, dword ptr [0x1072decc]
1003058d push     edi
1003058e xor      edi, edi
10030590 test     eax, eax
10030592 jle      0x100305b9
10030594 mov      eax, dword ptr [edi*4 + 0x1072ded4]
1003059b push     eax
1003059c mov      eax, esi
1003059e call     0x100304d0
100305a3 mov      eax, dword ptr [0x1072ded0]
100305a8 mov      ecx, 1
100305ad sub      ecx, esi
100305af add      esp, 4
100305b2 inc      edi
100305b3 cmp      edi, eax
100305b5 mov      esi, ecx
100305b7 jl       0x10030594
100305b9 pop      edi
100305ba mov      dword ptr [0x1072ded0], 0
100305c4 pop      esi
100305c5 pop      ecx
100305c6 ret      

100305d0/212
100305d0 mov      dword ptr [ecx], 0
100305d6 mov      eax, dword ptr [0x101ce6e8]
100305db fld      dword ptr [eax + 8]
100305de fcomp    dword ptr [0x1019bc84]
100305e4 fnstsw   ax
100305e6 test     ah, 0x41
100305e9 je       0x1003060d
100305eb mov      edx, dword ptr [0x101d1b9c]
100305f1 mov      eax, dword ptr [edx + 0x20]
100305f4 test     eax, eax
100305f6 je       0x10030618
100305f8 mov      eax, dword ptr [0x101ce740]
100305fd fld      dword ptr [eax + 8]
10030600 fcomp    dword ptr [0x1019bc84]
10030606 fnstsw   ax
10030608 test     ah, 0x41
1003060b jne      0x10030618
1003060d mov      edx, dword ptr [0x101ce7ac]
10030613 mov      eax, dword ptr [edx + 8]
10030616 mov      dword ptr [ecx], eax
10030618 mov      dword ptr [ecx + 4], 0
1003061f mov      edx, dword ptr [0x101ce6ec]
10030625 fld      dword ptr [edx + 8]
10030628 fcomp    dword ptr [0x1019bc84]
1003062e fnstsw   ax
10030630 test     ah, 0x41
10030633 je       0x10030657
10030635 mov      eax, dword ptr [0x101d1b9c]
1003063a mov      edx, dword ptr [eax + 0x20]
1003063d test     edx, edx
1003063f je       0x10030662
10030641 mov      edx, dword ptr [0x101ce744]
10030647 fld      dword ptr [edx + 8]
1003064a fcomp    dword ptr [0x1019bc84]
10030650 fnstsw   ax
10030652 test     ah, 0x41
10030655 jne      0x10030662
10030657 mov      eax, dword ptr [0x101ce7b0]
1003065c mov      edx, dword ptr [eax + 8]
1003065f mov      dword ptr [ecx + 4], edx
10030662 fld      dword ptr [0x1019bc84]
10030668 fld      dword ptr [ecx + 4]
1003066b fucompp  
1003066d fnstsw   ax
1003066f test     ah, 0x44
10030672 jnp      0x10030691
10030674 fld      dword ptr [0x1019bc84]
1003067a fld      dword ptr [ecx]
1003067c fucompp  
1003067e fnstsw   ax
10030680 test     ah, 0x44
10030683 jnp      0x10030694
10030685 fld      dword ptr [ecx]
10030687 fcomp    dword ptr [ecx + 4]
1003068a fnstsw   ax
1003068c test     ah, 0x41
1003068f je       0x10030694
10030691 xor      eax, eax
10030693 ret      
10030694 mov      eax, dword ptr [ecx + 4]
10030697 fld      dword ptr [ecx]
10030699 mov      dword ptr [ecx], eax
1003069b fstp     dword ptr [ecx + 4]
1003069e mov      eax, 1
100306a3 ret      

100306b0/93
100306b0 mov      eax, dword ptr [0x101ce784]
100306b5 fld      dword ptr [eax + 8]
100306b8 mov      ecx, dword ptr [0x101ce82c]
100306be fld      dword ptr [ecx + 8]
100306c1 sub      esp, 0x10
100306c4 fld      st(1)
100306c6 push     ebx
100306c7 fstp     dword ptr [0x1072dc00]
100306cd lea      ecx, [esp + 8]
100306d1 fld      dword ptr [0x1019bc78]
100306d7 mov      dword ptr [0x1072dc08], 0
100306e1 fsub     st(2)
100306e3 fdivr    dword ptr [0x1019bc78]
100306e9 fstp     dword ptr [0x1072dc04]
100306ef fstp     dword ptr [0x1072dc0c]
100306f5 fstp     st(0)
100306f7 call     0x100305d0
100306fc mov      ebx, ecx
100306fe mov      dword ptr [0x1072decc], eax
10030703 call     0x10035740
10030708 pop      ebx
10030709 add      esp, 0x10
1003070c ret      

10030710/202
10030710 sub      esp, 0x1c
10030713 push     ebx
10030714 push     0x40400000
10030719 call     dword ptr [0x101d4c0c]
1003071f fstp     dword ptr [esp + 0xc]
10030723 fld      dword ptr [esp + 0x28]
10030727 add      esp, 4
1003072a fcomp    dword ptr [esp + 8]
1003072e mov      dword ptr [esp + 0xc], 0xffffffff
10030736 fnstsw   ax
10030738 test     ah, 5
1003073b jp       0x10030775
1003073d fld      dword ptr [esp + 0x24]
10030741 fdiv     dword ptr [esp + 8]
10030745 fmul     dword ptr [0x1019bcac]
1003074b fstp     dword ptr [esp + 0x10]
1003074f fld      qword ptr [0x1019bd80]
10030755 fstp     qword ptr [esp + 0x18]
10030759 fld      dword ptr [esp + 0x10]
1003075d fadd     qword ptr [esp + 0x18]
10030761 fistp    dword ptr [esp + 0x14]
10030765 mov      al, byte ptr [esp + 0x14]
10030769 mov      ecx, dword ptr [esp + 8]
1003076d mov      byte ptr [esp + 0xf], al
10030771 mov      dword ptr [esp + 0x24], ecx
10030775 mov      edx, dword ptr [esp + 0x24]
10030779 push     edx
1003077a mov      ecx, 8
1003077f call     0x10035560
10030784 add      esp, 4
10030787 xor      eax, eax
10030789 call     0x1003ea30
1003078e fild     dword ptr [0x10766720]
10030794 mov      eax, dword ptr [0x101d48c0]
10030799 mov      ebx, dword ptr [esp + 0xc]
1003079d push     0x3f800000
100307a2 push     0x3f800000
100307a7 push     0
100307a9 push     0
100307ab sub      esp, 8
100307ae fstp     dword ptr [esp + 4]
100307b2 mov      dword ptr [0x1073055c], eax
100307b7 fild     dword ptr [0x1076671c]
100307bd mov      eax, dword ptr [0x101d1bac]
100307c2 fstp     dword ptr [esp]
100307c5 push     0
100307c7 push     0
100307c9 call     0x1002e850
100307ce add      esp, 0x20
100307d1 pop      ebx
100307d2 add      esp, 0x1c
100307d5 jmp      0x1003a8d0

100308c0/84
100308c0 push     ecx
100308c1 mov      eax, dword ptr [0x101ce754]
100308c6 mov      eax, dword ptr [eax + 8]
100308c9 cmp      eax, 1
100308cc jne      0x100308d5
100308ce call     0x10030190
100308d3 pop      ecx
100308d4 ret      
100308d5 mov      ecx, dword ptr [0x101ce708]
100308db cmp      dword ptr [ecx + 8], 2
100308df je       0x10030912
100308e1 cmp      eax, 2
100308e4 jne      0x100308ed
100308e6 call     0x1002ff80
100308eb pop      ecx
100308ec ret      
100308ed mov      edx, dword ptr [0x101ce7b8]
100308f3 mov      al, byte ptr [edx + 8]
100308f6 test     al, al
100308f8 je       0x10030901
100308fa call     0x100302b0
100308ff pop      ecx
10030900 ret      
10030901 mov      eax, dword ptr [0x101ce790]
10030906 mov      cl, byte ptr [eax + 8]
10030909 test     cl, cl
1003090b je       0x10030912
1003090d call     0x100303c0
10030912 pop      ecx
10030913 ret      

10030a40/111
10030a40 mov      eax, dword ptr [0x101ce708]
10030a45 mov      eax, dword ptr [eax + 8]
10030a48 cmp      eax, 2
10030a4b je       0x10030a71
10030a4d mov      cl, byte ptr [0x101d496d]
10030a53 test     cl, cl
10030a55 je       0x10030a71
10030a57 mov      ecx, dword ptr [0x101ce71c]
10030a5d mov      dl, byte ptr [ecx + 8]
10030a60 test     dl, dl
10030a62 je       0x10030a71
10030a64 mov      edx, dword ptr [0x101ce6d0]
10030a6a mov      cl, byte ptr [edx + 8]
10030a6d test     cl, cl
10030a6f je       0x10030aa9
10030a71 mov      ecx, dword ptr [0x101ce754]
10030a77 cmp      dword ptr [ecx + 8], 2
10030a7b je       0x10030aa9
10030a7d cmp      eax, 2
10030a80 je       0x10030aac
10030a82 mov      edx, dword ptr [0x101ce7a4]
10030a88 fld      dword ptr [edx + 8]
10030a8b fcomp    dword ptr [0x1019bc84]
10030a91 fnstsw   ax
10030a93 test     ah, 0x41
10030a96 je       0x10030aa9
10030a98 fld      dword ptr [esp + 4]
10030a9c fcomp    dword ptr [0x1019bc84]
10030aa2 fnstsw   ax
10030aa4 test     ah, 0x41
10030aa7 jne      0x10030aac
10030aa9 mov      al, 1
10030aab ret      
10030aac xor      al, al
10030aae ret      

10030ab0/172
10030ab0 cmp      dword ptr [0x10730558], 0xe
10030ab7 jne      0x10030acd
10030ab9 mov      eax, dword ptr [0x101d4848]
10030abe call     0x1002eaa0
10030ac3 mov      dword ptr [0x10730558], 2
10030acd mov      eax, dword ptr [0x101ce708]
10030ad2 cmp      dword ptr [eax + 8], 2
10030ad6 je       0x10030b0c
10030ad8 mov      al, byte ptr [0x101d496d]
10030add test     al, al
10030adf je       0x10030b0c
10030ae1 mov      ecx, dword ptr [0x101ce71c]
10030ae7 mov      al, byte ptr [ecx + 8]
10030aea test     al, al
10030aec je       0x10030b0c
10030aee mov      edx, dword ptr [0x101ce6d0]
10030af4 mov      al, byte ptr [edx + 8]
10030af7 test     al, al
10030af9 jne      0x10030b0c
10030afb call     0x100306b0
10030b00 xor      eax, eax
10030b02 call     0x1003ea30
10030b07 call     0x10030580
10030b0c mov      eax, dword ptr [0x101ce708]
10030b11 cmp      dword ptr [eax + 8], 2
10030b15 je       0x10030b5b
10030b17 mov      ecx, dword ptr [0x101ce7a4]
10030b1d fld      dword ptr [ecx + 8]
10030b20 fcomp    dword ptr [0x1019bc84]
10030b26 fnstsw   ax
10030b28 test     ah, 0x41
10030b2b je       0x10030b3e
10030b2d fld      dword ptr [esp + 4]
10030b31 fcomp    dword ptr [0x1019bc84]
10030b37 fnstsw   ax
10030b39 test     ah, 0x41
10030b3c jne      0x10030b5b
10030b3e fld      dword ptr [ecx + 8]
10030b41 push     ecx
10030b42 fld      st(0)
10030b44 fmulp    st(1)
10030b46 fld      dword ptr [esp + 8]
10030b4a fmul     dword ptr [esp + 8]
10030b4e faddp    st(1)
10030b50 fsqrt    
10030b52 fstp     dword ptr [esp]
10030b55 call     0x10030710
10030b5a pop      ecx
10030b5b ret      

10030ba0/111
10030ba0 push     ebp
10030ba1 mov      ebp, esp
10030ba3 and      esp, 0xfffffff8
10030ba6 push     ecx
10030ba7 mov      eax, dword ptr [0x1072d9d0]
10030bac test     eax, eax
10030bae push     ebx
10030baf push     esi
10030bb0 mov      esi, dword ptr [ebp + 8]
10030bb3 push     edi
10030bb4 mov      edi, dword ptr [esi]
10030bb6 jne      0x10030bc1
10030bb8 mov      eax, dword ptr [0x1072d9e0]
10030bbd test     eax, eax
10030bbf je       0x10030bc6
10030bc1 call     0x1003a8d0
10030bc6 mov      ebx, dword ptr [0x10766718]
10030bcc mov      dword ptr [0x10730558], 0xe
10030bd6 mov      eax, dword ptr [edi + 4]
10030bd9 push     eax
10030bda call     0x10030a40
10030bdf add      esp, 4
10030be2 test     al, al
10030be4 je       0x10030bf2
10030be6 mov      ecx, dword ptr [edi + 4]
10030be9 push     ecx
10030bea call     0x10030ab0
10030bef add      esp, 4
10030bf2 mov      eax, ebx
10030bf4 call     0x1003ea30
10030bf9 call     0x100308c0
10030bfe mov      eax, dword ptr [esi]
10030c00 movzx    edx, word ptr [eax + 2]
10030c04 add      edx, eax
10030c06 pop      edi
10030c07 mov      dword ptr [esi], edx
10030c09 pop      esi
10030c0a pop      ebx
10030c0b mov      esp, ebp
10030c0d pop      ebp
10030c0e ret      
