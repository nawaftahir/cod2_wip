
10032370/76
10032370 mov      al, dl
10032372 sub      al, 0x30
10032374 cmp      al, 0xa
10032376 movzx    eax, al
10032379 jb       0x10032380
1003237b mov      eax, 7
10032380 movzx    eax, al
10032383 cmp      eax, 8
10032386 jae      0x10032392
10032388 mov      eax, dword ptr [eax*4 + 0x10197f1c]
1003238f mov      dword ptr [ecx], eax
10032391 ret      
10032392 movzx    eax, dl
10032395 sub      eax, 0x38
10032398 je       0x100323b4
1003239a dec      eax
1003239b je       0x100323ab
1003239d mov      al, 0xff
1003239f mov      byte ptr [ecx + 2], al
100323a2 mov      byte ptr [ecx + 1], al
100323a5 mov      byte ptr [ecx], al
100323a7 mov      byte ptr [ecx + 3], al
100323aa ret      
100323ab mov      edx, dword ptr [0x1072dec0]
100323b1 mov      dword ptr [ecx], edx
100323b3 ret      
100323b4 mov      eax, dword ptr [0x1072dec4]
100323b9 mov      dword ptr [ecx], eax
100323bb ret      

10032400/144
10032400 push     ecx
10032401 push     edi
10032402 call     dword ptr [0x101d49d0]
10032408 cdq      
10032409 and      edx, 0xff
1003240f add      eax, edx
10032411 sar      eax, 8
10032414 test     al, 1
10032416 jne      0x1003248d
10032418 mov      eax, dword ptr [esp + 0x1c]
1003241c movzx    edi, byte ptr [esp + 0x10]
10032421 push     eax
10032422 call     0x1000bc70
10032427 mov      ecx, dword ptr [eax + 0x14]
1003242a mov      edx, dword ptr [eax + 0x10]
1003242d add      esp, 4
10032430 push     ecx
10032431 mov      ecx, dword ptr [eax + 0xc]
10032434 push     edx
10032435 mov      edx, dword ptr [eax + 8]
10032438 push     ecx
10032439 movzx    ecx, byte ptr [eax + 6]
1003243d mov      dword ptr [esp + 0x10], ecx
10032441 mov      ecx, dword ptr [esp + 0x20]
10032445 push     edx
10032446 fild     dword ptr [esp + 0x14]
1003244a movzx    edx, byte ptr [eax + 5]
1003244e fmul     dword ptr [esp + 0x34]
10032452 movsx    eax, byte ptr [eax + 3]
10032456 sub      esp, 0xc
10032459 mov      dword ptr [esp + 0x20], edx
1003245d fstp     dword ptr [esp + 8]
10032461 fild     dword ptr [esp + 0x20]
10032465 mov      dword ptr [esp + 0x20], eax
10032469 mov      eax, dword ptr [esp + 0x28]
1003246d fmul     dword ptr [esp + 0x3c]
10032471 fstp     dword ptr [esp + 4]
10032475 fild     dword ptr [esp + 0x20]
10032479 fmul     dword ptr [esp + 0x40]
1003247d fadd     dword ptr [esp + 0x34]
10032481 fstp     dword ptr [esp]
10032484 push     ecx
10032485 call     0x1002e850
1003248a add      esp, 0x20
1003248d pop      edi
1003248e pop      ecx
1003248f ret      

10032560/743
10032560 push     ebp
10032561 mov      ebp, esp
10032563 and      esp, 0xfffffff8
10032566 sub      esp, 0x2c
10032569 fld      dword ptr [ebp + 0x1c]
1003256c mov      eax, dword ptr [ebp + 0x24]
1003256f fmul     dword ptr [0x1019bcb0]
10032575 mov      edx, dword ptr [ebp + 8]
10032578 push     ebx
10032579 push     esi
1003257a fsubr    dword ptr [ebp + 0x14]
1003257d mov      ebx, eax
1003257f push     edi
10032580 mov      edi, dword ptr [ebp + 0x10]
10032583 mov      esi, dword ptr [edi + 0xc]
10032586 fstp     dword ptr [ebp + 0x14]
10032589 fld      dword ptr [ebp + 0x20]
1003258c mov      ecx, dword ptr [ebp + 0x14]
1003258f fmul     dword ptr [0x1019bcb0]
10032595 shr      ebx, 0x18
10032598 mov      dword ptr [esp + 0x10], eax
1003259c mov      al, byte ptr [edx]
1003259e fsubr    dword ptr [ebp + 0x18]
100325a1 shl      ebx, 0x18
100325a4 test     al, al
100325a6 mov      dword ptr [esp + 0x34], ebx
100325aa fstp     dword ptr [ebp + 0x18]
100325ad mov      dword ptr [esp + 0x1c], esi
100325b1 mov      dword ptr [esp + 0x24], ecx
100325b5 mov      dword ptr [esp + 0x18], 0
100325bd mov      dword ptr [esp + 0x14], 0
100325c5 je       0x1003280e
100325cb jmp      0x100325d0
100325cd lea      ecx, [ecx]
100325d0 mov      eax, dword ptr [ebp + 0xc]
100325d3 test     eax, eax
100325d5 je       0x1003280e
100325db lea      eax, [ebp + 8]
100325de push     0
100325e0 push     eax
100325e1 call     dword ptr [0x101d4aec]
100325e7 add      esp, 8
100325ea cmp      eax, 0x5e
100325ed jne      0x10032669
100325ef mov      ecx, dword ptr [ebp + 8]
100325f2 test     ecx, ecx
100325f4 je       0x10032697
100325fa mov      dl, byte ptr [ecx]
100325fc cmp      dl, al
100325fe je       0x10032697
10032604 cmp      dl, 0x30
10032607 jl       0x10032697
1003260d cmp      dl, 0x39
10032610 jg       0x10032697
10032616 mov      al, dl
10032618 sub      al, 0x30
1003261a cmp      al, 0xa
1003261c jae      0x10032625
1003261e movzx    eax, al
10032621 cmp      al, 7
10032623 jne      0x1003262e
10032625 mov      ecx, dword ptr [ebp + 0x24]
10032628 mov      dword ptr [esp + 0x10], ecx
1003262c jmp      0x10032652
1003262e lea      ecx, [esp + 0x20]
10032632 call     0x10032370
10032637 mov      eax, dword ptr [esp + 0x20]
1003263b mov      dl, byte ptr [esp + 0x22]
1003263f mov      byte ptr [esp + 0x12], al
10032643 mov      al, byte ptr [ebp + 0x27]
10032646 mov      byte ptr [esp + 0x11], ah
1003264a mov      byte ptr [esp + 0x10], dl
1003264e mov      byte ptr [esp + 0x13], al
10032652 mov      ecx, dword ptr [ebp + 8]
10032655 mov      eax, dword ptr [esp + 0x14]
10032659 inc      ecx
1003265a add      eax, 2
1003265d mov      dword ptr [ebp + 8], ecx
10032660 mov      dword ptr [esp + 0x14], eax
10032664 jmp      0x10032802
10032669 cmp      eax, 0xa
1003266c jne      0x10032686
1003266e fild     dword ptr [edi + 4]
10032671 mov      ecx, dword ptr [esp + 0x24]
10032675 mov      dword ptr [ebp + 0x14], ecx
10032678 fmul     dword ptr [ebp + 0x20]
1003267b fadd     dword ptr [ebp + 0x18]
1003267e fstp     dword ptr [ebp + 0x18]
10032681 jmp      0x10032802
10032686 cmp      eax, 0xd
10032689 jne      0x10032697
1003268b mov      edx, dword ptr [esp + 0x24]
1003268f mov      dword ptr [ebp + 0x14], edx
10032692 jmp      0x10032802
10032697 push     edi
10032698 mov      edi, eax
1003269a call     0x1000bc70
1003269f mov      edi, eax
100326a1 movsx    eax, byte ptr [edi + 2]
100326a5 movsx    ecx, byte ptr [edi + 3]
100326a9 mov      dword ptr [esp + 0x2c], eax
100326ad mov      eax, dword ptr [ebp + 0x28]
100326b0 add      esp, 4
100326b3 cmp      eax, 3
100326b6 fild     dword ptr [esp + 0x28]
100326ba mov      dword ptr [esp + 0x28], ecx
100326be fmul     dword ptr [ebp + 0x1c]
100326c1 fstp     dword ptr [esp + 0x18]
100326c5 fild     dword ptr [esp + 0x28]
100326c9 fmul     dword ptr [ebp + 0x20]
100326cc fstp     dword ptr [esp + 0x28]
100326d0 je       0x100326d7
100326d2 cmp      eax, 6
100326d5 jne      0x10032742
100326d7 mov      ecx, dword ptr [edi + 0x10]
100326da xor      edx, edx
100326dc cmp      eax, 3
100326df mov      eax, dword ptr [edi + 0x14]
100326e2 setne    dl
100326e5 push     eax
100326e6 mov      eax, dword ptr [edi + 8]
100326e9 push     ecx
100326ea movzx    ecx, byte ptr [edi + 6]
100326ee inc      edx
100326ef mov      dword ptr [esp + 0x34], edx
100326f3 mov      edx, dword ptr [edi + 0xc]
100326f6 push     edx
100326f7 fild     dword ptr [esp + 0x38]
100326fb movzx    edx, byte ptr [edi + 5]
100326ff mov      dword ptr [esp + 0x38], ecx
10032703 push     eax
10032704 sub      esp, 0x10
10032707 fild     dword ptr [esp + 0x4c]
1003270b mov      dword ptr [esp + 0x4c], edx
1003270f mov      eax, esi
10032711 fmul     dword ptr [ebp + 0x20]
10032714 fstp     dword ptr [esp + 0xc]
10032718 fild     dword ptr [esp + 0x4c]
1003271c fmul     dword ptr [ebp + 0x1c]
1003271f fstp     dword ptr [esp + 8]
10032723 fld      dword ptr [esp + 0x48]
10032727 fadd     st(1)
10032729 fadd     dword ptr [ebp + 0x18]
1003272c fstp     dword ptr [esp + 4]
10032730 fadd     dword ptr [esp + 0x38]
10032734 fadd     dword ptr [ebp + 0x14]
10032737 fstp     dword ptr [esp]
1003273a call     0x1002e850
1003273f add      esp, 0x20
10032742 mov      eax, dword ptr [edi + 0x14]
10032745 fld      dword ptr [esp + 0x18]
10032749 fadd     dword ptr [ebp + 0x14]
1003274c mov      ecx, dword ptr [edi + 0x10]
1003274f mov      edx, dword ptr [edi + 0xc]
10032752 push     eax
10032753 mov      eax, dword ptr [edi + 8]
10032756 fstp     dword ptr [esp + 0x34]
1003275a push     ecx
1003275b movzx    ecx, byte ptr [edi + 6]
1003275f mov      esi, dword ptr [esp + 0x38]
10032763 mov      ebx, dword ptr [esp + 0x18]
10032767 mov      dword ptr [esp + 0x34], ecx
1003276b push     edx
1003276c movzx    edx, byte ptr [edi + 5]
10032770 fild     dword ptr [esp + 0x38]
10032774 push     eax
10032775 fmul     dword ptr [ebp + 0x20]
10032778 mov      eax, dword ptr [esp + 0x2c]
1003277c sub      esp, 0xc
1003277f mov      dword ptr [esp + 0x48], edx
10032783 fstp     dword ptr [esp + 8]
10032787 fild     dword ptr [esp + 0x48]
1003278b fmul     dword ptr [ebp + 0x1c]
1003278e fstp     dword ptr [esp + 4]
10032792 fld      dword ptr [esp + 0x44]
10032796 fadd     dword ptr [ebp + 0x18]
10032799 fstp     dword ptr [esp]
1003279c push     esi
1003279d call     0x1002e850
100327a2 mov      eax, dword ptr [esp + 0x34]
100327a6 mov      ecx, dword ptr [ebp + 0x2c]
100327a9 add      esp, 0x20
100327ac cmp      eax, ecx
100327ae jne      0x100327d2
100327b0 mov      ecx, dword ptr [ebp + 0x20]
100327b3 mov      edx, dword ptr [ebp + 0x1c]
100327b6 mov      eax, dword ptr [ebp + 0x10]
100327b9 push     ecx
100327ba mov      ecx, dword ptr [ebp + 0x18]
100327bd push     edx
100327be mov      edx, dword ptr [ebp + 0x30]
100327c1 push     eax
100327c2 mov      eax, dword ptr [esp + 0x28]
100327c6 push     ecx
100327c7 push     esi
100327c8 push     edx
100327c9 push     eax
100327ca call     0x10032400
100327cf add      esp, 0x1c
100327d2 movzx    ecx, byte ptr [edi + 4]
100327d6 mov      eax, dword ptr [ebp + 0xc]
100327d9 mov      edi, dword ptr [ebp + 0x10]
100327dc mov      esi, dword ptr [esp + 0x1c]
100327e0 mov      ebx, dword ptr [esp + 0x34]
100327e4 mov      dword ptr [esp + 0x30], ecx
100327e8 mov      ecx, dword ptr [esp + 0x14]
100327ec inc      ecx
100327ed fild     dword ptr [esp + 0x30]
100327f1 dec      eax
100327f2 mov      dword ptr [esp + 0x14], ecx
100327f6 mov      dword ptr [ebp + 0xc], eax
100327f9 fmul     dword ptr [ebp + 0x1c]
100327fc fadd     dword ptr [ebp + 0x14]
100327ff fstp     dword ptr [ebp + 0x14]
10032802 mov      edx, dword ptr [ebp + 8]
10032805 cmp      byte ptr [edx], 0
10032808 jne      0x100325d0
1003280e mov      eax, dword ptr [esp + 0x14]
10032812 cmp      eax, dword ptr [ebp + 0x2c]
10032815 jne      0x10032840
10032817 mov      ecx, dword ptr [ebp + 0x20]
1003281a fld      dword ptr [esp + 0x18]
1003281e mov      edx, dword ptr [ebp + 0x1c]
10032821 fadd     dword ptr [ebp + 0x14]
10032824 mov      eax, dword ptr [ebp + 0x18]
10032827 mov      ebx, dword ptr [esp + 0x10]
1003282b push     ecx
1003282c push     edx
1003282d push     edi
1003282e push     eax
1003282f push     ecx
10032830 mov      ecx, dword ptr [ebp + 0x30]
10032833 fstp     dword ptr [esp]
10032836 push     ecx
10032837 push     esi
10032838 call     0x10032400
1003283d add      esp, 0x1c
10032840 pop      edi
10032841 pop      esi
10032842 pop      ebx
10032843 mov      esp, ebp
10032845 pop      ebp
10032846 ret      

10032890/440
10032890 push     ebp
10032891 mov      ebp, dword ptr [esp + 0x10]
10032895 push     esi
10032896 push     edi
10032897 mov      edi, eax
10032899 cmp      dword ptr [0x1072d9bc], edi
1003289f mov      esi, 3
100328a4 jne      0x100328ae
100328a6 cmp      dword ptr [0x1072d9c0], esi
100328ac je       0x100328cf
100328ae mov      eax, dword ptr [0x1072d9d0]
100328b3 test     eax, eax
100328b5 jne      0x100328c0
100328b7 mov      eax, dword ptr [0x1072d9e0]
100328bc test     eax, eax
100328be je       0x100328c5
100328c0 call     0x1003a8d0
100328c5 push     0x1f
100328c7 call     0x1003a5f0
100328cc add      esp, 4
100328cf mov      eax, dword ptr [0x1072d9d4]
100328d4 add      eax, 4
100328d7 cmp      eax, 0x154a
100328dc jg       0x100328ef
100328de mov      ecx, dword ptr [0x1072d9d0]
100328e4 add      ecx, 6
100328e7 cmp      ecx, 0x100000
100328ed jle      0x100328f4
100328ef call     0x1002df40
100328f4 mov      edx, dword ptr [0x1072d9d4]
100328fa mov      esi, dword ptr [0x1072d9d0]
10032900 mov      eax, edx
10032902 movzx    ecx, si
10032905 add      edx, 4
10032908 mov      dword ptr [0x1072d9d4], edx
1003290e add      esi, 6
10032911 mov      dword ptr [0x1072d9d0], esi
10032917 mov      esi, dword ptr [0x1072d9b0]
1003291d lea      edx, [eax + 3]
10032920 mov      word ptr [esi + ecx*2], dx
10032924 mov      edx, dword ptr [0x1072d9b0]
1003292a mov      word ptr [edx + ecx*2 + 2], ax
1003292f mov      esi, dword ptr [0x1072d9b0]
10032935 lea      edx, [eax + 2]
10032938 mov      word ptr [esi + ecx*2 + 4], dx
1003293d mov      esi, dword ptr [0x1072d9b0]
10032943 mov      word ptr [esi + ecx*2 + 6], dx
10032948 mov      edx, dword ptr [0x1072d9b0]
1003294e mov      word ptr [edx + ecx*2 + 8], ax
10032953 mov      esi, dword ptr [0x1072d9b0]
10032959 lea      edx, [eax + 1]
1003295c mov      word ptr [esi + ecx*2 + 0xa], dx
10032961 mov      edx, dword ptr [ebp + 0xc]
10032964 mov      ecx, dword ptr [esp + 0x1c]
10032968 movzx    esi, ax
1003296b mov      eax, dword ptr [ebp + 8]
1003296e push     edx
1003296f mov      edx, dword ptr [ebx + 4]
10032972 push     eax
10032973 mov      eax, dword ptr [ebx]
10032975 mov      dword ptr [esp + 0x20], ecx
10032979 mov      ecx, dword ptr [ebx + 8]
1003297c push     ecx
1003297d push     edx
1003297e push     eax
1003297f lea      ecx, [esp + 0x2c]
10032983 mov      eax, esi
10032985 mov      dword ptr [esp + 0x30], esi
10032989 call     0x1002e550
1003298e mov      ecx, dword ptr [ebp + 0xc]
10032991 mov      edi, dword ptr [esp + 0x24]
10032995 fld      dword ptr [ebx + 8]
10032998 mov      edx, dword ptr [ebp + 0x10]
1003299b fadd     dword ptr [edi + 8]
1003299e add      esp, 0x14
100329a1 push     ecx
100329a2 push     edx
100329a3 sub      esp, 0xc
100329a6 lea      eax, [esi + 1]
100329a9 fstp     dword ptr [esp + 8]
100329ad lea      ecx, [esp + 0x2c]
100329b1 fld      dword ptr [edi + 4]
100329b4 fadd     dword ptr [ebx + 4]
100329b7 fstp     dword ptr [esp + 4]
100329bb fld      dword ptr [ebx]
100329bd fadd     dword ptr [edi]
100329bf fstp     dword ptr [esp]
100329c2 call     0x1002e550
100329c7 fld      dword ptr [ebx + 8]
100329ca mov      eax, dword ptr [ebp + 0x14]
100329cd fadd     dword ptr [edi + 8]
100329d0 mov      esi, dword ptr [esp + 0x28]
100329d4 mov      ecx, dword ptr [ebp + 0x10]
100329d7 add      esp, 0x14
100329da fadd     dword ptr [esi + 8]
100329dd push     eax
100329de push     ecx
100329df sub      esp, 0xc
100329e2 fstp     dword ptr [esp + 8]
100329e6 lea      ecx, [esp + 0x2c]
100329ea fld      dword ptr [edi + 4]
100329ed fadd     dword ptr [ebx + 4]
100329f0 fadd     dword ptr [esi + 4]
100329f3 fstp     dword ptr [esp + 4]
100329f7 fld      dword ptr [ebx]
100329f9 fadd     dword ptr [edi]
100329fb mov      edi, dword ptr [esp + 0x30]
100329ff lea      eax, [edi + 2]
10032a02 fadd     dword ptr [esi]
10032a04 fstp     dword ptr [esp]
10032a07 call     0x1002e550
10032a0c fld      dword ptr [ebx + 8]
10032a0f fadd     dword ptr [esi + 8]
10032a12 mov      edx, dword ptr [ebp + 0x14]
10032a15 mov      eax, dword ptr [ebp + 8]
10032a18 add      esp, 0x14
10032a1b push     edx
10032a1c push     eax
10032a1d sub      esp, 0xc
10032a20 fstp     dword ptr [esp + 8]
10032a24 lea      eax, [edi + 3]
10032a27 fld      dword ptr [ebx + 4]
10032a2a lea      ecx, [esp + 0x2c]
10032a2e fadd     dword ptr [esi + 4]
10032a31 fstp     dword ptr [esp + 4]
10032a35 fld      dword ptr [ebx]
10032a37 fadd     dword ptr [esi]
10032a39 fstp     dword ptr [esp]
10032a3c call     0x1002e550
10032a41 add      esp, 0x14
10032a44 pop      edi
10032a45 pop      esi
10032a46 pop      ebp
10032a47 ret      

10032a50/442
10032a50 sub      esp, 0x38
10032a53 push     ebx
10032a54 mov      ebx, eax
10032a56 mov      eax, dword ptr [esp + 0x44]
10032a5a mov      ecx, dword ptr [eax + 0xc]
10032a5d push     ebp
10032a5e mov      ebp, dword ptr [esp + 0x4c]
10032a62 push     edi
10032a63 mov      edi, dword ptr [0x1072ddc8]
10032a69 mov      dword ptr [esp + 0x10], ecx
10032a6d call     0x1003e300
10032a72 fld      dword ptr [esi]
10032a74 fmul     dword ptr [0x1019bcb0]
10032a7a mov      edx, dword ptr [esp + 0x48]
10032a7e cmp      byte ptr [edx], 0
10032a81 fsubr    dword ptr [ebx]
10032a83 fld      dword ptr [esi + 4]
10032a86 fmul     dword ptr [0x1019bcb0]
10032a8c fsubr    dword ptr [ebx + 4]
10032a8f fld      dword ptr [esi + 8]
10032a92 fmul     dword ptr [0x1019bcb0]
10032a98 fsubr    dword ptr [ebx + 8]
10032a9b fstp     dword ptr [esp + 0x1c]
10032a9f fld      dword ptr [ebp]
10032aa2 fmul     dword ptr [0x1019bcb0]
10032aa8 fsubr    st(2)
10032aaa fstp     dword ptr [esp + 0x14]
10032aae fld      dword ptr [ebp + 4]
10032ab1 fmul     dword ptr [0x1019bcb0]
10032ab7 fsubr    st(1)
10032ab9 fstp     dword ptr [esp + 0x18]
10032abd fstp     st(0)
10032abf fstp     st(0)
10032ac1 fld      dword ptr [ebp + 8]
10032ac4 fmul     dword ptr [0x1019bcb0]
10032aca fsubr    dword ptr [esp + 0x1c]
10032ace fstp     dword ptr [esp + 0x1c]
10032ad2 je       0x10032c03
10032ad8 lea      eax, [esp + 0x48]
10032adc push     0
10032ade push     eax
10032adf call     dword ptr [0x101d4aec]
10032ae5 mov      ecx, dword ptr [esp + 0x54]
10032ae9 push     ecx
10032aea mov      edi, eax
10032aec call     0x1000bc70
10032af1 mov      edi, eax
10032af3 movsx    edx, byte ptr [edi + 2]
10032af7 movsx    eax, byte ptr [edi + 3]
10032afb mov      dword ptr [esp + 0x5c], edx
10032aff movzx    ecx, byte ptr [edi + 5]
10032b03 fild     dword ptr [esp + 0x5c]
10032b07 mov      dword ptr [esp + 0x5c], eax
10032b0b movzx    edx, byte ptr [edi + 6]
10032b0f fld      st(0)
10032b11 fmul     dword ptr [esi]
10032b13 mov      eax, dword ptr [esp + 0x60]
10032b17 add      esp, 0xc
10032b1a fadd     dword ptr [esp + 0x14]
10032b1e push     eax
10032b1f fld      st(1)
10032b21 mov      eax, dword ptr [esp + 0x14]
10032b25 fmul     dword ptr [esi + 4]
10032b28 push     edi
10032b29 lea      ebx, [esp + 0x28]
10032b2d fadd     dword ptr [esp + 0x20]
10032b31 fstp     dword ptr [esp + 0x2c]
10032b35 fxch     st(1)
10032b37 fmul     dword ptr [esi + 8]
10032b3a fadd     dword ptr [esp + 0x24]
10032b3e fstp     dword ptr [esp + 0x30]
10032b42 fild     dword ptr [esp + 0x58]
10032b46 fst      dword ptr [esp + 0x58]
10032b4a fmul     dword ptr [ebp]
10032b4d fadd     st(1)
10032b4f fstp     dword ptr [esp + 0x28]
10032b53 fstp     st(0)
10032b55 fld      dword ptr [esp + 0x58]
10032b59 fmul     dword ptr [ebp + 4]
10032b5c fadd     dword ptr [esp + 0x2c]
10032b60 fstp     dword ptr [esp + 0x2c]
10032b64 fld      dword ptr [esp + 0x58]
10032b68 mov      dword ptr [esp + 0x58], ecx
10032b6c fmul     dword ptr [ebp + 8]
10032b6f lea      ecx, [esp + 0x34]
10032b73 push     ecx
10032b74 fadd     dword ptr [esp + 0x34]
10032b78 fstp     dword ptr [esp + 0x34]
10032b7c fild     dword ptr [esp + 0x5c]
10032b80 mov      dword ptr [esp + 0x5c], edx
10032b84 lea      edx, [esp + 0x44]
10032b88 push     edx
10032b89 fld      st(0)
10032b8b fmul     dword ptr [esi]
10032b8d fstp     dword ptr [esp + 0x48]
10032b91 fld      st(0)
10032b93 fmul     dword ptr [esi + 4]
10032b96 fstp     dword ptr [esp + 0x4c]
10032b9a fmul     dword ptr [esi + 8]
10032b9d fstp     dword ptr [esp + 0x50]
10032ba1 fild     dword ptr [esp + 0x60]
10032ba5 fld      st(0)
10032ba7 fmul     dword ptr [ebp]
10032baa fstp     dword ptr [esp + 0x3c]
10032bae fld      st(0)
10032bb0 fmul     dword ptr [ebp + 4]
10032bb3 fstp     dword ptr [esp + 0x40]
10032bb7 fmul     dword ptr [ebp + 8]
10032bba fstp     dword ptr [esp + 0x44]
10032bbe call     0x10032890
10032bc3 movzx    eax, byte ptr [edi + 4]
10032bc7 mov      dword ptr [esp + 0x60], eax
10032bcb add      esp, 0x10
10032bce fild     dword ptr [esp + 0x50]
10032bd2 fld      st(0)
10032bd4 fmul     dword ptr [esi]
10032bd6 fadd     dword ptr [esp + 0x14]
10032bda fstp     dword ptr [esp + 0x14]
10032bde fld      st(0)
10032be0 fmul     dword ptr [esi + 4]
10032be3 mov      ecx, dword ptr [esp + 0x48]
10032be7 cmp      byte ptr [ecx], 0
10032bea fadd     dword ptr [esp + 0x18]
10032bee fstp     dword ptr [esp + 0x18]
10032bf2 fmul     dword ptr [esi + 8]
10032bf5 fadd     dword ptr [esp + 0x1c]
10032bf9 fstp     dword ptr [esp + 0x1c]
10032bfd jne      0x10032ad8
10032c03 pop      edi
10032c04 pop      ebp
10032c05 pop      ebx
10032c06 add      esp, 0x38
10032c09 ret      

10032c10/73
10032c10 push     esi
10032c11 mov      esi, dword ptr [esp + 8]
10032c15 mov      eax, dword ptr [esi]
10032c17 mov      edx, dword ptr [eax + 0x20]
10032c1a xor      ecx, ecx
10032c1c mov      cl, byte ptr [eax + 0x24]
10032c1f add      eax, 0x2c
10032c22 push     ecx
10032c23 mov      ecx, dword ptr [eax - 0x10]
10032c26 push     edx
10032c27 mov      edx, dword ptr [eax - 0x14]
10032c2a push     ecx
10032c2b mov      ecx, dword ptr [eax - 0x18]
10032c2e push     edx
10032c2f mov      edx, dword ptr [eax - 0x1c]
10032c32 push     ecx
10032c33 mov      ecx, dword ptr [eax - 0x24]
10032c36 push     edx
10032c37 mov      edx, dword ptr [eax - 0x28]
10032c3a push     ecx
10032c3b mov      ecx, dword ptr [eax - 0x20]
10032c3e push     edx
10032c3f mov      edx, dword ptr [eax - 4]
10032c42 push     ecx
10032c43 push     edx
10032c44 push     eax
10032c45 call     0x10032560
10032c4a mov      eax, dword ptr [esi]
10032c4c movzx    ecx, word ptr [eax + 2]
10032c50 add      ecx, eax
10032c52 add      esp, 0x2c
10032c55 mov      dword ptr [esi], ecx
10032c57 pop      esi
10032c58 ret      

10032c60/51
10032c60 push     esi
10032c61 push     edi
10032c62 mov      edi, dword ptr [esp + 0xc]
10032c66 mov      ecx, dword ptr [edi]
10032c68 mov      eax, dword ptr [ecx + 0x2c]
10032c6b push     eax
10032c6c lea      edx, [ecx + 0x20]
10032c6f push     edx
10032c70 mov      edx, dword ptr [ecx + 0x10]
10032c73 lea      esi, [ecx + 0x14]
10032c76 lea      eax, [ecx + 4]
10032c79 push     edx
10032c7a add      ecx, 0x30
10032c7d push     ecx
10032c7e call     0x10032a50
10032c83 mov      eax, dword ptr [edi]
10032c85 movzx    ecx, word ptr [eax + 2]
10032c89 add      esp, 0x10
10032c8c add      ecx, eax
10032c8e mov      dword ptr [edi], ecx
10032c90 pop      edi
10032c91 pop      esi
10032c92 ret      
