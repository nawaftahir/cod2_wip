.686
.MODEL FLAT, C
EXTRN sub_1006C6E4:PROC
EXTRN sub_1006E59D:PROC
EXTRN sub_1006E5CE:PROC
EXTRN sub_1006E5F0:PROC
EXTRN sub_1006E618:PROC
EXTRN sub_1006E64C:PROC
EXTRN sub_1006E677:PROC
EXTRN sub_1006E6A3:PROC
EXTRN sub_1006E6D7:PROC
EXTRN sub_1006E702:PROC
EXTRN sub_1006E729:PROC
EXTRN sub_1006E759:PROC
EXTRN sub_1006E783:PROC
EXTRN sub_1006E7AA:PROC
EXTRN sub_1006E7D4:PROC
EXTRN sub_1006E7FB:PROC
EXTRN sub_1006E825:PROC
EXTRN sub_1006E84C:PROC
EXTRN sub_1006E876:PROC
EXTRN sub_1006E8AA:PROC
EXTRN sub_1006E8D1:PROC
EXTRN sub_1006E8F8:PROC
EXTRN sub_1006E922:PROC
EXTRN sub_1006E94C:PROC
EXTRN sub_1006E971:PROC
EXTRN sub_1006E992:PROC
EXTRN sub_1006E9B6:PROC
EXTRN sub_1006E9D7:PROC
EXTRN sub_1006E9F8:PROC
EXTRN sub_1006EA17:PROC
EXTRN sub_1006EA39:PROC
EXTRN sub_1006EA58:PROC
EXTRN sub_1006EA80:PROC
EXTRN sub_1006EAA2:PROC
EXTRN sub_1006EABF:PROC
EXTRN sub_1006EADA:PROC
EXTRN sub_1006EAF7:PROC
EXTRN sub_1006EB14:PROC
EXTRN sub_10086199:PROC
EXTRN sub_100861B4:PROC
EXTRN sub_100861CF:PROC
EXTRN sub_100861EA:PROC
EXTRN sub_10086208:PROC
EXTRN sub_10086226:PROC
EXTRN sub_10086244:PROC
EXTRN sub_10086262:PROC
EXTRN sub_100F79A8:PROC
EXTRN sub_100F8081:PROC
EXTRN g_1010F790:DWORD
EXTRN g_1010F798:DWORD
EXTRN g_1010F868:DWORD
EXTRN g_1010F890:DWORD
EXTRN g_1010F898:DWORD
EXTRN g_1010F8A0:DWORD
EXTRN g_1010F8A8:DWORD
EXTRN g_1010F8B0:DWORD
.CODE
FUN_1006fbf4 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 000000104h
    push ebx
    push esi
    mov esi, ecx
    mov eax, dword ptr [esi + 8]
    xor ebx, ebx
    test byte ptr [eax + 109], 2
    push edi
    mov dword ptr [ebp - 28], ebx
    je L2
    mov eax, dword ptr [ebp + 24]
    and eax, 0000FFFFFh
    cmp dword ptr [ebp + 16], ebx
    push ebx
    je L0
    push dword ptr [ebp + 16]
    or eax, 020600000h
    jmp L1
L0:
    push ebx
    or eax, 010C00000h
L1:
    push dword ptr [ebp + 12]
    push dword ptr [ebp + 20]
    push eax
    jmp L11
L2:
    mov ecx, dword ptr [esi + 8]
    fld qword ptr [g_1010F8B0]
    push ecx
    push ecx
    fstp qword ptr [esp]
    push ebx
    push ebx
    push dword ptr [ecx + 120]
    call sub_10086199
    fld qword ptr [g_1010F8A8]
    mov ecx, dword ptr [esi + 8]
    push ecx
    push ecx
    fstp qword ptr [esp]
    push ebx
    push ebx
    push dword ptr [ecx + 120]
    mov dword ptr [ebp - 12], eax
    call sub_100861B4
    fld qword ptr [g_1010F8A0]
    mov ecx, dword ptr [esi + 8]
    push ecx
    push ecx
    fstp qword ptr [esp]
    push ebx
    push ebx
    push dword ptr [ecx + 120]
    mov dword ptr [ebp - 8], eax
    call sub_100861CF
    fld qword ptr [g_1010F898]
    mov ecx, dword ptr [esi + 8]
    push ecx
    push ecx
    fstp qword ptr [esp]
    push ebx
    push ebx
    push dword ptr [ecx + 120]
    mov dword ptr [ebp - 4], eax
    call sub_100861EA
    fld qword ptr [g_1010F890]
    mov ecx, dword ptr [esi + 8]
    push ecx
    push ecx
    fstp qword ptr [esp]
    push ebx
    push ebx
    push dword ptr [ecx + 120]
    mov dword ptr [ebp - 000000104h], eax
    call sub_10086208
    fld qword ptr [g_1010F868]
    mov ecx, dword ptr [esi + 8]
    push ecx
    push ecx
    fstp qword ptr [esp]
    push ebx
    push ebx
    push dword ptr [ecx + 120]
    mov dword ptr [ebp - 0000000E0h], eax
    call sub_10086226
    fld qword ptr [g_1010F798]
    mov ecx, dword ptr [esi + 8]
    push ecx
    push ecx
    fstp qword ptr [esp]
    push ebx
    push ebx
    push dword ptr [ecx + 120]
    mov dword ptr [ebp - 0000000F8h], eax
    call sub_10086244
    fld qword ptr [g_1010F790]
    mov ecx, dword ptr [esi + 8]
    push ecx
    push ecx
    fstp qword ptr [esp]
    push ebx
    push ebx
    push dword ptr [ecx + 120]
    mov dword ptr [ebp - 000000100h], eax
    call sub_10086262
    mov edi, dword ptr [ebp + 24]
    mov dword ptr [ebp - 0000000ECh], eax
    lea eax, [edi + edi*2]
    shl eax, 6
    push eax
    call sub_100F79A8
    mov edx, eax
    cmp edx, ebx
    pop ecx
    mov dword ptr [ebp - 28], edx
    jne L3
    mov edi, 08007000Eh
    jmp L12
L3:
    mov ecx, edi
    xor eax, eax
    shl ecx, 2
L4:
    mov dword ptr [ebp + eax*4 - 0000000DCh], edx
    inc eax
    add edx, ecx
    cmp eax, 48
    jb L4
    xor edx, edx
    jmp L6
L5:
    mov edi, dword ptr [ebp + 24]
L6:
    push edi
    push dword ptr [ebp + edx*4 - 0000000DCh]
    mov ecx, esi
    call sub_1006C6E4
    mov edi, eax
    cmp edi, ebx
    jl L12
    inc edx
    cmp edx, 39
    jb L5
    cmp dword ptr [ebp + 24], ebx
    jbe L9
    mov eax, dword ptr [ebp - 60]
    mov edi, dword ptr [ebp - 52]
    sub edi, eax
    mov ecx, dword ptr [ebp - 64]
    mov edx, dword ptr [ebp - 56]
    mov dword ptr [ebp - 0000000FCh], edi
    mov edi, dword ptr [ebp - 48]
    sub edi, eax
    mov dword ptr [ebp - 0000000E8h], edi
    mov edi, dword ptr [ebp - 44]
    sub edi, eax
    mov dword ptr [ebp - 0000000F0h], edi
    mov edi, dword ptr [ebp - 40]
    sub edi, eax
    mov dword ptr [ebp - 0000000E4h], edi
    mov edi, dword ptr [ebp - 36]
    sub edi, eax
    mov dword ptr [ebp - 0000000F4h], edi
    mov edi, dword ptr [ebp - 32]
    sub edx, eax
    sub ecx, eax
    sub edi, eax
    mov dword ptr [ebp - 24], edi
    mov edi, dword ptr [ebp + 24]
    mov dword ptr [ebp - 20], edx
    mov dword ptr [ebp - 16], edi
    jmp L8
L7:
    mov edx, dword ptr [ebp - 20]
L8:
    mov edi, dword ptr [ebp - 12]
    mov dword ptr [ecx + eax], edi
    mov edi, dword ptr [ebp - 8]
    mov dword ptr [eax], edi
    mov edi, dword ptr [ebp - 4]
    mov dword ptr [edx + eax], edi
    mov edx, dword ptr [ebp - 000000104h]
    mov edi, dword ptr [ebp - 0000000FCh]
    mov dword ptr [edi + eax], edx
    mov edx, dword ptr [ebp - 0000000E0h]
    mov edi, dword ptr [ebp - 0000000E8h]
    mov dword ptr [edi + eax], edx
    mov edx, dword ptr [ebp - 0000000F8h]
    mov edi, dword ptr [ebp - 0000000F0h]
    mov dword ptr [edi + eax], edx
    mov edx, dword ptr [ebp - 000000100h]
    mov edi, dword ptr [ebp - 0000000E4h]
    mov dword ptr [edi + eax], edx
    mov edx, dword ptr [ebp - 0000000ECh]
    mov edi, dword ptr [ebp - 0000000F4h]
    mov dword ptr [edi + eax], edx
    mov edx, dword ptr [esi + 32]
    mov edi, dword ptr [ebp - 24]
    mov dword ptr [edi + eax], edx
    add eax, 4
    dec dword ptr [ebp - 16]
    jne L7
L9:
    cmp dword ptr [ebp + 16], ebx
    jne L10
    mov eax, dword ptr [ebp - 32]
    mov dword ptr [ebp + 16], eax
L10:
    mov eax, dword ptr [ebp + 24]
    push ebx
    push ebx
    push dword ptr [ebp + 12]
    and eax, 0000FFFFFh
    push dword ptr [ebp - 0000000DCh]
    mov dword ptr [ebp - 12], eax
    or word ptr [ebp - 10], 000001010h
    push dword ptr [ebp - 12]
    mov ecx, esi
    push dword ptr [ebp + 8]
    mov dword ptr [ebp - 8], eax
    call sub_1006E59D
    mov edi, eax
    cmp edi, ebx
    jl L12
    mov eax, dword ptr [ebp - 8]
    push 4
    push dword ptr [ebp - 0000000DCh]
    or eax, 020100000h
    push dword ptr [ebp + 12]
    mov ecx, esi
    push dword ptr [ebp - 0000000D8h]
    mov dword ptr [ebp - 16], eax
    push eax
    push dword ptr [ebp + 8]
    call sub_1006E5CE
    mov edi, eax
    cmp edi, ebx
    jl L12
    push ebx
    push ebx
    push dword ptr [ebp + 16]
    mov ecx, esi
    push dword ptr [ebp - 0000000D4h]
    push dword ptr [ebp - 12]
    push dword ptr [ebp + 8]
    call sub_1006E5F0
    mov edi, eax
    cmp edi, ebx
    jl L12
    push 4
    push dword ptr [ebp - 0000000D4h]
    mov ecx, esi
    push dword ptr [ebp + 16]
    push dword ptr [ebp - 0000000D0h]
    push dword ptr [ebp - 16]
    push dword ptr [ebp + 8]
    call sub_1006E618
    mov edi, eax
    cmp edi, ebx
    jl L12
    mov eax, dword ptr [ebp - 8]
    push 4
    push dword ptr [ebp - 0000000D0h]
    or eax, 020000000h
    push dword ptr [ebp - 0000000D8h]
    mov ecx, esi
    push dword ptr [ebp - 0000000CCh]
    mov dword ptr [ebp - 24], eax
    push eax
    push dword ptr [ebp + 8]
    call sub_1006E64C
    mov edi, eax
    cmp edi, ebx
    jl L12
    push 4
    push dword ptr [ebp - 0000000D0h]
    mov ecx, esi
    push dword ptr [ebp - 0000000D8h]
    push dword ptr [ebp - 0000000C8h]
    push dword ptr [ebp - 16]
    push dword ptr [ebp + 8]
    call sub_1006E677
    mov edi, eax
    cmp edi, ebx
    jl L12
    mov eax, dword ptr [ebp - 8]
    push 4
    push ebx
    push dword ptr [ebp - 0000000C8h]
    or eax, 010300000h
    push dword ptr [ebp - 0000000C4h]
    mov ecx, esi
    push eax
    push dword ptr [ebp + 8]
    call sub_1006E6A3
    mov edi, eax
    cmp edi, ebx
    jl L12
    mov eax, dword ptr [ebp - 8]
    push 20
    push dword ptr [ebp - 0000000C4h]
    or eax, 020500000h
    push dword ptr [ebp - 0000000CCh]
    mov ecx, esi
    push dword ptr [ebp - 0000000C0h]
    mov dword ptr [ebp + 24], eax
    push eax
    push dword ptr [ebp + 8]
    call sub_1006E6D7
    mov edi, eax
    cmp edi, ebx
    jl L12
    push 20
    push dword ptr [ebp - 0000000C0h]
    mov ecx, esi
    push dword ptr [ebp - 0000000C0h]
    push dword ptr [ebp - 0000000BCh]
    push dword ptr [ebp + 24]
    push dword ptr [ebp + 8]
    call sub_1006E702
    mov edi, eax
    cmp edi, ebx
    jl L12
    push ebx
    push dword ptr [ebp - 64]
    mov ecx, esi
    push dword ptr [ebp - 0000000BCh]
    push dword ptr [ebp - 0000000B8h]
    push dword ptr [ebp + 24]
    push dword ptr [ebp + 8]
    call sub_1006E729
    mov edi, eax
    cmp edi, ebx
    jl L12
    mov eax, dword ptr [ebp - 8]
    push ebx
    push dword ptr [ebp - 60]
    or eax, 020400000h
    push dword ptr [ebp - 0000000B8h]
    mov ecx, esi
    push dword ptr [ebp - 0000000B4h]
    mov dword ptr [ebp - 4], eax
    push eax
    push dword ptr [ebp + 8]
    call sub_1006E759
    mov edi, eax
    cmp edi, ebx
    jl L12
    push ebx
    push dword ptr [ebp - 0000000B4h]
    mov ecx, esi
    push dword ptr [ebp - 0000000BCh]
    push dword ptr [ebp - 0000000B0h]
    push dword ptr [ebp + 24]
    push dword ptr [ebp + 8]
    call sub_1006E783
    mov edi, eax
    cmp edi, ebx
    jl L12
    push ebx
    push dword ptr [ebp - 56]
    mov ecx, esi
    push dword ptr [ebp - 0000000B0h]
    push dword ptr [ebp - 0000000ACh]
    push dword ptr [ebp - 4]
    push dword ptr [ebp + 8]
    call sub_1006E7AA
    mov edi, eax
    cmp edi, ebx
    jl L12
    push ebx
    push dword ptr [ebp - 0000000ACh]
    mov ecx, esi
    push dword ptr [ebp - 0000000BCh]
    push dword ptr [ebp - 0000000A8h]
    push dword ptr [ebp + 24]
    push dword ptr [ebp + 8]
    call sub_1006E7D4
    mov edi, eax
    cmp edi, ebx
    jl L12
    push ebx
    push dword ptr [ebp - 52]
    mov ecx, esi
    push dword ptr [ebp - 0000000A8h]
    push dword ptr [ebp - 0000000A4h]
    push dword ptr [ebp - 4]
    push dword ptr [ebp + 8]
    call sub_1006E7FB
    mov edi, eax
    cmp edi, ebx
    jl L12
    push ebx
    push dword ptr [ebp - 0000000A4h]
    mov ecx, esi
    push dword ptr [ebp - 0000000BCh]
    push dword ptr [ebp - 0000000A0h]
    push dword ptr [ebp + 24]
    push dword ptr [ebp + 8]
    call sub_1006E825
    mov edi, eax
    cmp edi, ebx
    jl L12
    push ebx
    push dword ptr [ebp - 48]
    mov ecx, esi
    push dword ptr [ebp - 0000000A0h]
    push dword ptr [ebp - 00000009Ch]
    push dword ptr [ebp - 4]
    push dword ptr [ebp + 8]
    call sub_1006E84C
    mov edi, eax
    cmp edi, ebx
    jl L12
    push ebx
    push dword ptr [ebp - 00000009Ch]
    mov ecx, esi
    push dword ptr [ebp - 0000000C0h]
    push dword ptr [ebp - 000000098h]
    push dword ptr [ebp + 24]
    push dword ptr [ebp + 8]
    call sub_1006E876
    mov edi, eax
    cmp edi, ebx
    jl L12
    mov eax, dword ptr [ebp - 8]
    push 23
    push dword ptr [ebp - 0000000D8h]
    or eax, 020200000h
    push dword ptr [ebp - 0000000D0h]
    mov ecx, esi
    push dword ptr [ebp - 000000094h]
    mov dword ptr [ebp - 20], eax
    push eax
    push dword ptr [ebp + 8]
    call sub_1006E8AA
    mov edi, eax
    cmp edi, ebx
    jl L12
    push ebx
    push dword ptr [ebp - 44]
    mov ecx, esi
    push dword ptr [ebp - 000000098h]
    push dword ptr [ebp - 000000090h]
    push dword ptr [ebp + 24]
    push dword ptr [ebp + 8]
    call sub_1006E8D1
    mov edi, eax
    cmp edi, ebx
    jl L12
    push ebx
    push dword ptr [ebp - 40]
    mov ecx, esi
    push dword ptr [ebp - 000000090h]
    push dword ptr [ebp - 00000008Ch]
    push dword ptr [ebp - 4]
    push dword ptr [ebp + 8]
    call sub_1006E8F8
    mov edi, eax
    cmp edi, ebx
    jl L12
    push ebx
    push dword ptr [ebp - 000000094h]
    mov ecx, esi
    push dword ptr [ebp - 00000008Ch]
    push dword ptr [ebp - 000000088h]
    push dword ptr [ebp + 24]
    push dword ptr [ebp + 8]
    call sub_1006E922
    mov edi, eax
    cmp edi, ebx
    jl L12
    push ebx
    push dword ptr [ebp - 000000098h]
    mov ecx, esi
    push dword ptr [ebp - 000000088h]
    push dword ptr [ebp - 000000084h]
    push dword ptr [ebp - 4]
    push dword ptr [ebp + 8]
    call sub_1006E94C
    mov edi, eax
    cmp edi, ebx
    jl L12
    push 23
    push dword ptr [ebp - 0000000D4h]
    mov ecx, esi
    push dword ptr [ebp + 16]
    push dword ptr [ebp - 116]
    push dword ptr [ebp - 20]
    push dword ptr [ebp + 8]
    call sub_1006E971
    mov edi, eax
    cmp edi, ebx
    jl L12
    push ebx
    push dword ptr [ebp - 36]
    mov ecx, esi
    push dword ptr [ebp - 116]
    push dword ptr [ebp - 112]
    push dword ptr [ebp + 24]
    push dword ptr [ebp + 8]
    call sub_1006E992
    mov edi, eax
    cmp edi, ebx
    jl L12
    push ebx
    push dword ptr [ebp - 112]
    mov ecx, esi
    push dword ptr [ebp - 000000084h]
    push dword ptr [ebp - 108]
    push dword ptr [ebp - 4]
    push dword ptr [ebp + 8]
    call sub_1006E9B6
    mov edi, eax
    cmp edi, ebx
    jl L12
    push ebx
    push dword ptr [ebp + 16]
    mov ecx, esi
    push dword ptr [ebp + 12]
    push dword ptr [ebp - 104]
    push dword ptr [ebp - 24]
    push dword ptr [ebp + 8]
    call sub_1006E9D7
    mov edi, eax
    cmp edi, ebx
    jl L12
    push ebx
    push dword ptr [ebp + 16]
    mov ecx, esi
    push dword ptr [ebp + 12]
    push dword ptr [ebp - 100]
    push dword ptr [ebp - 16]
    push dword ptr [ebp + 8]
    call sub_1006E9F8
    mov edi, eax
    cmp edi, ebx
    jl L12
    push ebx
    push ebx
    push dword ptr [ebp - 104]
    mov ecx, esi
    push dword ptr [ebp - 96]
    push dword ptr [ebp - 12]
    push dword ptr [ebp + 8]
    call sub_1006EA17
    mov edi, eax
    cmp edi, ebx
    jl L12
    push 23
    push dword ptr [ebp - 96]
    mov ecx, esi
    push dword ptr [ebp - 104]
    push dword ptr [ebp - 92]
    push dword ptr [ebp - 20]
    push dword ptr [ebp + 8]
    call sub_1006EA39
    mov edi, eax
    cmp edi, ebx
    jl L12
    push ebx
    push ebx
    push dword ptr [ebp - 100]
    mov ecx, esi
    push dword ptr [ebp - 88]
    push dword ptr [ebp - 12]
    push dword ptr [ebp + 8]
    call sub_1006EA58
    mov edi, eax
    cmp edi, ebx
    jl L12
    mov eax, dword ptr [ebp - 8]
    push 23
    push dword ptr [ebp - 88]
    or eax, 020300000h
    push dword ptr [ebp - 100]
    mov ecx, esi
    push dword ptr [ebp - 84]
    push eax
    push dword ptr [ebp + 8]
    call sub_1006EA80
    mov edi, eax
    cmp edi, ebx
    jl L12
    push 23
    push dword ptr [ebp - 84]
    mov ecx, esi
    push dword ptr [ebp - 92]
    push dword ptr [ebp - 80]
    push dword ptr [ebp + 24]
    push dword ptr [ebp + 8]
    call sub_1006EAA2
    mov edi, eax
    cmp edi, ebx
    jl L12
    push ebx
    push dword ptr [ebp - 108]
    mov ecx, esi
    push dword ptr [ebp - 108]
    push dword ptr [ebp - 76]
    push dword ptr [ebp - 4]
    push dword ptr [ebp + 8]
    call sub_1006EABF
    mov edi, eax
    cmp edi, ebx
    jl L12
    push ebx
    push ebx
    push dword ptr [ebp - 76]
    mov ecx, esi
    push dword ptr [ebp - 72]
    push dword ptr [ebp - 12]
    push dword ptr [ebp + 8]
    call sub_1006EADA
    mov edi, eax
    cmp edi, ebx
    jl L12
    push ebx
    push dword ptr [ebp - 72]
    mov ecx, esi
    push dword ptr [ebp - 80]
    push dword ptr [ebp - 68]
    push dword ptr [ebp + 24]
    push dword ptr [ebp + 8]
    call sub_1006EAF7
    mov edi, eax
    cmp edi, ebx
    jl L12
    push ebx
    push dword ptr [ebp - 68]
    mov ecx, esi
    push dword ptr [ebp - 108]
    push dword ptr [ebp + 20]
    push dword ptr [ebp - 4]
L11:
    push dword ptr [ebp + 8]
    call sub_1006EB14
    mov edi, eax
    cmp edi, ebx
    jl L12
    xor edi, edi
L12:
    push dword ptr [ebp - 28]
    call sub_100F8081
    pop ecx
    mov eax, edi
    pop edi
    pop esi
    pop ebx
    leave
    ret 20
FUN_1006fbf4 ENDP
END
