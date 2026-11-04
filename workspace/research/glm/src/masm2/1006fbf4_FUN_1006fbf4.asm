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
EXTRN sub_10070440:PROC
EXTRN sub_1007055A:PROC
EXTRN sub_10070590:PROC
EXTRN sub_100706A7:PROC
EXTRN sub_100706D8:PROC
EXTRN sub_100706FA:PROC
EXTRN sub_10070722:PROC
EXTRN sub_10070756:PROC
EXTRN sub_10070781:PROC
EXTRN sub_100707AD:PROC
EXTRN sub_100707E1:PROC
EXTRN sub_1007080C:PROC
EXTRN sub_10070833:PROC
EXTRN sub_10070863:PROC
EXTRN sub_1007088D:PROC
EXTRN sub_100708B4:PROC
EXTRN sub_100708DE:PROC
EXTRN sub_10070905:PROC
EXTRN sub_1007092F:PROC
EXTRN sub_10070956:PROC
EXTRN sub_10070980:PROC
EXTRN sub_100709B4:PROC
EXTRN sub_100709DB:PROC
EXTRN sub_10070A02:PROC
EXTRN sub_10070A2C:PROC
EXTRN sub_10070A56:PROC
EXTRN sub_10070A7B:PROC
EXTRN sub_10070A9C:PROC
EXTRN sub_10070AC0:PROC
EXTRN sub_10070AE1:PROC
EXTRN sub_10070B02:PROC
EXTRN sub_10070B21:PROC
EXTRN sub_10070B43:PROC
EXTRN sub_10070B62:PROC
EXTRN sub_10070B8A:PROC
EXTRN sub_10070BA8:PROC
EXTRN sub_10070BC5:PROC
EXTRN sub_10070BE0:PROC
EXTRN sub_10070BFD:PROC
EXTRN sub_10070C1A:PROC
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
EXTRN EXTRN g_1010F790:DWORD:DWORD
EXTRN EXTRN g_1010F798:DWORD:DWORD
EXTRN EXTRN g_1010F868:DWORD:DWORD
EXTRN EXTRN g_1010F890:DWORD:DWORD
EXTRN EXTRN g_1010F898:DWORD:DWORD
EXTRN EXTRN g_1010F8A0:DWORD:DWORD
EXTRN EXTRN g_1010F8A8:DWORD:DWORD
EXTRN EXTRN g_1010F8B0:DWORD:DWORD
.CODE
FUN_1006fbf4 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 0104h
    push push ebx
    push push esi
    mov mov esi, ecx
    mov mov eax, dword ptr [esi + 8]
    xor xor ebx, ebx
    test test byte ptr [eax + 109], 2
    push push edi
    mov mov dword ptr [ebp - 28], ebx
    je L1
    mov mov eax, dword ptr [ebp + 24]
    and and eax, 0FFFFFh
    cmp cmp dword ptr [ebp + 16], ebx
    push push ebx
    je L0
    push push dword ptr [ebp + 16]
    or or eax, 020600000h
    jmp L2
    push push ebx
    or or eax, 010C00000h
    push push dword ptr [ebp + 12]
    push push dword ptr [ebp + 20]
    push push eax
    jmp sub_10070440
    mov mov ecx, dword ptr [esi + 8]
    fld fld qword ptr [g_1010F8B0]
    push push ecx
    push push ecx
    fstp fstp qword ptr [esp]
    push push ebx
    push push ebx
    push push dword ptr [ecx + 120]
    call sub_10086199
    fld fld qword ptr [g_1010F8A8]
L1:
    mov mov ecx, dword ptr [esi + 8]
    push push ecx
    push push ecx
    fstp fstp qword ptr [esp]
    push push ebx
    push push ebx
    push push dword ptr [ecx + 120]
    mov mov dword ptr [ebp - 12], eax
    call sub_100861B4
    fld fld qword ptr [g_1010F8A0]
    mov mov ecx, dword ptr [esi + 8]
    push push ecx
    push push ecx
    fstp fstp qword ptr [esp]
    push push ebx
    push push ebx
    push push dword ptr [ecx + 120]
    mov mov dword ptr [ebp - 8], eax
    call sub_100861CF
    fld fld qword ptr [g_1010F898]
    mov mov ecx, dword ptr [esi + 8]
    push push ecx
    push push ecx
    fstp fstp qword ptr [esp]
    push push ebx
    push push ebx
    push push dword ptr [ecx + 120]
    mov mov dword ptr [ebp - 4], eax
    call sub_100861EA
    fld fld qword ptr [g_1010F890]
    mov mov ecx, dword ptr [esi + 8]
    push push ecx
    push push ecx
    fstp fstp qword ptr [esp]
    push push ebx
    push push ebx
    push push dword ptr [ecx + 120]
    mov mov dword ptr [ebp - 0104h], eax
    call sub_10086208
    fld fld qword ptr [g_1010F868]
    mov mov ecx, dword ptr [esi + 8]
    push push ecx
    push push ecx
    fstp fstp qword ptr [esp]
    push push ebx
    push push ebx
    push push dword ptr [ecx + 120]
    mov mov dword ptr [ebp - 0E0h], eax
    call sub_10086226
    fld fld qword ptr [g_1010F798]
    mov mov ecx, dword ptr [esi + 8]
    push push ecx
    push push ecx
    fstp fstp qword ptr [esp]
    push push ebx
    push push ebx
    push push dword ptr [ecx + 120]
    mov mov dword ptr [ebp - 0F8h], eax
    call sub_10086244
    fld fld qword ptr [g_1010F790]
    mov mov ecx, dword ptr [esi + 8]
    push push ecx
    push push ecx
    fstp fstp qword ptr [esp]
    push push ebx
    push push ebx
    push push dword ptr [ecx + 120]
    mov mov dword ptr [ebp - 0100h], eax
    call sub_10086262
    mov mov edi, dword ptr [ebp + 24]
    mov mov dword ptr [ebp - 0ECh], eax
    lea lea eax, [edi + edi*2]
    shl shl eax, 6
    push push eax
    call sub_100F79A8
    mov mov edx, eax
    cmp cmp edx, ebx
    pop pop ecx
    mov mov dword ptr [ebp - 28], edx
    jne L3
    mov mov edi, 08007000Eh
    jmp sub_1007055A
    mov mov ecx, edi
    xor xor eax, eax
    shl shl ecx, 2
    mov mov dword ptr [ebp + eax*4 - 0DCh], edx
    inc inc eax
    add add edx, ecx
    cmp cmp eax, 48
    jb L4
    xor xor edx, edx
    jmp L5
    mov mov edi, dword ptr [ebp + 24]
    push push edi
    push push dword ptr [ebp + edx*4 - 0DCh]
    mov mov ecx, esi
    call sub_1006C6E4
    mov mov edi, eax
    cmp cmp edi, ebx
    jl sub_10070590
    inc inc edx
    cmp cmp edx, 39
    jb L6
    cmp cmp dword ptr [ebp + 24], ebx
    jbe L8
    mov mov eax, dword ptr [ebp - 60]
    mov mov edi, dword ptr [ebp - 52]
    sub sub edi, eax
    mov mov ecx, dword ptr [ebp - 64]
    mov mov edx, dword ptr [ebp - 56]
    mov mov dword ptr [ebp - 0FCh], edi
    mov mov edi, dword ptr [ebp - 48]
    sub sub edi, eax
    mov mov dword ptr [ebp - 0E8h], edi
    mov mov edi, dword ptr [ebp - 44]
    sub sub edi, eax
    mov mov dword ptr [ebp - 0F0h], edi
    mov mov edi, dword ptr [ebp - 40]
    sub sub edi, eax
    mov mov dword ptr [ebp - 0E4h], edi
    mov mov edi, dword ptr [ebp - 36]
    sub sub edi, eax
    mov mov dword ptr [ebp - 0F4h], edi
    mov mov edi, dword ptr [ebp - 32]
    sub sub edx, eax
    sub sub ecx, eax
    sub sub edi, eax
    mov mov dword ptr [ebp - 24], edi
    mov mov edi, dword ptr [ebp + 24]
    mov mov dword ptr [ebp - 20], edx
    mov mov dword ptr [ebp - 16], edi
    jmp L7
    mov mov edx, dword ptr [ebp - 20]
    mov mov edi, dword ptr [ebp - 12]
    mov mov dword ptr [ecx + eax], edi
    mov mov edi, dword ptr [ebp - 8]
    mov mov dword ptr [eax], edi
    mov mov edi, dword ptr [ebp - 4]
    mov mov dword ptr [edx + eax], edi
    mov mov edx, dword ptr [ebp - 0104h]
    mov mov edi, dword ptr [ebp - 0FCh]
    mov mov dword ptr [edi + eax], edx
    mov mov edx, dword ptr [ebp - 0E0h]
    mov mov edi, dword ptr [ebp - 0E8h]
    mov mov dword ptr [edi + eax], edx
    mov mov edx, dword ptr [ebp - 0F8h]
    mov mov edi, dword ptr [ebp - 0F0h]
    mov mov dword ptr [edi + eax], edx
    mov mov edx, dword ptr [ebp - 0100h]
    mov mov edi, dword ptr [ebp - 0E4h]
    mov mov dword ptr [edi + eax], edx
    mov mov edx, dword ptr [ebp - 0ECh]
    mov mov edi, dword ptr [ebp - 0F4h]
    mov mov dword ptr [edi + eax], edx
    mov mov edx, dword ptr [esi + 32]
    mov mov edi, dword ptr [ebp - 24]
    mov mov dword ptr [edi + eax], edx
    add add eax, 4
    dec dec dword ptr [ebp - 16]
    jne L9
    cmp cmp dword ptr [ebp + 16], ebx
    jne L10
    mov mov eax, dword ptr [ebp - 32]
    mov mov dword ptr [ebp + 16], eax
    mov mov eax, dword ptr [ebp + 24]
    push push ebx
    push push ebx
    push push dword ptr [ebp + 12]
    and and eax, 0FFFFFh
    push push dword ptr [ebp - 0DCh]
    mov mov dword ptr [ebp - 12], eax
    or or word ptr [ebp - 10], 01010h
    push push dword ptr [ebp - 12]
    mov mov ecx, esi
    push push dword ptr [ebp + 8]
    mov mov dword ptr [ebp - 8], eax
    call sub_1006E59D
    mov mov edi, eax
    cmp cmp edi, ebx
    jl sub_100706A7
    mov mov eax, dword ptr [ebp - 8]
    push push 4
    push push dword ptr [ebp - 0DCh]
    or or eax, 020100000h
    push push dword ptr [ebp + 12]
    mov mov ecx, esi
    push push dword ptr [ebp - 0D8h]
    mov mov dword ptr [ebp - 16], eax
    push push eax
    push push dword ptr [ebp + 8]
L4:
    call sub_1006E5CE
    mov mov edi, eax
    cmp cmp edi, ebx
    jl sub_100706D8
    push push ebx
    push push ebx
    push push dword ptr [ebp + 16]
    mov mov ecx, esi
    push push dword ptr [ebp - 0D4h]
    push push dword ptr [ebp - 12]
    push push dword ptr [ebp + 8]
    call sub_1006E5F0
    mov mov edi, eax
    cmp cmp edi, ebx
    jl sub_100706FA
    push push 4
    push push dword ptr [ebp - 0D4h]
L6:
    mov mov ecx, esi
    push push dword ptr [ebp + 16]
    push push dword ptr [ebp - 0D0h]
    push push dword ptr [ebp - 16]
    push push dword ptr [ebp + 8]
    call sub_1006E618
    mov mov edi, eax
    cmp cmp edi, ebx
    jl sub_10070722
    mov mov eax, dword ptr [ebp - 8]
    push push 4
    push push dword ptr [ebp - 0D0h]
    or or eax, 020000000h
    push push dword ptr [ebp - 0D8h]
    mov mov ecx, esi
    push push dword ptr [ebp - 0CCh]
    mov mov dword ptr [ebp - 24], eax
    push push eax
    push push dword ptr [ebp + 8]
    call sub_1006E64C
    mov mov edi, eax
    cmp cmp edi, ebx
    jl sub_10070756
    push push 4
    push push dword ptr [ebp - 0D0h]
    mov mov ecx, esi
    push push dword ptr [ebp - 0D8h]
    push push dword ptr [ebp - 0C8h]
    push push dword ptr [ebp - 16]
    push push dword ptr [ebp + 8]
    call sub_1006E677
    mov mov edi, eax
    cmp cmp edi, ebx
    jl sub_10070781
    mov mov eax, dword ptr [ebp - 8]
    push push 4
    push push ebx
    push push dword ptr [ebp - 0C8h]
    or or eax, 010300000h
    push push dword ptr [ebp - 0C4h]
    mov mov ecx, esi
    push push eax
    push push dword ptr [ebp + 8]
    call sub_1006E6A3
    mov mov edi, eax
    cmp cmp edi, ebx
    jl sub_100707AD
    mov mov eax, dword ptr [ebp - 8]
    push push 20
    push push dword ptr [ebp - 0C4h]
    or or eax, 020500000h
    push push dword ptr [ebp - 0CCh]
    mov mov ecx, esi
    push push dword ptr [ebp - 0C0h]
    mov mov dword ptr [ebp + 24], eax
    push push eax
    push push dword ptr [ebp + 8]
    call sub_1006E6D7
    mov mov edi, eax
    cmp cmp edi, ebx
    jl sub_100707E1
    push push 20
    push push dword ptr [ebp - 0C0h]
    mov mov ecx, esi
    push push dword ptr [ebp - 0C0h]
    push push dword ptr [ebp - 0BCh]
    push push dword ptr [ebp + 24]
    push push dword ptr [ebp + 8]
L8:
    call sub_1006E702
    mov mov edi, eax
    cmp cmp edi, ebx
    jl sub_1007080C
    push push ebx
    push push dword ptr [ebp - 64]
    mov mov ecx, esi
    push push dword ptr [ebp - 0BCh]
    push push dword ptr [ebp - 0B8h]
    push push dword ptr [ebp + 24]
    push push dword ptr [ebp + 8]
    call sub_1006E729
    mov mov edi, eax
    cmp cmp edi, ebx
    jl sub_10070833
    mov mov eax, dword ptr [ebp - 8]
    push push ebx
    push push dword ptr [ebp - 60]
    or or eax, 020400000h
    push push dword ptr [ebp - 0B8h]
    mov mov ecx, esi
    push push dword ptr [ebp - 0B4h]
    mov mov dword ptr [ebp - 4], eax
    push push eax
    push push dword ptr [ebp + 8]
L9:
    call sub_1006E759
    mov mov edi, eax
    cmp cmp edi, ebx
    jl sub_10070863
    push push ebx
    push push dword ptr [ebp - 0B4h]
    mov mov ecx, esi
    push push dword ptr [ebp - 0BCh]
    push push dword ptr [ebp - 0B0h]
    push push dword ptr [ebp + 24]
    push push dword ptr [ebp + 8]
    call sub_1006E783
    mov mov edi, eax
    cmp cmp edi, ebx
    jl sub_1007088D
    push push ebx
    push push dword ptr [ebp - 56]
    mov mov ecx, esi
    push push dword ptr [ebp - 0B0h]
    push push dword ptr [ebp - 0ACh]
    push push dword ptr [ebp - 4]
    push push dword ptr [ebp + 8]
    call sub_1006E7AA
    mov mov edi, eax
    cmp cmp edi, ebx
    jl sub_100708B4
    push push ebx
    push push dword ptr [ebp - 0ACh]
    mov mov ecx, esi
    push push dword ptr [ebp - 0BCh]
    push push dword ptr [ebp - 0A8h]
    push push dword ptr [ebp + 24]
    push push dword ptr [ebp + 8]
    call sub_1006E7D4
L10:
    mov mov edi, eax
    cmp cmp edi, ebx
    jl sub_100708DE
    push push ebx
    push push dword ptr [ebp - 52]
    mov mov ecx, esi
    push push dword ptr [ebp - 0A8h]
    push push dword ptr [ebp - 0A4h]
    push push dword ptr [ebp - 4]
    push push dword ptr [ebp + 8]
    call sub_1006E7FB
    mov mov edi, eax
    cmp cmp edi, ebx
    jl sub_10070905
    push push ebx
    push push dword ptr [ebp - 0A4h]
    mov mov ecx, esi
    push push dword ptr [ebp - 0BCh]
    push push dword ptr [ebp - 0A0h]
    push push dword ptr [ebp + 24]
    push push dword ptr [ebp + 8]
    call sub_1006E825
    mov mov edi, eax
    cmp cmp edi, ebx
    jl sub_1007092F
    push push ebx
    push push dword ptr [ebp - 48]
    mov mov ecx, esi
    push push dword ptr [ebp - 0A0h]
    push push dword ptr [ebp - 09Ch]
    push push dword ptr [ebp - 4]
    push push dword ptr [ebp + 8]
    call sub_1006E84C
    mov mov edi, eax
    cmp cmp edi, ebx
    jl sub_10070956
    push push ebx
    push push dword ptr [ebp - 09Ch]
    mov mov ecx, esi
    push push dword ptr [ebp - 0C0h]
    push push dword ptr [ebp - 098h]
    push push dword ptr [ebp + 24]
    push push dword ptr [ebp + 8]
    call sub_1006E876
    mov mov edi, eax
    cmp cmp edi, ebx
    jl sub_10070980
    mov mov eax, dword ptr [ebp - 8]
    push push 23
    push push dword ptr [ebp - 0D8h]
    or or eax, 020200000h
    push push dword ptr [ebp - 0D0h]
    mov mov ecx, esi
    push push dword ptr [ebp - 094h]
    mov mov dword ptr [ebp - 20], eax
    push push eax
    push push dword ptr [ebp + 8]
    call sub_1006E8AA
    mov mov edi, eax
    cmp cmp edi, ebx
    jl sub_100709B4
    push push ebx
    push push dword ptr [ebp - 44]
    mov mov ecx, esi
    push push dword ptr [ebp - 098h]
    push push dword ptr [ebp - 090h]
    push push dword ptr [ebp + 24]
    push push dword ptr [ebp + 8]
    call sub_1006E8D1
    mov mov edi, eax
    cmp cmp edi, ebx
    jl sub_100709DB
    push push ebx
    push push dword ptr [ebp - 40]
    mov mov ecx, esi
    push push dword ptr [ebp - 090h]
    push push dword ptr [ebp - 08Ch]
    push push dword ptr [ebp - 4]
    push push dword ptr [ebp + 8]
    call sub_1006E8F8
    mov mov edi, eax
    cmp cmp edi, ebx
    jl sub_10070A02
    push push ebx
    push push dword ptr [ebp - 094h]
    mov mov ecx, esi
    push push dword ptr [ebp - 08Ch]
    push push dword ptr [ebp - 088h]
    push push dword ptr [ebp + 24]
    push push dword ptr [ebp + 8]
    call sub_1006E922
    mov mov edi, eax
    cmp cmp edi, ebx
    jl sub_10070A2C
    push push ebx
    push push dword ptr [ebp - 098h]
    mov mov ecx, esi
    push push dword ptr [ebp - 088h]
    push push dword ptr [ebp - 084h]
    push push dword ptr [ebp - 4]
    push push dword ptr [ebp + 8]
    call sub_1006E94C
    mov mov edi, eax
    cmp cmp edi, ebx
    jl sub_10070A56
    push push 23
    push push dword ptr [ebp - 0D4h]
    mov mov ecx, esi
    push push dword ptr [ebp + 16]
    push push dword ptr [ebp - 116]
    push push dword ptr [ebp - 20]
    push push dword ptr [ebp + 8]
    call sub_1006E971
    mov mov edi, eax
    cmp cmp edi, ebx
    jl sub_10070A7B
    push push ebx
    push push dword ptr [ebp - 36]
    mov mov ecx, esi
    push push dword ptr [ebp - 116]
    push push dword ptr [ebp - 112]
    push push dword ptr [ebp + 24]
    push push dword ptr [ebp + 8]
    call sub_1006E992
    mov mov edi, eax
    cmp cmp edi, ebx
    jl sub_10070A9C
    push push ebx
    push push dword ptr [ebp - 112]
    mov mov ecx, esi
    push push dword ptr [ebp - 084h]
    push push dword ptr [ebp - 108]
    push push dword ptr [ebp - 4]
    push push dword ptr [ebp + 8]
    call sub_1006E9B6
    mov mov edi, eax
    cmp cmp edi, ebx
    jl sub_10070AC0
    push push ebx
    push push dword ptr [ebp + 16]
    mov mov ecx, esi
    push push dword ptr [ebp + 12]
    push push dword ptr [ebp - 104]
    push push dword ptr [ebp - 24]
    push push dword ptr [ebp + 8]
    call sub_1006E9D7
    mov mov edi, eax
    cmp cmp edi, ebx
    jl sub_10070AE1
    push push ebx
    push push dword ptr [ebp + 16]
    mov mov ecx, esi
    push push dword ptr [ebp + 12]
    push push dword ptr [ebp - 100]
    push push dword ptr [ebp - 16]
    push push dword ptr [ebp + 8]
    call sub_1006E9F8
    mov mov edi, eax
    cmp cmp edi, ebx
    jl sub_10070B02
    push push ebx
    push push ebx
    push push dword ptr [ebp - 104]
    mov mov ecx, esi
    push push dword ptr [ebp - 96]
    push push dword ptr [ebp - 12]
    push push dword ptr [ebp + 8]
    call sub_1006EA17
    mov mov edi, eax
    cmp cmp edi, ebx
    jl sub_10070B21
    push push 23
    push push dword ptr [ebp - 96]
    mov mov ecx, esi
    push push dword ptr [ebp - 104]
    push push dword ptr [ebp - 92]
    push push dword ptr [ebp - 20]
    push push dword ptr [ebp + 8]
    call sub_1006EA39
    mov mov edi, eax
    cmp cmp edi, ebx
    jl sub_10070B43
    push push ebx
    push push ebx
    push push dword ptr [ebp - 100]
    mov mov ecx, esi
    push push dword ptr [ebp - 88]
    push push dword ptr [ebp - 12]
    push push dword ptr [ebp + 8]
    call sub_1006EA58
    mov mov edi, eax
    cmp cmp edi, ebx
    jl sub_10070B62
    mov mov eax, dword ptr [ebp - 8]
    push push 23
    push push dword ptr [ebp - 88]
    or or eax, 020300000h
    push push dword ptr [ebp - 100]
    mov mov ecx, esi
    push push dword ptr [ebp - 84]
    push push eax
    push push dword ptr [ebp + 8]
    call sub_1006EA80
    mov mov edi, eax
    cmp cmp edi, ebx
    jl sub_10070B8A
    push push 23
    push push dword ptr [ebp - 84]
    mov mov ecx, esi
    push push dword ptr [ebp - 92]
    push push dword ptr [ebp - 80]
    push push dword ptr [ebp + 24]
    push push dword ptr [ebp + 8]
    call sub_1006EAA2
    mov mov edi, eax
    cmp cmp edi, ebx
    jl sub_10070BA8
    push push ebx
    push push dword ptr [ebp - 108]
    mov mov ecx, esi
    push push dword ptr [ebp - 108]
    push push dword ptr [ebp - 76]
    push push dword ptr [ebp - 4]
    push push dword ptr [ebp + 8]
    call sub_1006EABF
    mov mov edi, eax
    cmp cmp edi, ebx
    jl sub_10070BC5
    push push ebx
    push push ebx
    push push dword ptr [ebp - 76]
    mov mov ecx, esi
    push push dword ptr [ebp - 72]
    push push dword ptr [ebp - 12]
    push push dword ptr [ebp + 8]
    call sub_1006EADA
    mov mov edi, eax
    cmp cmp edi, ebx
    jl sub_10070BE0
    push push ebx
    push push dword ptr [ebp - 72]
    mov mov ecx, esi
    push push dword ptr [ebp - 80]
    push push dword ptr [ebp - 68]
    push push dword ptr [ebp + 24]
    push push dword ptr [ebp + 8]
    call sub_1006EAF7
    mov mov edi, eax
    cmp cmp edi, ebx
    jl sub_10070BFD
    push push ebx
    push push dword ptr [ebp - 68]
    mov mov ecx, esi
    push push dword ptr [ebp - 108]
    push push dword ptr [ebp + 20]
    push push dword ptr [ebp - 4]
    push push dword ptr [ebp + 8]
    call sub_1006EB14
    mov mov edi, eax
    cmp cmp edi, ebx
    jl sub_10070C1A
    xor xor edi, edi
    push push dword ptr [ebp - 28]
    call sub_100F8081
    pop pop ecx
    mov mov eax, edi
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 20
FUN_1006fbf4 ENDP
END
