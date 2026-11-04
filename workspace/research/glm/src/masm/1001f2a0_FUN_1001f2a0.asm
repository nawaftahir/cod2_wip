.686
.MODEL FLAT, C
EXTRN sub_1001E6A4:PROC
EXTRN sub_1002B882:PROC
EXTRN sub_1002B964:PROC
EXTRN fp_101D49C8:DWORD
EXTRN fp_101D49EC:DWORD
EXTRN fp_101D4B68:DWORD
EXTRN g_101CE708:DWORD
EXTRN g_101CE70C:DWORD
EXTRN g_101CE780:DWORD
EXTRN g_101D49B0:DWORD
EXTRN g_101D49C0:DWORD
EXTRN g_101D49C4:DWORD
EXTRN g_101D7E94:DWORD
EXTRN g_101DA9C8:DWORD
EXTRN g_1076A870:DWORD
.CODE
FUN_1001f2a0 PROC
    push ecx
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 28]
    push edi
    push eax
    mov edi, ecx
    mov ebx, edx
    call dword ptr [fp_101D4B68]
    add esp, 4
    test eax, eax
    je L4
    mov ecx, dword ptr [eax + ebp*4]
    mov eax, dword ptr [ecx + edi*4]
    mov edx, dword ptr [esp + 20]
    mov ecx, dword ptr [edx + 44]
    mov edx, dword ptr [esp + 24]
    mov dword ptr [ecx + edi*4], eax
    cmp dword ptr [edx], 2
    jne L2
    mov ecx, dword ptr [g_101CE780]
    mov dl, byte ptr [ecx + 8]
    test dl, dl
    je L2
    cmp word ptr [ebx + 6], -1
    je L2
    mov edx, dword ptr [g_101CE708]
    cmp dword ptr [edx + 8], 2
    jne L0
    mov ecx, dword ptr [eax + 56]
    mov ecx, dword ptr [ecx + 52]
    test ecx, ecx
    je L2
    cmp word ptr [ecx + 6], 0
    je L2
    mov dl, byte ptr [ecx + 12]
    test dl, dl
    je L2
L0:
    mov edx, dword ptr [g_101D7E94]
    mov ecx, dword ptr [esp + 28]
    shl edi, 4
    add edi, dword ptr [edx + ecx*8 + 4]
    cmp dword ptr [edi + ebp*4], 0
    jne L1
    push eax
    push ecx
    push edi
    call sub_1002B882
    add esp, 12
    mov dword ptr [edi + ebp*4], eax
L1:
    mov eax, dword ptr [edi + ebp*4]
    test eax, eax
    je L2
    call sub_1002B964
    mov ecx, dword ptr [esp + 24]
    mov dword ptr [esi], 5
    mov dword ptr [esi + 4], ebx
    mov eax, dword ptr [edi + ebp*4]
    mov dword ptr [esi + 8], eax
    mov dword ptr [esi + 12], ecx
    mov eax, 16
    pop edi
    pop ebp
    pop ebx
    pop ecx
    ret
L2:
    mov eax, dword ptr [ebx + 16]
    test eax, eax
    jne L7
    mov edx, dword ptr [g_101CE70C]
    mov al, byte ptr [edx + 8]
    test al, al
    je L3
    mov eax, dword ptr [ebx + 20]
    test eax, eax
    je L3
    mov dword ptr [esi + 12], 0
    movsx eax, word ptr [ebx + 2]
    push eax
    call sub_1001E6A4
    add esp, 4
    test eax, eax
    mov dword ptr [esi + 8], eax
    jl L3
    mov ecx, dword ptr [g_101DA9C8]
    mov edx, dword ptr [ecx + 000217C78h]
    mov eax, dword ptr [edx]
    add eax, dword ptr [g_101D49B0]
    mov dword ptr [esp + 12], eax
    jne L6
L3:
    mov edx, dword ptr [g_101CE708]
    xor ecx, ecx
    mov dword ptr [esi + 8], 0FFFFFFFFh
    mov edi, dword ptr [edx + 8]
    movsx eax, word ptr [ebx + 2]
    cmp edi, 2
    setne cl
    dec ecx
    and ecx, 0FFFFFFE4h
    add ecx, 64
    imul eax, ecx
    mov ecx, dword ptr [g_101D49C4]
    lea edx, [ecx + eax]
    cmp edx, 000A00000h
    jle L5
    mov eax, dword ptr [g_101DA9C8]
    mov eax, dword ptr [eax]
    cmp dword ptr [g_1076A870], eax
    je L4
    push 010196978h
    push 2
    mov dword ptr [g_1076A870], eax
    call dword ptr [fp_101D49C8]
    add esp, 8
L4:
    xor eax, eax
    pop edi
    pop ebp
    pop ebx
    pop ecx
    ret
L5:
    mov edx, dword ptr [g_101D49C0]
    add edx, ecx
    mov dword ptr [esi + 12], edx
    mov edi, dword ptr [g_101D49C4]
    add edi, eax
    push eax
    mov dword ptr [g_101D49C4], edi
    mov eax, dword ptr [esi + 12]
    push eax
    call dword ptr [fp_101D49EC]
    add esp, 8
L6:
    mov ecx, dword ptr [esp + 36]
    mov dword ptr [esi], 3
    mov dword ptr [esi + 4], ebx
    mov dword ptr [ecx], 1
    mov eax, 16
    pop edi
    pop ebp
    pop ebx
    pop ecx
    ret
L7:
    mov edx, dword ptr [esp + 36]
    pop edi
    mov dword ptr [esi + 4], ebx
    pop ebp
    mov dword ptr [esi], 4
    mov dword ptr [edx], 1
    mov eax, 56
    pop ebx
    pop ecx
    ret
FUN_1001f2a0 ENDP
END
