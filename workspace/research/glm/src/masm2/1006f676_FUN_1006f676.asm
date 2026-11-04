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
EXTRN sub_1006FC02:PROC
EXTRN sub_1006FC23:PROC
EXTRN sub_1006FC4D:PROC
EXTRN sub_1006FC53:PROC
EXTRN sub_1006FC54:PROC
EXTRN sub_10070115:PROC
EXTRN sub_100861D8:PROC
EXTRN sub_100861F3:PROC
EXTRN sub_1008620E:PROC
EXTRN sub_1008622C:PROC
EXTRN sub_1008624A:PROC
EXTRN sub_10086268:PROC
EXTRN sub_10086286:PROC
EXTRN sub_100F78E2:PROC
EXTRN sub_100F79CB:PROC
EXTRN EXTRN g_1010F788:DWORD:DWORD
EXTRN EXTRN g_1010F798:DWORD:DWORD
EXTRN EXTRN g_1010F868:DWORD:DWORD
EXTRN EXTRN g_1010F870:DWORD:DWORD
EXTRN EXTRN g_1010F878:DWORD:DWORD
EXTRN EXTRN g_1010F880:DWORD:DWORD
EXTRN EXTRN g_1010F888:DWORD:DWORD
.CODE
FUN_1006f676 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 0ACh
    push push ebx
    push push esi
    mov mov esi, ecx
    mov mov eax, dword ptr [esi + 8]
    xor xor ebx, ebx
    test test byte ptr [eax + 109], 2
    push push edi
    mov mov dword ptr [ebp - 16], ebx
    je L1
    cmp cmp dword ptr [ebp + 16], ebx
    je L0
    mov mov eax, dword ptr [ebp + 24]
    push push ebx
    push push ebx
    push push dword ptr [ebp + 12]
    and and eax, 0FFFFFh
    push push dword ptr [ebp + 16]
    or or eax, 010A00000h
    push push eax
    push push dword ptr [ebp + 8]
    call sub_1006E349
    mov mov edi, eax
    cmp cmp edi, ebx
    jl L2
    cmp cmp dword ptr [ebp + 20], ebx
    je L3
    mov mov eax, dword ptr [ebp + 24]
    push push 4
    push push ebx
    push push dword ptr [ebp + 12]
    and and eax, 0FFFFFh
    or or eax, 010B00000h
    push push dword ptr [ebp + 20]
    mov mov ecx, esi
    push push eax
    push push dword ptr [ebp + 8]
    call sub_1006E375
    mov mov edi, eax
    cmp cmp edi, ebx
    jl L4
    xor xor edi, edi
    push push dword ptr [ebp - 16]
    call sub_100F78E2
    pop pop ecx
    mov mov eax, edi
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 20
    mov mov ecx, dword ptr [esi + 8]
    fld fld qword ptr [g_1010F888]
    push push ecx
    push push ecx
    fstp fstp qword ptr [esp]
    push push ebx
    push push ebx
    push push dword ptr [ecx + 120]
    call sub_100861D8
    fld fld qword ptr [g_1010F880]
L1:
    mov mov ecx, dword ptr [esi + 8]
    push push ecx
    push push ecx
    fstp fstp qword ptr [esp]
    push push ebx
    push push ebx
    push push dword ptr [ecx + 120]
    mov mov dword ptr [ebp - 12], eax
    call sub_100861F3
    fld fld qword ptr [g_1010F878]
    mov mov ecx, dword ptr [esi + 8]
    push push ecx
    push push ecx
    fstp fstp qword ptr [esp]
    push push ebx
    push push ebx
    push push dword ptr [ecx + 120]
    mov mov dword ptr [ebp - 8], eax
    call sub_1008620E
    fld fld qword ptr [g_1010F870]
    mov mov ecx, dword ptr [esi + 8]
    push push ecx
    push push ecx
    fstp fstp qword ptr [esp]
    push push ebx
    push push ebx
    push push dword ptr [ecx + 120]
L4:
    mov mov dword ptr [ebp - 0ACh], eax
    call sub_1008622C
    fld fld qword ptr [g_1010F868]
    mov mov ecx, dword ptr [esi + 8]
    push push ecx
    push push ecx
    fstp fstp qword ptr [esp]
    push push ebx
    push push ebx
    push push dword ptr [ecx + 120]
    mov mov dword ptr [ebp - 084h], eax
    call sub_1008624A
    fld fld qword ptr [g_1010F788]
    mov mov ecx, dword ptr [esi + 8]
    push push ecx
    push push ecx
    fstp fstp qword ptr [esp]
    push push ebx
    push push ebx
    push push dword ptr [ecx + 120]
    mov mov dword ptr [ebp - 098h], eax
    call sub_10086268
    fld fld qword ptr [g_1010F798]
    mov mov ecx, dword ptr [esi + 8]
    push push ecx
    push push ecx
    fstp fstp qword ptr [esp]
    push push ebx
    push push ebx
    push push dword ptr [ecx + 120]
    mov mov dword ptr [ebp - 08Ch], eax
    call sub_10086286
    mov mov edi, dword ptr [ebp + 24]
    mov mov dword ptr [ebp - 09Ch], eax
    mov mov eax, edi
    imul imul eax, eax, 112
    push push eax
    call sub_100F79CB
    cmp cmp eax, ebx
    pop pop ecx
    mov mov dword ptr [ebp - 16], eax
    jne L7
    mov mov edi, 08007000Eh
    jmp L5
    mov mov edx, edi
    xor xor ecx, ecx
    shl shl edx, 2
    mov mov dword ptr [ebp + ecx*4 - 080h], eax
    inc inc ecx
    add add eax, edx
    cmp cmp ecx, 28
    jb L8
    xor xor edx, edx
    push push dword ptr [ebp + 24]
    mov mov ecx, esi
    push push dword ptr [ebp + edx*4 - 080h]
    call sub_1006C6FC
    mov mov edi, eax
    cmp cmp edi, ebx
    jl L6
    inc inc edx
    cmp cmp edx, 20
    jb L10
    cmp cmp dword ptr [ebp + 24], ebx
    jbe L17
    mov mov eax, dword ptr [ebp - 44]
    mov mov edx, dword ptr [ebp - 40]
    sub sub edx, eax
    mov mov ecx, dword ptr [ebp - 48]
    mov mov dword ptr [ebp - 090h], edx
    mov mov edx, dword ptr [ebp - 36]
    sub sub edx, eax
    mov mov dword ptr [ebp - 0A8h], edx
    mov mov edx, dword ptr [ebp - 32]
    sub sub edx, eax
    mov mov dword ptr [ebp - 0A0h], edx
    mov mov edx, dword ptr [ebp - 28]
    sub sub edx, eax
    mov mov dword ptr [ebp - 088h], edx
    mov mov edx, dword ptr [ebp - 24]
    sub sub edx, eax
    mov mov dword ptr [ebp - 094h], edx
    mov mov edx, dword ptr [ebp - 20]
    sub sub ecx, eax
    sub sub edx, eax
    mov mov dword ptr [ebp - 0A4h], edx
    mov mov edx, dword ptr [ebp + 24]
    mov mov dword ptr [ebp - 4], edx
    mov mov edx, dword ptr [esi + 32]
    mov mov edi, dword ptr [ebp - 090h]
    mov mov dword ptr [ecx + eax], edx
    mov mov edx, dword ptr [ebp - 12]
    mov mov dword ptr [eax], edx
    mov mov edx, dword ptr [ebp - 8]
    mov mov dword ptr [edi + eax], edx
    mov mov edx, dword ptr [ebp - 0ACh]
    mov mov edi, dword ptr [ebp - 0A8h]
    mov mov dword ptr [edi + eax], edx
    mov mov edx, dword ptr [ebp - 084h]
    mov mov edi, dword ptr [ebp - 0A0h]
    mov mov dword ptr [edi + eax], edx
    mov mov edx, dword ptr [ebp - 098h]
    mov mov edi, dword ptr [ebp - 088h]
    mov mov dword ptr [edi + eax], edx
    mov mov edx, dword ptr [ebp - 08Ch]
    mov mov edi, dword ptr [ebp - 094h]
    mov mov dword ptr [edi + eax], edx
    mov mov edx, dword ptr [ebp - 09Ch]
    mov mov edi, dword ptr [ebp - 0A4h]
    mov mov dword ptr [edi + eax], edx
    add add eax, 4
    dec dec dword ptr [ebp - 4]
    jne L21
    mov mov eax, dword ptr [ebp + 24]
    push push ebx
    push push ebx
    push push dword ptr [ebp + 12]
    and and eax, 0FFFFFh
    push push dword ptr [ebp - 080h]
    mov mov dword ptr [ebp - 4], eax
    or or word ptr [ebp - 2], 01010h
    push push dword ptr [ebp - 4]
    mov mov ecx, esi
    push push dword ptr [ebp + 8]
    mov mov dword ptr [ebp + 24], eax
    call sub_1006E59A
    mov mov edi, eax
    cmp cmp edi, ebx
    jl L9
    mov mov eax, dword ptr [ebp + 24]
    push push 4
    push push dword ptr [ebp - 080h]
    or or eax, 020100000h
    push push dword ptr [ebp + 12]
    mov mov ecx, esi
    push push dword ptr [ebp - 124]
    push push eax
    push push dword ptr [ebp + 8]
    call sub_1006E5C2
    mov mov edi, eax
    cmp cmp edi, ebx
    jl L11
    push push 8
    push push ebx
    push push dword ptr [ebp - 124]
    mov mov ecx, esi
    push push dword ptr [ebp - 120]
    push push dword ptr [ebp - 4]
    push push dword ptr [ebp + 8]
    call sub_1006E5E2
    mov mov edi, eax
L7:
    cmp cmp edi, ebx
    jl L12
    mov mov eax, dword ptr [ebp + 24]
    push push ebx
    push push dword ptr [ebp - 48]
    or or eax, 020400000h
    push push dword ptr [ebp - 120]
    mov mov ecx, esi
    push push dword ptr [ebp - 116]
    mov mov dword ptr [ebp - 8], eax
    push push eax
    push push dword ptr [ebp + 8]
    call sub_1006E60C
    mov mov edi, eax
    cmp cmp edi, ebx
    jl L13
    mov mov eax, dword ptr [ebp + 24]
L9:
    push push 4
    push push ebx
    push push dword ptr [ebp - 116]
    or or eax, 010700000h
    push push dword ptr [ebp - 112]
    mov mov ecx, esi
    push push eax
    push push dword ptr [ebp + 8]
    call sub_1006E632
    mov mov edi, eax
    cmp cmp edi, ebx
L10:
    jl L14
    mov mov eax, dword ptr [ebp + 24]
    push push 4
L11:
    push push ebx
    push push dword ptr [ebp - 112]
    or or eax, 010300000h
    push push dword ptr [ebp - 108]
    mov mov ecx, esi
    push push eax
    push push dword ptr [ebp + 8]
    call sub_1006E658
    mov mov edi, eax
    cmp cmp edi, ebx
    jl L15
    mov mov eax, dword ptr [ebp + 24]
    push push ebx
    push push dword ptr [ebp - 124]
    or or eax, 020500000h
    push push dword ptr [ebp - 44]
    mov mov ecx, esi
    push push dword ptr [ebp - 104]
    mov mov dword ptr [ebp - 12], eax
    push push eax
    push push dword ptr [ebp + 8]
    call sub_1006E682
    mov mov edi, eax
    cmp cmp edi, ebx
    jl L16
    push push ebx
    push push dword ptr [ebp - 40]
    mov mov ecx, esi
    push push dword ptr [ebp - 104]
    push push dword ptr [ebp - 100]
    push push dword ptr [ebp - 8]
    push push dword ptr [ebp + 8]
    call sub_1006E6A3
    mov mov edi, eax
    cmp cmp edi, ebx
    jl L18
    push push ebx
    push push dword ptr [ebp - 124]
L14:
    mov mov ecx, esi
    push push dword ptr [ebp - 100]
    push push dword ptr [ebp - 96]
    push push dword ptr [ebp - 12]
    push push dword ptr [ebp + 8]
    call sub_1006E6C4
    mov mov edi, eax
    cmp cmp edi, ebx
    jl L19
    push push ebx
    push push dword ptr [ebp - 36]
    mov mov ecx, esi
    push push dword ptr [ebp - 96]
L15:
    push push dword ptr [ebp - 92]
    push push dword ptr [ebp - 8]
    push push dword ptr [ebp + 8]
    call sub_1006E6E5
    mov mov edi, eax
    cmp cmp edi, ebx
    jl L20
    push push ebx
    push push dword ptr [ebp - 124]
    mov mov ecx, esi
    push push dword ptr [ebp - 92]
    push push dword ptr [ebp - 88]
    push push dword ptr [ebp - 12]
    push push dword ptr [ebp + 8]
L16:
    call sub_1006E706
    mov mov edi, eax
    cmp cmp edi, ebx
    jl L22
    push push ebx
    push push dword ptr [ebp - 32]
    mov mov ecx, esi
    push push dword ptr [ebp - 88]
    push push dword ptr [ebp - 84]
    push push dword ptr [ebp - 8]
    push push dword ptr [ebp + 8]
L18:
    call sub_1006E727
    mov mov edi, eax
    cmp cmp edi, ebx
    jl L23
    push push ebx
    push push dword ptr [ebp - 108]
    mov mov ecx, esi
    push push dword ptr [ebp - 84]
    push push dword ptr [ebp - 80]
    push push dword ptr [ebp - 12]
    push push dword ptr [ebp + 8]
L19:
    call sub_1006E748
    mov mov edi, eax
    cmp cmp edi, ebx
    jl L24
    push push ebx
    push push dword ptr [ebp - 28]
    mov mov ecx, esi
    push push dword ptr [ebp - 80]
    push push dword ptr [ebp - 76]
    push push dword ptr [ebp - 12]
    push push dword ptr [ebp + 8]
L20:
    call sub_1006E769
    mov mov edi, eax
    cmp cmp edi, ebx
    jl L25
    push push ebx
    push push dword ptr [ebp - 24]
    mov mov ecx, esi
    push push dword ptr [ebp - 76]
    push push dword ptr [ebp - 72]
    push push dword ptr [ebp - 8]
    push push dword ptr [ebp + 8]
L22:
    call sub_1006E78A
    mov mov edi, eax
    cmp cmp edi, ebx
    jl L26
    mov mov eax, dword ptr [ebp + 24]
    push push 23
    push push dword ptr [ebp - 080h]
    or or eax, 020200000h
    push push dword ptr [ebp + 12]
    mov mov ecx, esi
L23:
    push push dword ptr [ebp - 68]
    push push eax
    push push dword ptr [ebp + 8]
    call sub_1006E7B2
    mov mov edi, eax
    cmp cmp edi, ebx
    jl L27
    push push ebx
    push push dword ptr [ebp - 68]
    mov mov ecx, esi
    push push dword ptr [ebp - 72]
    push push dword ptr [ebp - 64]
    push push dword ptr [ebp - 12]
    push push dword ptr [ebp + 8]
    call sub_1006E7D3
    mov mov edi, eax
    cmp cmp edi, ebx
    jl L28
    push push 4
    push push dword ptr [ebp - 64]
    mov mov ecx, esi
    push push dword ptr [ebp - 80]
    push push dword ptr [ebp - 60]
    push push dword ptr [ebp - 8]
    push push dword ptr [ebp + 8]
    call sub_1006E7F5
    mov mov edi, eax
    cmp cmp edi, ebx
    jl L29
    push push 8
    push push ebx
    push push dword ptr [ebp - 60]
    mov mov ecx, esi
    push push dword ptr [ebp - 56]
    push push dword ptr [ebp - 4]
    push push dword ptr [ebp + 8]
    call sub_1006E815
    mov mov edi, eax
    cmp cmp edi, ebx
    jl sub_1006FC02
    push push ebx
    push push dword ptr [ebp - 20]
    mov mov ecx, esi
    push push dword ptr [ebp - 56]
    push push dword ptr [ebp - 52]
    push push dword ptr [ebp - 8]
    push push dword ptr [ebp + 8]
L27:
    call sub_1006E836
    mov mov edi, eax
    cmp cmp edi, ebx
    jl sub_1006FC23
    cmp cmp dword ptr [ebp + 16], ebx
    je sub_10070115
    mov mov eax, dword ptr [ebp + 24]
    push push ebx
    push push ebx
    push push dword ptr [ebp - 52]
    or or eax, 010000000h
L28:
    push push dword ptr [ebp + 16]
    mov mov ecx, esi
    push push eax
    push push dword ptr [ebp + 8]
    call sub_1006E860
    mov mov edi, eax
    cmp cmp edi, ebx
    jl sub_1006FC4D
    cmp cmp dword ptr [ebp + 20], ebx
    je sub_1006FC54
    mov mov eax, dword ptr [ebp + 24]
    push push 4
    push push ebx
    push push dword ptr [ebp - 60]
    or or eax, 010000000h
    jmp sub_1006FC53
FUN_1006f676 ENDP
END
