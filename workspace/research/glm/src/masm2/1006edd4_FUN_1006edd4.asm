.686
.MODEL FLAT, C
EXTRN sub_1006C9B3:PROC
EXTRN sub_1006CA05:PROC
EXTRN sub_1006E36F:PROC
EXTRN sub_1006E3A2:PROC
EXTRN sub_1006E4A5:PROC
EXTRN sub_1006E4CC:PROC
EXTRN sub_1006E4F1:PROC
EXTRN sub_1006E515:PROC
EXTRN sub_1006E53C:PROC
EXTRN sub_1006E581:PROC
EXTRN sub_1006E92A:PROC
EXTRN sub_1006E95B:PROC
EXTRN sub_1006E988:PROC
EXTRN sub_1006E9B1:PROC
EXTRN sub_1006E9D9:PROC
EXTRN sub_1006EA05:PROC
EXTRN sub_1006EA2A:PROC
EXTRN sub_1006EA4C:PROC
EXTRN sub_1006EA71:PROC
EXTRN sub_1006EA93:PROC
EXTRN sub_1006EAB8:PROC
EXTRN sub_1006EADA:PROC
EXTRN sub_1006EAFF:PROC
EXTRN sub_1006EB21:PROC
EXTRN sub_1006EB42:PROC
EXTRN sub_1006EB61:PROC
EXTRN sub_1006F6D5:PROC
EXTRN sub_1006F6DE:PROC
EXTRN sub_1006F708:PROC
EXTRN sub_1006F70A:PROC
EXTRN sub_1006F7A9:PROC
EXTRN sub_1006F806:PROC
EXTRN sub_1006F80B:PROC
EXTRN sub_1006F817:PROC
EXTRN sub_1006F832:PROC
EXTRN sub_1006F857:PROC
EXTRN sub_1006F858:PROC
EXTRN sub_1006F87B:PROC
EXTRN sub_1006F8A2:PROC
EXTRN sub_1006F8D8:PROC
EXTRN sub_1006F8E7:PROC
EXTRN sub_1006F905:PROC
EXTRN sub_1006F910:PROC
EXTRN sub_1006F91D:PROC
EXTRN sub_1006F96C:PROC
EXTRN sub_1006F979:PROC
EXTRN sub_1006FA86:PROC
EXTRN sub_1006FABB:PROC
EXTRN sub_1006FC90:PROC
EXTRN sub_1006FCC1:PROC
EXTRN sub_1006FCEE:PROC
EXTRN sub_1006FD17:PROC
EXTRN sub_1006FD3F:PROC
EXTRN sub_1006FD6B:PROC
EXTRN sub_1006FD90:PROC
EXTRN sub_1006FDB2:PROC
EXTRN sub_1006FDD7:PROC
EXTRN sub_1006FDF9:PROC
EXTRN sub_1006FE1E:PROC
EXTRN sub_1006FE40:PROC
EXTRN sub_1006FE65:PROC
EXTRN sub_1006FE83:PROC
EXTRN sub_1006FEA4:PROC
EXTRN sub_1006FEC3:PROC
EXTRN sub_1008620D:PROC
EXTRN sub_10086228:PROC
EXTRN sub_10086243:PROC
EXTRN sub_1008625E:PROC
EXTRN sub_1008642B:PROC
EXTRN sub_10086446:PROC
EXTRN sub_10086464:PROC
EXTRN sub_10086482:PROC
EXTRN sub_100864A0:PROC
EXTRN sub_100864BE:PROC
EXTRN sub_100864DC:PROC
EXTRN sub_100864FA:PROC
EXTRN sub_10086518:PROC
EXTRN sub_10086536:PROC
EXTRN sub_100F7C79:PROC
EXTRN sub_100F80FC:PROC
EXTRN EXTRN g_1010F788:DWORD:DWORD
EXTRN EXTRN g_1010F790:DWORD:DWORD
EXTRN EXTRN g_1010F828:DWORD:DWORD
EXTRN EXTRN g_1010F830:DWORD:DWORD
EXTRN EXTRN g_1010F838:DWORD:DWORD
EXTRN EXTRN g_1010F840:DWORD:DWORD
EXTRN EXTRN g_1010F848:DWORD:DWORD
EXTRN EXTRN g_1010F850:DWORD:DWORD
EXTRN EXTRN g_1010F858:DWORD:DWORD
EXTRN EXTRN g_1010F860:DWORD:DWORD
EXTRN EXTRN g_1019BEB0:DWORD:DWORD
.CODE
FUN_1006edd4 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 011Ch
    push push ebx
    push push esi
    xor xor eax, eax
    mov mov esi, ecx
    mov mov ecx, dword ptr [ebp + 24]
    inc inc eax
    xor xor ebx, ebx
    cmp cmp ecx, eax
    push push edi
    mov mov dword ptr [ebp - 24], ebx
    mov mov dword ptr [ebp - 8], eax
    jbe L0
    mov mov edi, dword ptr [ebp + 12]
    mov mov edx, dword ptr [edi]
    cmp cmp dword ptr [edi + eax*4], edx
    jne L1
    inc inc eax
    cmp cmp eax, ecx
    jb L0
    jmp L2
    mov mov dword ptr [ebp - 8], ebx
    mov mov eax, dword ptr [esi + 8]
    mov mov eax, dword ptr [eax + 108]
    test test ah, 2
    je L4
    cmp cmp dword ptr [ebp + 16], ebx
    mov mov edi, 0FFFFFh
    je L3
    push push 16
    push push ebx
    push push dword ptr [ebp + 12]
    and and ecx, edi
    push push dword ptr [ebp + 16]
    or or ecx, 010800000h
    push push ecx
    push push dword ptr [ebp + 8]
    mov mov ecx, esi
    call sub_1006E36F
    cmp cmp eax, ebx
L2:
    mov mov dword ptr [ebp - 4], eax
    jl sub_1006F6D5
    mov mov ecx, dword ptr [ebp + 24]
    cmp cmp dword ptr [ebp + 20], ebx
    je sub_1006F6DE
    push push 16
    push push ebx
    push push dword ptr [ebp + 12]
    and and ecx, edi
    push push dword ptr [ebp + 20]
    or or ecx, 010900000h
    push push ecx
    push push dword ptr [ebp + 8]
    mov mov ecx, esi
    call sub_1006E3A2
    cmp cmp eax, ebx
    mov mov dword ptr [ebp - 4], eax
    jl sub_1006F708
    jmp sub_1006F70A
    test test ah, 1
    je L7
    cmp cmp dword ptr [ebp - 8], ebx
    je L8
    mov mov ecx, dword ptr [esi + 8]
    fld fld qword ptr [g_1010F860]
    push push ecx
    push push ecx
    fstp fstp qword ptr [esp]
    push push ebx
    push push ebx
    push push dword ptr [ecx + 120]
    call sub_1008620D
    fld fld qword ptr [g_1019BEB0]
    mov mov ecx, dword ptr [esi + 8]
    push push ecx
    push push ecx
    fstp fstp qword ptr [esp]
    push push ebx
    push push ebx
    mov mov dword ptr [ebp - 8], eax
    push push dword ptr [ecx + 120]
    call sub_10086228
    fld fld qword ptr [g_1010F858]
    mov mov ecx, dword ptr [esi + 8]
    push push ecx
    push push ecx
    fstp fstp qword ptr [esp]
    push push ebx
    push push ebx
    mov mov dword ptr [ebp - 12], eax
    push push dword ptr [ecx + 120]
    call sub_10086243
    fld fld qword ptr [g_1010F790]
    mov mov ecx, dword ptr [esi + 8]
    push push ecx
    push push ecx
    fstp fstp qword ptr [esp]
    push push ebx
    push push ebx
    mov mov dword ptr [ebp - 20], eax
    push push dword ptr [ecx + 120]
    call sub_1008625E
    mov mov edi, dword ptr [ebp + 12]
    mov mov dword ptr [ebp - 16], eax
    lea lea eax, [ebp - 010Ch]
    push push eax
    push push dword ptr [edi]
    mov mov ecx, esi
    call sub_1006CA05
    cmp cmp eax, ebx
    mov mov dword ptr [ebp - 4], eax
    jl sub_1006F7A9
    fld fld qword ptr [ebp - 010Ch]
    fcomp fcomp qword ptr [g_1010F790]
    fnstsw fnstsw ax
    test test ah, 5
    jnp L5
    fld fld qword ptr [ebp - 0104h]
    fcomp fcomp qword ptr [g_1010F788]
    fnstsw fnstsw ax
    test test ah, 65
    je L6
    mov mov eax, dword ptr [edi]
    mov mov dword ptr [ebp - 28], eax
    jmp L9
    or or eax, -1
    lea lea edi, [ebp - 44]
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    push push ebx
    stosd stosd dword ptr es:[edi], eax
    lea lea eax, [ebp - 8]
    push push eax
    push push dword ptr [ebp + 12]
    lea lea eax, [ebp - 44]
    push push eax
    mov mov edi, 020500001h
    push push edi
    push push dword ptr [ebp + 8]
    mov mov ecx, esi
    call sub_1006E4A5
    cmp cmp eax, ebx
    mov mov dword ptr [ebp - 4], eax
    jl sub_1006F80B
    push push ebx
    lea lea eax, [ebp - 12]
    push push eax
    lea lea eax, [ebp - 44]
    push push eax
    lea lea eax, [ebp - 40]
    push push eax
    push push 020400001h
    push push dword ptr [ebp + 8]
    mov mov ecx, esi
    call sub_1006E4CC
    cmp cmp eax, ebx
    mov mov dword ptr [ebp - 4], eax
    jl sub_1006F832
    push push 20
    push push ebx
    lea lea eax, [ebp - 40]
    push push eax
    lea lea eax, [ebp - 36]
    push push eax
    push push 010400001h
    push push dword ptr [ebp + 8]
    mov mov ecx, esi
    call sub_1006E4F1
    cmp cmp eax, ebx
    mov mov dword ptr [ebp - 4], eax
    jl sub_1006F857
    push push 4
    lea lea eax, [ebp - 20]
    push push eax
    lea lea eax, [ebp - 36]
    push push eax
    lea lea eax, [ebp - 32]
    push push eax
    push push edi
    push push dword ptr [ebp + 8]
    mov mov ecx, esi
    call sub_1006E515
    cmp cmp eax, ebx
    mov mov dword ptr [ebp - 4], eax
    jl sub_1006F87B
    push push ebx
    lea lea eax, [ebp - 16]
    push push eax
    lea lea eax, [ebp - 32]
    push push eax
    lea lea eax, [ebp - 28]
    push push eax
    push push 020400001h
    push push dword ptr [ebp + 8]
    mov mov ecx, esi
    call sub_1006E53C
    cmp cmp eax, ebx
    mov mov dword ptr [ebp - 4], eax
    jl sub_1006F8A2
    or or eax, -1
    lea lea edi, [ebp - 0FCh]
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    mov mov eax, dword ptr [ebp - 28]
    lea lea edi, [ebp - 011Ch]
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    push push 16
    push push ebx
    stosd stosd dword ptr es:[edi], eax
    lea lea eax, [ebp - 011Ch]
    push push eax
    lea lea eax, [ebp - 0FCh]
    push push eax
    push push 050300004h
    push push dword ptr [ebp + 8]
    mov mov ecx, esi
    call sub_1006E581
    cmp cmp eax, ebx
    mov mov dword ptr [ebp - 4], eax
    jl sub_1006F8E7
    mov mov edi, dword ptr [ebp + 20]
    cmp cmp edi, ebx
    je L10
    mov mov ecx, dword ptr [ebp + 24]
    cmp cmp ecx, ebx
    jbe L11
    mov mov eax, dword ptr [ebp - 0FCh]
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov edi, dword ptr [ebp + 16]
    cmp cmp edi, ebx
    je sub_1006F905
    mov mov ecx, dword ptr [ebp + 24]
    cmp cmp ecx, ebx
    jbe sub_1006F910
    mov mov eax, dword ptr [ebp - 0F8h]
    rep stosd rep stosd dword ptr es:[edi], eax
    jmp sub_1006F91D
    mov mov edi, dword ptr [ebp + 16]
    fld fld qword ptr [g_1010F860]
    mov mov eax, dword ptr [ebp + 20]
    neg neg edi
    sbb sbb edi, edi
    and and edi, ecx
L5:
    neg neg eax
    sbb sbb eax, eax
    and and eax, ecx
    mov mov ecx, dword ptr [esi + 8]
    push push ecx
    push push ecx
    fstp fstp qword ptr [esp]
    push push ebx
    push push ebx
    push push dword ptr [ecx + 120]
L6:
    mov mov dword ptr [ebp - 0D0h], eax
    add add eax, edi
    mov mov dword ptr [ebp - 8], eax
    call sub_1008642B
    fld fld qword ptr [g_1010F850]
    mov mov ecx, dword ptr [esi + 8]
    push push ecx
    push push ecx
    fstp fstp qword ptr [esp]
    push push ebx
    push push ebx
    push push dword ptr [ecx + 120]
    mov mov dword ptr [ebp - 12], eax
    call sub_10086446
    fld fld qword ptr [g_1019BEB0]
    mov mov ecx, dword ptr [esi + 8]
    push push ecx
    push push ecx
    fstp fstp qword ptr [esp]
    push push ebx
    push push ebx
    push push dword ptr [ecx + 120]
    mov mov dword ptr [ebp - 0ECh], eax
    call sub_10086464
    fld fld qword ptr [g_1010F858]
    mov mov ecx, dword ptr [esi + 8]
    push push ecx
    push push ecx
    fstp fstp qword ptr [esp]
    push push ebx
    push push ebx
    push push dword ptr [ecx + 120]
    mov mov dword ptr [ebp - 0E8h], eax
    call sub_10086482
    fld fld qword ptr [g_1010F790]
    mov mov ecx, dword ptr [esi + 8]
    push push ecx
    push push ecx
    fstp fstp qword ptr [esp]
    push push ebx
    push push ebx
    push push dword ptr [ecx + 120]
    mov mov dword ptr [ebp - 0D8h], eax
    call sub_100864A0
    fld fld qword ptr [g_1010F848]
    mov mov ecx, dword ptr [esi + 8]
L7:
    push push ecx
    push push ecx
    fstp fstp qword ptr [esp]
    push push ebx
    push push ebx
    push push dword ptr [ecx + 120]
    mov mov dword ptr [ebp - 0D4h], eax
    call sub_100864BE
    fld fld qword ptr [g_1010F840]
    mov mov ecx, dword ptr [esi + 8]
    push push ecx
    push push ecx
    fstp fstp qword ptr [esp]
    push push ebx
    push push ebx
    push push dword ptr [ecx + 120]
    mov mov dword ptr [ebp - 0DCh], eax
    call sub_100864DC
    mov mov dword ptr [ebp - 0E4h], eax
    mov mov ecx, dword ptr [esi + 8]
    fld fld qword ptr [g_1010F838]
    push push ecx
    push push ecx
    fstp fstp qword ptr [esp]
    push push ebx
    push push ebx
    push push dword ptr [ecx + 120]
    call sub_100864FA
    fld fld qword ptr [g_1010F830]
    mov mov ecx, dword ptr [esi + 8]
    push push ecx
    push push ecx
    fstp fstp qword ptr [esp]
    push push ebx
    push push ebx
    push push dword ptr [ecx + 120]
    mov mov dword ptr [ebp - 0E0h], eax
    call sub_10086518
    fld fld qword ptr [g_1010F828]
    mov mov ecx, dword ptr [esi + 8]
    push push ecx
    push push ecx
    fstp fstp qword ptr [esp]
    push push ebx
    push push ebx
    push push dword ptr [ecx + 120]
    mov mov dword ptr [ebp - 0A0h], eax
    call sub_10086536
    mov mov dword ptr [ebp - 0B0h], eax
    mov mov eax, dword ptr [ebp - 8]
    imul imul eax, eax, 108
    push push eax
    call sub_100F7C79
    cmp cmp eax, ebx
    pop pop ecx
    mov mov dword ptr [ebp - 24], eax
    jne L12
    mov mov dword ptr [ebp - 4], 08007000Eh
    jmp sub_1006FA86
    mov mov edx, dword ptr [ebp - 8]
    xor xor ecx, ecx
    shl shl edx, 2
    mov mov dword ptr [ebp + ecx*4 - 098h], eax
    inc inc ecx
    add add eax, edx
    cmp cmp ecx, 27
    jb L13
    xor xor edx, edx
    push push dword ptr [ebp - 8]
    mov mov ecx, esi
    push push dword ptr [ebp + edx*4 - 098h]
    call sub_1006C9B3
    cmp cmp eax, ebx
    mov mov dword ptr [ebp - 4], eax
    jl sub_1006FABB
    inc inc edx
    cmp cmp edx, 15
    jb L14
    cmp cmp dword ptr [ebp - 8], ebx
    mov mov dword ptr [ebp + 24], ebx
    jbe sub_1006F832
    mov mov eax, dword ptr [ebp - 92]
    mov mov ecx, edi
    shl shl ecx, 2
    mov mov edx, ecx
    mov mov ecx, dword ptr [ebp + 12]
    sub sub ecx, edx
    mov mov edx, dword ptr [ebp + 16]
    mov mov dword ptr [ebp - 4], ecx
    mov mov ecx, dword ptr [ebp + 20]
    sub sub ecx, dword ptr [ebp + 12]
    mov mov dword ptr [ebp - 20], ecx
    mov mov ecx, eax
    sub sub edx, ecx
    mov mov dword ptr [ebp - 16], edx
    mov mov edx, dword ptr [ebp - 88]
    sub sub edx, ecx
    mov mov dword ptr [ebp - 0BCh], edx
    mov mov edx, dword ptr [ebp - 84]
    sub sub edx, ecx
    mov mov dword ptr [ebp - 0A4h], edx
    mov mov edx, dword ptr [ebp - 80]
    sub sub edx, ecx
    mov mov dword ptr [ebp - 0ACh], edx
    mov mov edx, dword ptr [ebp - 76]
    sub sub edx, ecx
    mov mov dword ptr [ebp - 0B4h], edx
    mov mov edx, dword ptr [ebp - 72]
    sub sub edx, ecx
    mov mov dword ptr [ebp - 09Ch], edx
    mov mov edx, dword ptr [ebp - 68]
    sub sub edx, ecx
    mov mov dword ptr [ebp - 0C4h], edx
    mov mov edx, dword ptr [ebp - 64]
    sub sub edx, ecx
    mov mov dword ptr [ebp - 0CCh], edx
    mov mov edx, dword ptr [ebp - 60]
    sub sub edx, ecx
    mov mov dword ptr [ebp - 0A8h], edx
    mov mov edx, dword ptr [ebp - 56]
    sub sub edx, ecx
    mov mov dword ptr [ebp - 0B8h], edx
    mov mov edx, dword ptr [ebp - 52]
    sub sub edx, ecx
    mov mov dword ptr [ebp - 0C0h], edx
    mov mov edx, dword ptr [ebp + 12]
    sub sub edx, ecx
    mov mov dword ptr [ebp + 12], edx
    mov mov edx, dword ptr [ebp - 48]
    sub sub edx, ecx
    mov mov dword ptr [ebp - 0C8h], edx
    cmp cmp dword ptr [ebp + 24], edi
    jae sub_1006F806
    mov mov ecx, dword ptr [ebp - 16]
    mov mov ecx, dword ptr [ecx + eax]
    jmp sub_1006F817
    mov mov ecx, dword ptr [ebp - 20]
    mov mov edx, dword ptr [ebp - 4]
    mov mov ecx, dword ptr [ecx + edx]
    cmp cmp dword ptr [ebp + 24], edi
    mov mov edx, dword ptr [ebp - 0BCh]
    mov mov dword ptr [eax], ecx
    mov mov ecx, dword ptr [ebp - 12]
    mov mov dword ptr [edx + eax], ecx
    mov mov ecx, dword ptr [ebp - 0ECh]
    jb sub_1006F858
    mov mov ecx, dword ptr [ebp - 0E8h]
    cmp cmp dword ptr [ebp + 24], edi
    mov mov edx, dword ptr [ebp - 0A4h]
    mov mov dword ptr [edx + eax], ecx
    mov mov ecx, dword ptr [ebp - 0D8h]
    mov mov edx, dword ptr [ebp - 0ACh]
    mov mov dword ptr [edx + eax], ecx
    mov mov ecx, dword ptr [ebp - 0D4h]
    mov mov edx, dword ptr [ebp - 0B4h]
    mov mov dword ptr [edx + eax], ecx
    mov mov ecx, dword ptr [ebp - 0DCh]
    mov mov edx, dword ptr [ebp - 09Ch]
    mov mov dword ptr [edx + eax], ecx
    mov mov ecx, dword ptr [ebp - 0E4h]
    mov mov edx, dword ptr [ebp - 0C4h]
    mov mov dword ptr [edx + eax], ecx
    mov mov ecx, dword ptr [ebp - 0E0h]
    mov mov edx, dword ptr [ebp - 0CCh]
    mov mov dword ptr [edx + eax], ecx
    mov mov ecx, dword ptr [ebp - 0A0h]
    mov mov edx, dword ptr [ebp - 0A8h]
    mov mov dword ptr [edx + eax], ecx
    mov mov ecx, dword ptr [ebp - 0B0h]
    mov mov edx, dword ptr [ebp - 0B8h]
    mov mov dword ptr [edx + eax], ecx
    mov mov ecx, dword ptr [esi + 32]
    mov mov edx, dword ptr [ebp - 0C0h]
    mov mov dword ptr [edx + eax], ecx
    jae sub_1006F96C
    mov mov ecx, dword ptr [ebp + 12]
    mov mov ecx, dword ptr [ecx + eax]
    jmp sub_1006F979
    mov mov ecx, dword ptr [ebp - 4]
    mov mov ecx, dword ptr [ecx]
    mov mov edx, dword ptr [ebp - 0C8h]
    inc inc dword ptr [ebp + 24]
    add add dword ptr [ebp - 4], 4
    mov mov dword ptr [edx + eax], ecx
    mov mov ecx, dword ptr [ebp + 24]
    add add eax, 4
    cmp cmp ecx, dword ptr [ebp - 8]
    jb sub_1006F8D8
    mov mov eax, dword ptr [ebp - 8]
    push push ebx
    push push dword ptr [ebp - 88]
    and and eax, 0FFFFFh
    push push dword ptr [ebp - 48]
    mov mov dword ptr [ebp + 12], eax
    push push dword ptr [ebp - 098h]
    or or word ptr [ebp + 14], 02050h
    push push dword ptr [ebp + 12]
    mov mov ecx, esi
    push push dword ptr [ebp + 8]
    mov mov dword ptr [ebp - 8], eax
    call sub_1006E92A
    cmp cmp eax, ebx
    mov mov dword ptr [ebp - 4], eax
    jl sub_1006FC90
    mov mov eax, dword ptr [ebp - 8]
    push push ebx
    push push dword ptr [ebp - 84]
    or or eax, 020400000h
    push push dword ptr [ebp - 098h]
    mov mov ecx, esi
    push push dword ptr [ebp - 094h]
    mov mov dword ptr [ebp + 24], eax
    push push eax
    push push dword ptr [ebp + 8]
    call sub_1006E95B
    cmp cmp eax, ebx
    mov mov dword ptr [ebp - 4], eax
    jl sub_1006FCC1
    mov mov eax, dword ptr [ebp - 8]
    push push 20
    push push ebx
    push push dword ptr [ebp - 094h]
    or or eax, 010400000h
    push push dword ptr [ebp - 090h]
    mov mov ecx, esi
    push push eax
    push push dword ptr [ebp + 8]
    call sub_1006E988
    cmp cmp eax, ebx
    mov mov dword ptr [ebp - 4], eax
    jl sub_1006FCEE
    push push 4
    push push dword ptr [ebp - 80]
    mov mov ecx, esi
    push push dword ptr [ebp - 090h]
    push push dword ptr [ebp - 08Ch]
    push push dword ptr [ebp + 12]
    push push dword ptr [ebp + 8]
    call sub_1006E9B1
    cmp cmp eax, ebx
    mov mov dword ptr [ebp - 4], eax
    jl sub_1006FD17
    push push ebx
    push push dword ptr [ebp - 76]
    mov mov ecx, esi
    push push dword ptr [ebp - 08Ch]
    push push dword ptr [ebp - 088h]
    push push dword ptr [ebp + 24]
    push push dword ptr [ebp + 8]
    call sub_1006E9D9
    cmp cmp eax, ebx
    mov mov dword ptr [ebp - 4], eax
    jl sub_1006FD3F
    push push 4
    push push dword ptr [ebp - 088h]
    mov mov ecx, esi
    push push dword ptr [ebp - 088h]
    push push dword ptr [ebp - 084h]
    push push dword ptr [ebp + 12]
    push push dword ptr [ebp + 8]
    call sub_1006EA05
    cmp cmp eax, ebx
    mov mov dword ptr [ebp - 4], eax
    jl sub_1006FD6B
    push push ebx
    push push dword ptr [ebp - 72]
    mov mov ecx, esi
    push push dword ptr [ebp - 084h]
    push push dword ptr [ebp - 080h]
    push push dword ptr [ebp + 12]
    push push dword ptr [ebp + 8]
    call sub_1006EA2A
    cmp cmp eax, ebx
    mov mov dword ptr [ebp - 4], eax
    jl sub_1006FD90
    push push ebx
    push push dword ptr [ebp - 68]
    mov mov ecx, esi
    push push dword ptr [ebp - 080h]
    push push dword ptr [ebp - 124]
    push push dword ptr [ebp + 24]
    push push dword ptr [ebp + 8]
    call sub_1006EA4C
    cmp cmp eax, ebx
    mov mov dword ptr [ebp - 4], eax
    jl sub_1006FDB2
    push push ebx
    push push dword ptr [ebp - 124]
    mov mov ecx, esi
    push push dword ptr [ebp - 084h]
    push push dword ptr [ebp - 120]
    push push dword ptr [ebp + 12]
    push push dword ptr [ebp + 8]
    call sub_1006EA71
    cmp cmp eax, ebx
    mov mov dword ptr [ebp - 4], eax
    jl sub_1006FDD7
    push push ebx
    push push dword ptr [ebp - 64]
    mov mov ecx, esi
    push push dword ptr [ebp - 120]
    push push dword ptr [ebp - 116]
    push push dword ptr [ebp + 24]
    push push dword ptr [ebp + 8]
    call sub_1006EA93
    cmp cmp eax, ebx
    mov mov dword ptr [ebp - 4], eax
    jl sub_1006FDF9
    push push ebx
    push push dword ptr [ebp - 116]
    mov mov ecx, esi
    push push dword ptr [ebp - 084h]
    push push dword ptr [ebp - 112]
    push push dword ptr [ebp + 12]
    push push dword ptr [ebp + 8]
    call sub_1006EAB8
    cmp cmp eax, ebx
    mov mov dword ptr [ebp - 4], eax
    jl sub_1006FE1E
    push push ebx
    push push dword ptr [ebp - 60]
    mov mov ecx, esi
    push push dword ptr [ebp - 112]
    push push dword ptr [ebp - 108]
    push push dword ptr [ebp + 24]
    push push dword ptr [ebp + 8]
    call sub_1006EADA
    cmp cmp eax, ebx
    mov mov dword ptr [ebp - 4], eax
    jl sub_1006FE40
    push push ebx
    push push dword ptr [ebp - 108]
    mov mov ecx, esi
    push push dword ptr [ebp - 084h]
    push push dword ptr [ebp - 104]
    push push dword ptr [ebp + 12]
    push push dword ptr [ebp + 8]
    call sub_1006EAFF
    cmp cmp eax, ebx
    mov mov dword ptr [ebp - 4], eax
    jl sub_1006FE65
    push push ebx
    push push dword ptr [ebp - 56]
    mov mov ecx, esi
    push push dword ptr [ebp - 104]
    push push dword ptr [ebp - 100]
    push push dword ptr [ebp + 24]
    push push dword ptr [ebp + 8]
    call sub_1006EB21
    cmp cmp eax, ebx
    mov mov dword ptr [ebp - 4], eax
    jl sub_1006FE83
    push push ebx
    push push dword ptr [ebp - 100]
    mov mov ecx, esi
    push push dword ptr [ebp - 084h]
    push push dword ptr [ebp - 96]
    push push dword ptr [ebp + 12]
    push push dword ptr [ebp + 8]
    call sub_1006EB42
L12:
    cmp cmp eax, ebx
    mov mov dword ptr [ebp - 4], eax
    jl sub_1006FEA4
    push push 16
    push push dword ptr [ebp - 52]
    mov mov ecx, esi
    push push dword ptr [ebp - 96]
    push push dword ptr [ebp - 92]
    push push dword ptr [ebp + 24]
    push push dword ptr [ebp + 8]
    call sub_1006EB61
    cmp cmp eax, ebx
    mov mov dword ptr [ebp - 4], eax
    jl sub_1006FEC3
    mov mov esi, dword ptr [ebp - 92]
    mov mov eax, edi
L13:
    mov mov edi, dword ptr [ebp + 16]
    shl shl eax, 2
    mov mov ecx, eax
    mov mov edx, ecx
    shr shr ecx, 2
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, edx
    mov mov edx, dword ptr [ebp - 92]
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov ecx, dword ptr [ebp - 0D0h]
    mov mov edi, dword ptr [ebp + 20]
    lea lea esi, [edx + eax]
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov dword ptr [ebp - 4], ebx
    push push dword ptr [ebp - 24]
    call sub_100F80FC
    mov mov eax, dword ptr [ebp - 4]
L14:
    pop pop ecx
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 20
FUN_1006edd4 ENDP
END
