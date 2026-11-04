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
EXTRN g_1010F788:DWORD
EXTRN g_1010F790:DWORD
EXTRN g_1010F828:DWORD
EXTRN g_1010F830:DWORD
EXTRN g_1010F838:DWORD
EXTRN g_1010F840:DWORD
EXTRN g_1010F848:DWORD
EXTRN g_1010F850:DWORD
EXTRN g_1010F858:DWORD
EXTRN g_1010F860:DWORD
EXTRN g_1019BEB0:DWORD
.CODE
FUN_1006edd4 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 00000011Ch
    push ebx
    push esi
    xor eax, eax
    mov esi, ecx
    mov ecx, dword ptr [ebp + 24]
    inc eax
    xor ebx, ebx
    cmp ecx, eax
    push edi
    mov dword ptr [ebp - 24], ebx
    mov dword ptr [ebp - 8], eax
    jbe L2
    mov edi, dword ptr [ebp + 12]
    mov edx, dword ptr [edi]
L0:
    cmp dword ptr [edi + eax*4], edx
    jne L1
    inc eax
    cmp eax, ecx
    jb L0
    jmp L2
L1:
    mov dword ptr [ebp - 8], ebx
L2:
    mov eax, dword ptr [esi + 8]
    mov eax, dword ptr [eax + 108]
    test ah, 2
    je L4
    cmp dword ptr [ebp + 16], ebx
    mov edi, 0000FFFFFh
    je L3
    push 16
    push ebx
    push dword ptr [ebp + 12]
    and ecx, edi
    push dword ptr [ebp + 16]
    or ecx, 010800000h
    push ecx
    push dword ptr [ebp + 8]
    mov ecx, esi
    call sub_1006E36F
    cmp eax, ebx
    mov dword ptr [ebp - 4], eax
    jl L20
    mov ecx, dword ptr [ebp + 24]
L3:
    cmp dword ptr [ebp + 20], ebx
    je L19
    push 16
    push ebx
    push dword ptr [ebp + 12]
    and ecx, edi
    push dword ptr [ebp + 20]
    or ecx, 010900000h
    push ecx
    push dword ptr [ebp + 8]
    mov ecx, esi
    call sub_1006E3A2
    cmp eax, ebx
    mov dword ptr [ebp - 4], eax
    jl L20
    jmp L19
L4:
    test ah, 1
    je L8
    cmp dword ptr [ebp - 8], ebx
    je L8
    mov ecx, dword ptr [esi + 8]
    fld qword ptr [g_1010F860]
    push ecx
    push ecx
    fstp qword ptr [esp]
    push ebx
    push ebx
    push dword ptr [ecx + 120]
    call sub_1008620D
    fld qword ptr [g_1019BEB0]
    mov ecx, dword ptr [esi + 8]
    push ecx
    push ecx
    fstp qword ptr [esp]
    push ebx
    push ebx
    mov dword ptr [ebp - 8], eax
    push dword ptr [ecx + 120]
    call sub_10086228
    fld qword ptr [g_1010F858]
    mov ecx, dword ptr [esi + 8]
    push ecx
    push ecx
    fstp qword ptr [esp]
    push ebx
    push ebx
    mov dword ptr [ebp - 12], eax
    push dword ptr [ecx + 120]
    call sub_10086243
    fld qword ptr [g_1010F790]
    mov ecx, dword ptr [esi + 8]
    push ecx
    push ecx
    fstp qword ptr [esp]
    push ebx
    push ebx
    mov dword ptr [ebp - 20], eax
    push dword ptr [ecx + 120]
    call sub_1008625E
    mov edi, dword ptr [ebp + 12]
    mov dword ptr [ebp - 16], eax
    lea eax, [ebp - 00000010Ch]
    push eax
    push dword ptr [edi]
    mov ecx, esi
    call sub_1006CA05
    cmp eax, ebx
    mov dword ptr [ebp - 4], eax
    jl L20
    fld qword ptr [ebp - 00000010Ch]
    fcomp qword ptr [g_1010F790]
    fnstsw ax
    test ah, 5
    jnp L5
    fld qword ptr [ebp - 000000104h]
    fcomp qword ptr [g_1010F788]
    fnstsw ax
    test ah, 65
    je L5
    mov eax, dword ptr [edi]
    mov dword ptr [ebp - 28], eax
    jmp L6
L5:
    or eax, 0FFFFFFFFh
    lea edi, [ebp - 44]
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    push ebx
    stosd dword ptr es:[edi], eax
    lea eax, [ebp - 8]
    push eax
    push dword ptr [ebp + 12]
    lea eax, [ebp - 44]
    push eax
    mov edi, 020500001h
    push edi
    push dword ptr [ebp + 8]
    mov ecx, esi
    call sub_1006E4A5
    cmp eax, ebx
    mov dword ptr [ebp - 4], eax
    jl L20
    push ebx
    lea eax, [ebp - 12]
    push eax
    lea eax, [ebp - 44]
    push eax
    lea eax, [ebp - 40]
    push eax
    push 020400001h
    push dword ptr [ebp + 8]
    mov ecx, esi
    call sub_1006E4CC
    cmp eax, ebx
    mov dword ptr [ebp - 4], eax
    jl L20
    push 20
    push ebx
    lea eax, [ebp - 40]
    push eax
    lea eax, [ebp - 36]
    push eax
    push 010400001h
    push dword ptr [ebp + 8]
    mov ecx, esi
    call sub_1006E4F1
    cmp eax, ebx
    mov dword ptr [ebp - 4], eax
    jl L20
    push 4
    lea eax, [ebp - 20]
    push eax
    lea eax, [ebp - 36]
    push eax
    lea eax, [ebp - 32]
    push eax
    push edi
    push dword ptr [ebp + 8]
    mov ecx, esi
    call sub_1006E515
    cmp eax, ebx
    mov dword ptr [ebp - 4], eax
    jl L20
    push ebx
    lea eax, [ebp - 16]
    push eax
    lea eax, [ebp - 32]
    push eax
    lea eax, [ebp - 28]
    push eax
    push 020400001h
    push dword ptr [ebp + 8]
    mov ecx, esi
    call sub_1006E53C
    cmp eax, ebx
    mov dword ptr [ebp - 4], eax
    jl L20
L6:
    or eax, 0FFFFFFFFh
    lea edi, [ebp - 0000000FCh]
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    mov eax, dword ptr [ebp - 28]
    lea edi, [ebp - 00000011Ch]
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    push 16
    push ebx
    stosd dword ptr es:[edi], eax
    lea eax, [ebp - 00000011Ch]
    push eax
    lea eax, [ebp - 0000000FCh]
    push eax
    push 050300004h
    push dword ptr [ebp + 8]
    mov ecx, esi
    call sub_1006E581
    cmp eax, ebx
    mov dword ptr [ebp - 4], eax
    jl L20
    mov edi, dword ptr [ebp + 20]
    cmp edi, ebx
    je L7
    mov ecx, dword ptr [ebp + 24]
    cmp ecx, ebx
    jbe L7
    mov eax, dword ptr [ebp - 0000000FCh]
    rep stosd dword ptr es:[edi], eax
L7:
    mov edi, dword ptr [ebp + 16]
    cmp edi, ebx
    je L19
    mov ecx, dword ptr [ebp + 24]
    cmp ecx, ebx
    jbe L19
    mov eax, dword ptr [ebp - 0000000F8h]
    rep stosd dword ptr es:[edi], eax
    jmp L19
L8:
    mov edi, dword ptr [ebp + 16]
    fld qword ptr [g_1010F860]
    mov eax, dword ptr [ebp + 20]
    neg edi
    sbb edi, edi
    and edi, ecx
    neg eax
    sbb eax, eax
    and eax, ecx
    mov ecx, dword ptr [esi + 8]
    push ecx
    push ecx
    fstp qword ptr [esp]
    push ebx
    push ebx
    push dword ptr [ecx + 120]
    mov dword ptr [ebp - 0000000D0h], eax
    add eax, edi
    mov dword ptr [ebp - 8], eax
    call sub_1008642B
    fld qword ptr [g_1010F850]
    mov ecx, dword ptr [esi + 8]
    push ecx
    push ecx
    fstp qword ptr [esp]
    push ebx
    push ebx
    push dword ptr [ecx + 120]
    mov dword ptr [ebp - 12], eax
    call sub_10086446
    fld qword ptr [g_1019BEB0]
    mov ecx, dword ptr [esi + 8]
    push ecx
    push ecx
    fstp qword ptr [esp]
    push ebx
    push ebx
    push dword ptr [ecx + 120]
    mov dword ptr [ebp - 0000000ECh], eax
    call sub_10086464
    fld qword ptr [g_1010F858]
    mov ecx, dword ptr [esi + 8]
    push ecx
    push ecx
    fstp qword ptr [esp]
    push ebx
    push ebx
    push dword ptr [ecx + 120]
    mov dword ptr [ebp - 0000000E8h], eax
    call sub_10086482
    fld qword ptr [g_1010F790]
    mov ecx, dword ptr [esi + 8]
    push ecx
    push ecx
    fstp qword ptr [esp]
    push ebx
    push ebx
    push dword ptr [ecx + 120]
    mov dword ptr [ebp - 0000000D8h], eax
    call sub_100864A0
    fld qword ptr [g_1010F848]
    mov ecx, dword ptr [esi + 8]
    push ecx
    push ecx
    fstp qword ptr [esp]
    push ebx
    push ebx
    push dword ptr [ecx + 120]
    mov dword ptr [ebp - 0000000D4h], eax
    call sub_100864BE
    fld qword ptr [g_1010F840]
    mov ecx, dword ptr [esi + 8]
    push ecx
    push ecx
    fstp qword ptr [esp]
    push ebx
    push ebx
    push dword ptr [ecx + 120]
    mov dword ptr [ebp - 0000000DCh], eax
    call sub_100864DC
    mov dword ptr [ebp - 0000000E4h], eax
    mov ecx, dword ptr [esi + 8]
    fld qword ptr [g_1010F838]
    push ecx
    push ecx
    fstp qword ptr [esp]
    push ebx
    push ebx
    push dword ptr [ecx + 120]
    call sub_100864FA
    fld qword ptr [g_1010F830]
    mov ecx, dword ptr [esi + 8]
    push ecx
    push ecx
    fstp qword ptr [esp]
    push ebx
    push ebx
    push dword ptr [ecx + 120]
    mov dword ptr [ebp - 0000000E0h], eax
    call sub_10086518
    fld qword ptr [g_1010F828]
    mov ecx, dword ptr [esi + 8]
    push ecx
    push ecx
    fstp qword ptr [esp]
    push ebx
    push ebx
    push dword ptr [ecx + 120]
    mov dword ptr [ebp - 0000000A0h], eax
    call sub_10086536
    mov dword ptr [ebp - 0000000B0h], eax
    mov eax, dword ptr [ebp - 8]
    imul eax, eax, 108
    push eax
    call sub_100F7C79
    cmp eax, ebx
    pop ecx
    mov dword ptr [ebp - 24], eax
    jne L9
    mov dword ptr [ebp - 4], 08007000Eh
    jmp L20
L9:
    mov edx, dword ptr [ebp - 8]
    xor ecx, ecx
    shl edx, 2
L10:
    mov dword ptr [ebp + ecx*4 - 000000098h], eax
    inc ecx
    add eax, edx
    cmp ecx, 27
    jb L10
    xor edx, edx
L11:
    push dword ptr [ebp - 8]
    mov ecx, esi
    push dword ptr [ebp + edx*4 - 000000098h]
    call sub_1006C9B3
    cmp eax, ebx
    mov dword ptr [ebp - 4], eax
    jl L20
    inc edx
    cmp edx, 15
    jb L11
    cmp dword ptr [ebp - 8], ebx
    mov dword ptr [ebp + 24], ebx
    jbe L18
    mov eax, dword ptr [ebp - 92]
    mov ecx, edi
    shl ecx, 2
    mov edx, ecx
    mov ecx, dword ptr [ebp + 12]
    sub ecx, edx
    mov edx, dword ptr [ebp + 16]
    mov dword ptr [ebp - 4], ecx
    mov ecx, dword ptr [ebp + 20]
    sub ecx, dword ptr [ebp + 12]
    mov dword ptr [ebp - 20], ecx
    mov ecx, eax
    sub edx, ecx
    mov dword ptr [ebp - 16], edx
    mov edx, dword ptr [ebp - 88]
    sub edx, ecx
    mov dword ptr [ebp - 0000000BCh], edx
    mov edx, dword ptr [ebp - 84]
    sub edx, ecx
    mov dword ptr [ebp - 0000000A4h], edx
    mov edx, dword ptr [ebp - 80]
    sub edx, ecx
    mov dword ptr [ebp - 0000000ACh], edx
    mov edx, dword ptr [ebp - 76]
    sub edx, ecx
    mov dword ptr [ebp - 0000000B4h], edx
    mov edx, dword ptr [ebp - 72]
    sub edx, ecx
    mov dword ptr [ebp - 00000009Ch], edx
    mov edx, dword ptr [ebp - 68]
    sub edx, ecx
    mov dword ptr [ebp - 0000000C4h], edx
    mov edx, dword ptr [ebp - 64]
    sub edx, ecx
    mov dword ptr [ebp - 0000000CCh], edx
    mov edx, dword ptr [ebp - 60]
    sub edx, ecx
    mov dword ptr [ebp - 0000000A8h], edx
    mov edx, dword ptr [ebp - 56]
    sub edx, ecx
    mov dword ptr [ebp - 0000000B8h], edx
    mov edx, dword ptr [ebp - 52]
    sub edx, ecx
    mov dword ptr [ebp - 0000000C0h], edx
    mov edx, dword ptr [ebp + 12]
    sub edx, ecx
    mov dword ptr [ebp + 12], edx
    mov edx, dword ptr [ebp - 48]
    sub edx, ecx
    mov dword ptr [ebp - 0000000C8h], edx
L12:
    cmp dword ptr [ebp + 24], edi
    jae L13
    mov ecx, dword ptr [ebp - 16]
    mov ecx, dword ptr [ecx + eax]
    jmp L14
L13:
    mov ecx, dword ptr [ebp - 20]
    mov edx, dword ptr [ebp - 4]
    mov ecx, dword ptr [ecx + edx]
L14:
    cmp dword ptr [ebp + 24], edi
    mov edx, dword ptr [ebp - 0000000BCh]
    mov dword ptr [eax], ecx
    mov ecx, dword ptr [ebp - 12]
    mov dword ptr [edx + eax], ecx
    mov ecx, dword ptr [ebp - 0000000ECh]
    jb L15
    mov ecx, dword ptr [ebp - 0000000E8h]
L15:
    cmp dword ptr [ebp + 24], edi
    mov edx, dword ptr [ebp - 0000000A4h]
    mov dword ptr [edx + eax], ecx
    mov ecx, dword ptr [ebp - 0000000D8h]
    mov edx, dword ptr [ebp - 0000000ACh]
    mov dword ptr [edx + eax], ecx
    mov ecx, dword ptr [ebp - 0000000D4h]
    mov edx, dword ptr [ebp - 0000000B4h]
    mov dword ptr [edx + eax], ecx
    mov ecx, dword ptr [ebp - 0000000DCh]
    mov edx, dword ptr [ebp - 00000009Ch]
    mov dword ptr [edx + eax], ecx
    mov ecx, dword ptr [ebp - 0000000E4h]
    mov edx, dword ptr [ebp - 0000000C4h]
    mov dword ptr [edx + eax], ecx
    mov ecx, dword ptr [ebp - 0000000E0h]
    mov edx, dword ptr [ebp - 0000000CCh]
    mov dword ptr [edx + eax], ecx
    mov ecx, dword ptr [ebp - 0000000A0h]
    mov edx, dword ptr [ebp - 0000000A8h]
    mov dword ptr [edx + eax], ecx
    mov ecx, dword ptr [ebp - 0000000B0h]
    mov edx, dword ptr [ebp - 0000000B8h]
    mov dword ptr [edx + eax], ecx
    mov ecx, dword ptr [esi + 32]
    mov edx, dword ptr [ebp - 0000000C0h]
    mov dword ptr [edx + eax], ecx
    jae L16
    mov ecx, dword ptr [ebp + 12]
    mov ecx, dword ptr [ecx + eax]
    jmp L17
L16:
    mov ecx, dword ptr [ebp - 4]
    mov ecx, dword ptr [ecx]
L17:
    mov edx, dword ptr [ebp - 0000000C8h]
    inc dword ptr [ebp + 24]
    add dword ptr [ebp - 4], 4
    mov dword ptr [edx + eax], ecx
    mov ecx, dword ptr [ebp + 24]
    add eax, 4
    cmp ecx, dword ptr [ebp - 8]
    jb L12
L18:
    mov eax, dword ptr [ebp - 8]
    push ebx
    push dword ptr [ebp - 88]
    and eax, 0000FFFFFh
    push dword ptr [ebp - 48]
    mov dword ptr [ebp + 12], eax
    push dword ptr [ebp - 000000098h]
    or word ptr [ebp + 14], 000002050h
    push dword ptr [ebp + 12]
    mov ecx, esi
    push dword ptr [ebp + 8]
    mov dword ptr [ebp - 8], eax
    call sub_1006E92A
    cmp eax, ebx
    mov dword ptr [ebp - 4], eax
    jl L20
    mov eax, dword ptr [ebp - 8]
    push ebx
    push dword ptr [ebp - 84]
    or eax, 020400000h
    push dword ptr [ebp - 000000098h]
    mov ecx, esi
    push dword ptr [ebp - 000000094h]
    mov dword ptr [ebp + 24], eax
    push eax
    push dword ptr [ebp + 8]
    call sub_1006E95B
    cmp eax, ebx
    mov dword ptr [ebp - 4], eax
    jl L20
    mov eax, dword ptr [ebp - 8]
    push 20
    push ebx
    push dword ptr [ebp - 000000094h]
    or eax, 010400000h
    push dword ptr [ebp - 000000090h]
    mov ecx, esi
    push eax
    push dword ptr [ebp + 8]
    call sub_1006E988
    cmp eax, ebx
    mov dword ptr [ebp - 4], eax
    jl L20
    push 4
    push dword ptr [ebp - 80]
    mov ecx, esi
    push dword ptr [ebp - 000000090h]
    push dword ptr [ebp - 00000008Ch]
    push dword ptr [ebp + 12]
    push dword ptr [ebp + 8]
    call sub_1006E9B1
    cmp eax, ebx
    mov dword ptr [ebp - 4], eax
    jl L20
    push ebx
    push dword ptr [ebp - 76]
    mov ecx, esi
    push dword ptr [ebp - 00000008Ch]
    push dword ptr [ebp - 000000088h]
    push dword ptr [ebp + 24]
    push dword ptr [ebp + 8]
    call sub_1006E9D9
    cmp eax, ebx
    mov dword ptr [ebp - 4], eax
    jl L20
    push 4
    push dword ptr [ebp - 000000088h]
    mov ecx, esi
    push dword ptr [ebp - 000000088h]
    push dword ptr [ebp - 000000084h]
    push dword ptr [ebp + 12]
    push dword ptr [ebp + 8]
    call sub_1006EA05
    cmp eax, ebx
    mov dword ptr [ebp - 4], eax
    jl L20
    push ebx
    push dword ptr [ebp - 72]
    mov ecx, esi
    push dword ptr [ebp - 000000084h]
    push dword ptr [ebp - 000000080h]
    push dword ptr [ebp + 12]
    push dword ptr [ebp + 8]
    call sub_1006EA2A
    cmp eax, ebx
    mov dword ptr [ebp - 4], eax
    jl L20
    push ebx
    push dword ptr [ebp - 68]
    mov ecx, esi
    push dword ptr [ebp - 000000080h]
    push dword ptr [ebp - 124]
    push dword ptr [ebp + 24]
    push dword ptr [ebp + 8]
    call sub_1006EA4C
    cmp eax, ebx
    mov dword ptr [ebp - 4], eax
    jl L20
    push ebx
    push dword ptr [ebp - 124]
    mov ecx, esi
    push dword ptr [ebp - 000000084h]
    push dword ptr [ebp - 120]
    push dword ptr [ebp + 12]
    push dword ptr [ebp + 8]
    call sub_1006EA71
    cmp eax, ebx
    mov dword ptr [ebp - 4], eax
    jl L20
    push ebx
    push dword ptr [ebp - 64]
    mov ecx, esi
    push dword ptr [ebp - 120]
    push dword ptr [ebp - 116]
    push dword ptr [ebp + 24]
    push dword ptr [ebp + 8]
    call sub_1006EA93
    cmp eax, ebx
    mov dword ptr [ebp - 4], eax
    jl L20
    push ebx
    push dword ptr [ebp - 116]
    mov ecx, esi
    push dword ptr [ebp - 000000084h]
    push dword ptr [ebp - 112]
    push dword ptr [ebp + 12]
    push dword ptr [ebp + 8]
    call sub_1006EAB8
    cmp eax, ebx
    mov dword ptr [ebp - 4], eax
    jl L20
    push ebx
    push dword ptr [ebp - 60]
    mov ecx, esi
    push dword ptr [ebp - 112]
    push dword ptr [ebp - 108]
    push dword ptr [ebp + 24]
    push dword ptr [ebp + 8]
    call sub_1006EADA
    cmp eax, ebx
    mov dword ptr [ebp - 4], eax
    jl L20
    push ebx
    push dword ptr [ebp - 108]
    mov ecx, esi
    push dword ptr [ebp - 000000084h]
    push dword ptr [ebp - 104]
    push dword ptr [ebp + 12]
    push dword ptr [ebp + 8]
    call sub_1006EAFF
    cmp eax, ebx
    mov dword ptr [ebp - 4], eax
    jl L20
    push ebx
    push dword ptr [ebp - 56]
    mov ecx, esi
    push dword ptr [ebp - 104]
    push dword ptr [ebp - 100]
    push dword ptr [ebp + 24]
    push dword ptr [ebp + 8]
    call sub_1006EB21
    cmp eax, ebx
    mov dword ptr [ebp - 4], eax
    jl L20
    push ebx
    push dword ptr [ebp - 100]
    mov ecx, esi
    push dword ptr [ebp - 000000084h]
    push dword ptr [ebp - 96]
    push dword ptr [ebp + 12]
    push dword ptr [ebp + 8]
    call sub_1006EB42
    cmp eax, ebx
    mov dword ptr [ebp - 4], eax
    jl L20
    push 16
    push dword ptr [ebp - 52]
    mov ecx, esi
    push dword ptr [ebp - 96]
    push dword ptr [ebp - 92]
    push dword ptr [ebp + 24]
    push dword ptr [ebp + 8]
    call sub_1006EB61
    cmp eax, ebx
    mov dword ptr [ebp - 4], eax
    jl L20
    mov esi, dword ptr [ebp - 92]
    mov eax, edi
    mov edi, dword ptr [ebp + 16]
    shl eax, 2
    mov ecx, eax
    mov edx, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, edx
    mov edx, dword ptr [ebp - 92]
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov ecx, dword ptr [ebp - 0000000D0h]
    mov edi, dword ptr [ebp + 20]
    lea esi, [edx + eax]
    rep movsd dword ptr es:[edi], dword ptr [esi]
L19:
    mov dword ptr [ebp - 4], ebx
L20:
    push dword ptr [ebp - 24]
    call sub_100F80FC
    mov eax, dword ptr [ebp - 4]
    pop ecx
    pop edi
    pop esi
    pop ebx
    leave
    ret 20
FUN_1006edd4 ENDP
END
