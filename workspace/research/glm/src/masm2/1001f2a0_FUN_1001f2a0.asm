.686
.MODEL FLAT, C
EXTRN sub_1001E6A4:PROC
EXTRN sub_1001F498:PROC
EXTRN sub_1001F49F:PROC
EXTRN sub_1001F4BA:PROC
EXTRN sub_1001F531:PROC
EXTRN sub_1001F561:PROC
EXTRN sub_1001F571:PROC
EXTRN sub_1001F579:PROC
EXTRN sub_1002B882:PROC
EXTRN sub_1002B964:PROC
EXTRN EXTRN fp_101D49C8:DWORD:DWORD
EXTRN EXTRN fp_101D49EC:DWORD:DWORD
EXTRN EXTRN fp_101D4B68:DWORD:DWORD
EXTRN EXTRN g_101CE708:DWORD:DWORD
EXTRN EXTRN g_101CE70C:DWORD:DWORD
EXTRN EXTRN g_101CE780:DWORD:DWORD
EXTRN EXTRN g_101D49B0:DWORD:DWORD
EXTRN EXTRN g_101D49C0:DWORD:DWORD
EXTRN EXTRN g_101D49C4:DWORD:DWORD
EXTRN EXTRN g_101D7E94:DWORD:DWORD
EXTRN EXTRN g_101DA9C8:DWORD:DWORD
EXTRN EXTRN g_1076A870:DWORD:DWORD
.CODE
FUN_1001f2a0 PROC
    push push ecx
    push push ebx
    push push ebp
    mov mov ebp, dword ptr [esp + 28]
    push push edi
    push push eax
    mov mov edi, ecx
    mov mov ebx, edx
    call dword ptr [fp_101D4B68]
    add add esp, 4
    test test eax, eax
    je L9
    mov mov ecx, dword ptr [eax + ebp*4]
    mov mov eax, dword ptr [ecx + edi*4]
    mov mov edx, dword ptr [esp + 20]
    mov mov ecx, dword ptr [edx + 44]
    mov mov edx, dword ptr [esp + 24]
    mov mov dword ptr [ecx + edi*4], eax
    cmp cmp dword ptr [edx], 2
    jne L1
    mov mov ecx, dword ptr [g_101CE780]
    mov mov dl, byte ptr [ecx + 8]
    test test dl, dl
    je L2
    cmp cmp word ptr [ebx + 6], -1
    je L3
    mov mov edx, dword ptr [g_101CE708]
    cmp cmp dword ptr [edx + 8], 2
    jne L0
    mov mov ecx, dword ptr [eax + 56]
    mov mov ecx, dword ptr [ecx + 52]
    test test ecx, ecx
    je L5
    cmp cmp word ptr [ecx + 6], 0
    je L6
    mov mov dl, byte ptr [ecx + 12]
    test test dl, dl
    je L7
    mov mov edx, dword ptr [g_101D7E94]
    mov mov ecx, dword ptr [esp + 28]
    shl shl edi, 4
    add add edi, dword ptr [edx + ecx*8 + 4]
    cmp cmp dword ptr [edi + ebp*4], 0
    jne L4
    push push eax
    push push ecx
    push push edi
    call sub_1002B882
    add add esp, 12
    mov mov dword ptr [edi + ebp*4], eax
    mov mov eax, dword ptr [edi + ebp*4]
    test test eax, eax
    je L8
    call sub_1002B964
    mov mov ecx, dword ptr [esp + 24]
    mov mov dword ptr [esi], 5
    mov mov dword ptr [esi + 4], ebx
    mov mov eax, dword ptr [edi + ebp*4]
    mov mov dword ptr [esi + 8], eax
    mov mov dword ptr [esi + 12], ecx
    mov mov eax, 16
    pop pop edi
    pop pop ebp
    pop pop ebx
    pop pop ecx
    ret ret
    mov mov eax, dword ptr [ebx + 16]
    test test eax, eax
    jne sub_1001F531
    mov mov edx, dword ptr [g_101CE70C]
    mov mov al, byte ptr [edx + 8]
    test test al, al
    je sub_1001F498
    mov mov eax, dword ptr [ebx + 20]
    test test eax, eax
    je sub_1001F49F
    mov mov dword ptr [esi + 12], 0
    movsx movsx eax, word ptr [ebx + 2]
    push push eax
    call sub_1001E6A4
    add add esp, 4
    test test eax, eax
    mov mov dword ptr [esi + 8], eax
    jl sub_1001F4BA
    mov mov ecx, dword ptr [g_101DA9C8]
    mov mov edx, dword ptr [ecx + 0217C78h]
    mov mov eax, dword ptr [edx]
L2:
    add add eax, dword ptr [g_101D49B0]
    mov mov dword ptr [esp + 12], eax
    jne sub_1001F561
    mov mov edx, dword ptr [g_101CE708]
L4:
    xor xor ecx, ecx
    mov mov dword ptr [esi + 8], -1
    mov mov edi, dword ptr [edx + 8]
    movsx movsx eax, word ptr [ebx + 2]
    cmp cmp edi, 2
    setne setne cl
    dec dec ecx
    and and ecx, -28
    add add ecx, 64
    imul imul eax, ecx
    mov mov ecx, dword ptr [g_101D49C4]
    lea lea edx, [ecx + eax]
    cmp cmp edx, 0A00000h
    jle sub_1001F571
    mov mov eax, dword ptr [g_101DA9C8]
    mov mov eax, dword ptr [eax]
    cmp cmp dword ptr [g_1076A870], eax
    je sub_1001F579
    push push 010196978h
    push push 2
    mov mov dword ptr [g_1076A870], eax
    call dword ptr [fp_101D49C8]
    add add esp, 8
    xor xor eax, eax
    pop pop edi
    pop pop ebp
    pop pop ebx
    pop pop ecx
    ret ret
    mov mov edx, dword ptr [g_101D49C0]
    add add edx, ecx
    mov mov dword ptr [esi + 12], edx
    mov mov edi, dword ptr [g_101D49C4]
    add add edi, eax
    push push eax
    mov mov dword ptr [g_101D49C4], edi
    mov mov eax, dword ptr [esi + 12]
    push push eax
    call dword ptr [fp_101D49EC]
    add add esp, 8
    mov mov ecx, dword ptr [esp + 36]
    mov mov dword ptr [esi], 3
    mov mov dword ptr [esi + 4], ebx
    mov mov dword ptr [ecx], 1
    mov mov eax, 16
    pop pop edi
    pop pop ebp
    pop pop ebx
    pop pop ecx
    ret ret
    mov mov edx, dword ptr [esp + 36]
    pop pop edi
    mov mov dword ptr [esi + 4], ebx
    pop pop ebp
    mov mov dword ptr [esi], 4
    mov mov dword ptr [edx], 1
    mov mov eax, 56
    pop pop ebx
    pop pop ecx
    ret ret
FUN_1001f2a0 ENDP
END
