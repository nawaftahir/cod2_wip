.686
.MODEL FLAT, C
EXTRN sub_1006C6FC:PROC
EXTRN sub_1006E349:PROC
EXTRN sub_1006E375:PROC
EXTRN sub_1006E59A:PROC
EXTRN sub_1006E5C2:PROC
EXTRN sub_1006E5E2:PROC
EXTRN sub_1006E60C:PROC
EXTRN sub_1006E632:PROC
EXTRN sub_1006E658:PROC
EXTRN sub_1006E682:PROC
EXTRN sub_1006E6A3:PROC
EXTRN sub_1006E6C4:PROC
EXTRN sub_1006E6E5:PROC
EXTRN sub_1006E706:PROC
EXTRN sub_1006E727:PROC
EXTRN sub_1006E748:PROC
EXTRN sub_1006E769:PROC
EXTRN sub_1006E78A:PROC
EXTRN sub_1006E7B2:PROC
EXTRN sub_1006E7D3:PROC
EXTRN sub_1006E7F5:PROC
EXTRN sub_1006E815:PROC
EXTRN sub_1006E836:PROC
EXTRN sub_1006E860:PROC
EXTRN sub_100861D8:PROC
EXTRN sub_100861F3:PROC
EXTRN sub_1008620E:PROC
EXTRN sub_1008622C:PROC
EXTRN sub_1008624A:PROC
EXTRN sub_10086268:PROC
EXTRN sub_10086286:PROC
EXTRN sub_100F78E2:PROC
EXTRN sub_100F79CB:PROC
EXTRN g_1010F788:DWORD
EXTRN g_1010F798:DWORD
EXTRN g_1010F868:DWORD
EXTRN g_1010F870:DWORD
EXTRN g_1010F878:DWORD
EXTRN g_1010F880:DWORD
EXTRN g_1010F888:DWORD
.CODE
FUN_1006f676 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 0000000ACh
    push ebx
    push esi
    mov esi, ecx
    mov eax, dword ptr [esi + 8]
    xor ebx, ebx
    test byte ptr [eax + 109], 2
    push edi
    mov dword ptr [ebp - 16], ebx
    je L4
    cmp dword ptr [ebp + 16], ebx
    je L0
    mov eax, dword ptr [ebp + 24]
    push ebx
    push ebx
    push dword ptr [ebp + 12]
    and eax, 0000FFFFFh
    push dword ptr [ebp + 16]
    or eax, 010A00000h
    push eax
    push dword ptr [ebp + 8]
    call sub_1006E349
    mov edi, eax
    cmp edi, ebx
    jl L3
L0:
    cmp dword ptr [ebp + 20], ebx
    je L2
    mov eax, dword ptr [ebp + 24]
    push 4
    push ebx
    push dword ptr [ebp + 12]
    and eax, 0000FFFFFh
    or eax, 010B00000h
L1:
    push dword ptr [ebp + 20]
    mov ecx, esi
    push eax
    push dword ptr [ebp + 8]
    call sub_1006E375
    mov edi, eax
    cmp edi, ebx
    jl L3
L2:
    xor edi, edi
L3:
    push dword ptr [ebp - 16]
    call sub_100F78E2
    pop ecx
    mov eax, edi
    pop edi
    pop esi
    pop ebx
    leave
    ret 20
L4:
    mov ecx, dword ptr [esi + 8]
    fld qword ptr [g_1010F888]
    push ecx
    push ecx
    fstp qword ptr [esp]
    push ebx
    push ebx
    push dword ptr [ecx + 120]
    call sub_100861D8
    fld qword ptr [g_1010F880]
    mov ecx, dword ptr [esi + 8]
    push ecx
    push ecx
    fstp qword ptr [esp]
    push ebx
    push ebx
    push dword ptr [ecx + 120]
    mov dword ptr [ebp - 12], eax
    call sub_100861F3
    fld qword ptr [g_1010F878]
    mov ecx, dword ptr [esi + 8]
    push ecx
    push ecx
    fstp qword ptr [esp]
    push ebx
    push ebx
    push dword ptr [ecx + 120]
    mov dword ptr [ebp - 8], eax
    call sub_1008620E
    fld qword ptr [g_1010F870]
    mov ecx, dword ptr [esi + 8]
    push ecx
    push ecx
    fstp qword ptr [esp]
    push ebx
    push ebx
    push dword ptr [ecx + 120]
    mov dword ptr [ebp - 0000000ACh], eax
    call sub_1008622C
    fld qword ptr [g_1010F868]
    mov ecx, dword ptr [esi + 8]
    push ecx
    push ecx
    fstp qword ptr [esp]
    push ebx
    push ebx
    push dword ptr [ecx + 120]
    mov dword ptr [ebp - 000000084h], eax
    call sub_1008624A
    fld qword ptr [g_1010F788]
    mov ecx, dword ptr [esi + 8]
    push ecx
    push ecx
    fstp qword ptr [esp]
    push ebx
    push ebx
    push dword ptr [ecx + 120]
    mov dword ptr [ebp - 000000098h], eax
    call sub_10086268
    fld qword ptr [g_1010F798]
    mov ecx, dword ptr [esi + 8]
    push ecx
    push ecx
    fstp qword ptr [esp]
    push ebx
    push ebx
    push dword ptr [ecx + 120]
    mov dword ptr [ebp - 00000008Ch], eax
    call sub_10086286
    mov edi, dword ptr [ebp + 24]
    mov dword ptr [ebp - 00000009Ch], eax
    mov eax, edi
    imul eax, eax, 112
    push eax
    call sub_100F79CB
    cmp eax, ebx
    pop ecx
    mov dword ptr [ebp - 16], eax
    jne L5
    mov edi, 08007000Eh
    jmp L3
L5:
    mov edx, edi
    xor ecx, ecx
    shl edx, 2
L6:
    mov dword ptr [ebp + ecx*4 - 000000080h], eax
    inc ecx
    add eax, edx
    cmp ecx, 28
    jb L6
    xor edx, edx
L7:
    push dword ptr [ebp + 24]
    mov ecx, esi
    push dword ptr [ebp + edx*4 - 000000080h]
    call sub_1006C6FC
    mov edi, eax
    cmp edi, ebx
    jl L3
    inc edx
    cmp edx, 20
    jb L7
    cmp dword ptr [ebp + 24], ebx
    jbe L9
    mov eax, dword ptr [ebp - 44]
    mov edx, dword ptr [ebp - 40]
    sub edx, eax
    mov ecx, dword ptr [ebp - 48]
    mov dword ptr [ebp - 000000090h], edx
    mov edx, dword ptr [ebp - 36]
    sub edx, eax
    mov dword ptr [ebp - 0000000A8h], edx
    mov edx, dword ptr [ebp - 32]
    sub edx, eax
    mov dword ptr [ebp - 0000000A0h], edx
    mov edx, dword ptr [ebp - 28]
    sub edx, eax
    mov dword ptr [ebp - 000000088h], edx
    mov edx, dword ptr [ebp - 24]
    sub edx, eax
    mov dword ptr [ebp - 000000094h], edx
    mov edx, dword ptr [ebp - 20]
    sub ecx, eax
    sub edx, eax
    mov dword ptr [ebp - 0000000A4h], edx
    mov edx, dword ptr [ebp + 24]
    mov dword ptr [ebp - 4], edx
L8:
    mov edx, dword ptr [esi + 32]
    mov edi, dword ptr [ebp - 000000090h]
    mov dword ptr [ecx + eax], edx
    mov edx, dword ptr [ebp - 12]
    mov dword ptr [eax], edx
    mov edx, dword ptr [ebp - 8]
    mov dword ptr [edi + eax], edx
    mov edx, dword ptr [ebp - 0000000ACh]
    mov edi, dword ptr [ebp - 0000000A8h]
    mov dword ptr [edi + eax], edx
    mov edx, dword ptr [ebp - 000000084h]
    mov edi, dword ptr [ebp - 0000000A0h]
    mov dword ptr [edi + eax], edx
    mov edx, dword ptr [ebp - 000000098h]
    mov edi, dword ptr [ebp - 000000088h]
    mov dword ptr [edi + eax], edx
    mov edx, dword ptr [ebp - 00000008Ch]
    mov edi, dword ptr [ebp - 000000094h]
    mov dword ptr [edi + eax], edx
    mov edx, dword ptr [ebp - 00000009Ch]
    mov edi, dword ptr [ebp - 0000000A4h]
    mov dword ptr [edi + eax], edx
    add eax, 4
    dec dword ptr [ebp - 4]
    jne L8
L9:
    mov eax, dword ptr [ebp + 24]
    push ebx
    push ebx
    push dword ptr [ebp + 12]
    and eax, 0000FFFFFh
    push dword ptr [ebp - 000000080h]
    mov dword ptr [ebp - 4], eax
    or word ptr [ebp - 2], 000001010h
    push dword ptr [ebp - 4]
    mov ecx, esi
    push dword ptr [ebp + 8]
    mov dword ptr [ebp + 24], eax
    call sub_1006E59A
    mov edi, eax
    cmp edi, ebx
    jl L3
    mov eax, dword ptr [ebp + 24]
    push 4
    push dword ptr [ebp - 000000080h]
    or eax, 020100000h
    push dword ptr [ebp + 12]
    mov ecx, esi
    push dword ptr [ebp - 124]
    push eax
    push dword ptr [ebp + 8]
    call sub_1006E5C2
    mov edi, eax
    cmp edi, ebx
    jl L3
    push 8
    push ebx
    push dword ptr [ebp - 124]
    mov ecx, esi
    push dword ptr [ebp - 120]
    push dword ptr [ebp - 4]
    push dword ptr [ebp + 8]
    call sub_1006E5E2
    mov edi, eax
    cmp edi, ebx
    jl L3
    mov eax, dword ptr [ebp + 24]
    push ebx
    push dword ptr [ebp - 48]
    or eax, 020400000h
    push dword ptr [ebp - 120]
    mov ecx, esi
    push dword ptr [ebp - 116]
    mov dword ptr [ebp - 8], eax
    push eax
    push dword ptr [ebp + 8]
    call sub_1006E60C
    mov edi, eax
    cmp edi, ebx
    jl L3
    mov eax, dword ptr [ebp + 24]
    push 4
    push ebx
    push dword ptr [ebp - 116]
    or eax, 010700000h
    push dword ptr [ebp - 112]
    mov ecx, esi
    push eax
    push dword ptr [ebp + 8]
    call sub_1006E632
    mov edi, eax
    cmp edi, ebx
    jl L3
    mov eax, dword ptr [ebp + 24]
    push 4
    push ebx
    push dword ptr [ebp - 112]
    or eax, 010300000h
    push dword ptr [ebp - 108]
    mov ecx, esi
    push eax
    push dword ptr [ebp + 8]
    call sub_1006E658
    mov edi, eax
    cmp edi, ebx
    jl L3
    mov eax, dword ptr [ebp + 24]
    push ebx
    push dword ptr [ebp - 124]
    or eax, 020500000h
    push dword ptr [ebp - 44]
    mov ecx, esi
    push dword ptr [ebp - 104]
    mov dword ptr [ebp - 12], eax
    push eax
    push dword ptr [ebp + 8]
    call sub_1006E682
    mov edi, eax
    cmp edi, ebx
    jl L3
    push ebx
    push dword ptr [ebp - 40]
    mov ecx, esi
    push dword ptr [ebp - 104]
    push dword ptr [ebp - 100]
    push dword ptr [ebp - 8]
    push dword ptr [ebp + 8]
    call sub_1006E6A3
    mov edi, eax
    cmp edi, ebx
    jl L3
    push ebx
    push dword ptr [ebp - 124]
    mov ecx, esi
    push dword ptr [ebp - 100]
    push dword ptr [ebp - 96]
    push dword ptr [ebp - 12]
    push dword ptr [ebp + 8]
    call sub_1006E6C4
    mov edi, eax
    cmp edi, ebx
    jl L3
    push ebx
    push dword ptr [ebp - 36]
    mov ecx, esi
    push dword ptr [ebp - 96]
    push dword ptr [ebp - 92]
    push dword ptr [ebp - 8]
    push dword ptr [ebp + 8]
    call sub_1006E6E5
    mov edi, eax
    cmp edi, ebx
    jl L3
    push ebx
    push dword ptr [ebp - 124]
    mov ecx, esi
    push dword ptr [ebp - 92]
    push dword ptr [ebp - 88]
    push dword ptr [ebp - 12]
    push dword ptr [ebp + 8]
    call sub_1006E706
    mov edi, eax
    cmp edi, ebx
    jl L3
    push ebx
    push dword ptr [ebp - 32]
    mov ecx, esi
    push dword ptr [ebp - 88]
    push dword ptr [ebp - 84]
    push dword ptr [ebp - 8]
    push dword ptr [ebp + 8]
    call sub_1006E727
    mov edi, eax
    cmp edi, ebx
    jl L3
    push ebx
    push dword ptr [ebp - 108]
    mov ecx, esi
    push dword ptr [ebp - 84]
    push dword ptr [ebp - 80]
    push dword ptr [ebp - 12]
    push dword ptr [ebp + 8]
    call sub_1006E748
    mov edi, eax
    cmp edi, ebx
    jl L3
    push ebx
    push dword ptr [ebp - 28]
    mov ecx, esi
    push dword ptr [ebp - 80]
    push dword ptr [ebp - 76]
    push dword ptr [ebp - 12]
    push dword ptr [ebp + 8]
    call sub_1006E769
    mov edi, eax
    cmp edi, ebx
    jl L3
    push ebx
    push dword ptr [ebp - 24]
    mov ecx, esi
    push dword ptr [ebp - 76]
    push dword ptr [ebp - 72]
    push dword ptr [ebp - 8]
    push dword ptr [ebp + 8]
    call sub_1006E78A
    mov edi, eax
    cmp edi, ebx
    jl L3
    mov eax, dword ptr [ebp + 24]
    push 23
    push dword ptr [ebp - 000000080h]
    or eax, 020200000h
    push dword ptr [ebp + 12]
    mov ecx, esi
    push dword ptr [ebp - 68]
    push eax
    push dword ptr [ebp + 8]
    call sub_1006E7B2
    mov edi, eax
    cmp edi, ebx
    jl L3
    push ebx
    push dword ptr [ebp - 68]
    mov ecx, esi
    push dword ptr [ebp - 72]
    push dword ptr [ebp - 64]
    push dword ptr [ebp - 12]
    push dword ptr [ebp + 8]
    call sub_1006E7D3
    mov edi, eax
    cmp edi, ebx
    jl L3
    push 4
    push dword ptr [ebp - 64]
    mov ecx, esi
    push dword ptr [ebp - 80]
    push dword ptr [ebp - 60]
    push dword ptr [ebp - 8]
    push dword ptr [ebp + 8]
    call sub_1006E7F5
    mov edi, eax
    cmp edi, ebx
    jl L3
    push 8
    push ebx
    push dword ptr [ebp - 60]
    mov ecx, esi
    push dword ptr [ebp - 56]
    push dword ptr [ebp - 4]
    push dword ptr [ebp + 8]
    call sub_1006E815
    mov edi, eax
    cmp edi, ebx
    jl L3
    push ebx
    push dword ptr [ebp - 20]
    mov ecx, esi
    push dword ptr [ebp - 56]
    push dword ptr [ebp - 52]
    push dword ptr [ebp - 8]
    push dword ptr [ebp + 8]
    call sub_1006E836
    mov edi, eax
    cmp edi, ebx
    jl L3
    cmp dword ptr [ebp + 16], ebx
    je L10
    mov eax, dword ptr [ebp + 24]
    push ebx
    push ebx
    push dword ptr [ebp - 52]
    or eax, 010000000h
    push dword ptr [ebp + 16]
    mov ecx, esi
    push eax
    push dword ptr [ebp + 8]
    call sub_1006E860
    mov edi, eax
    cmp edi, ebx
    jl L3
L10:
    cmp dword ptr [ebp + 20], ebx
    je L2
    mov eax, dword ptr [ebp + 24]
    push 4
    push ebx
    push dword ptr [ebp - 60]
    or eax, 010000000h
    jmp L1
FUN_1006f676 ENDP
END
