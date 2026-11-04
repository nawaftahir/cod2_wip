.686
.MODEL FLAT, C
EXTRN sub_1001E636:PROC
EXTRN sub_1001F2C9:PROC
EXTRN sub_1001F302:PROC
EXTRN sub_1001F311:PROC
EXTRN sub_1001F319:PROC
EXTRN EXTRN fp_101D49C8:DWORD:DWORD
EXTRN EXTRN fp_101D49EC:DWORD:DWORD
EXTRN EXTRN fp_101D4B68:DWORD:DWORD
EXTRN EXTRN fp_101D4B94:DWORD:DWORD
EXTRN EXTRN fp_101D4BB4:DWORD:DWORD
EXTRN EXTRN g_101CE708:DWORD:DWORD
EXTRN EXTRN g_101CE70C:DWORD:DWORD
EXTRN EXTRN g_101D49B0:DWORD:DWORD
EXTRN EXTRN g_101D49C0:DWORD:DWORD
EXTRN EXTRN g_101D49C4:DWORD:DWORD
EXTRN EXTRN g_101DA9C8:DWORD:DWORD
EXTRN EXTRN g_1076A868:DWORD:DWORD
.CODE
FUN_1001f120 PROC
    push push ecx
    push push ebp
    mov mov ebp, dword ptr [esp + 16]
    push push esi
    push push edi
    mov mov edi, eax
    movsx movsx esi, word ptr [edi]
    push push esi
    push push ebp
    call dword ptr [fp_101D4BB4]
    push push eax
    call dword ptr [fp_101D4B68]
    add add esp, 12
    test test eax, eax
    je L2
    mov mov ecx, dword ptr [esp + 32]
    movsx movsx ecx, byte ptr [esi + ecx]
    movsx movsx edx, word ptr [edi + 2]
    mov mov eax, dword ptr [eax + ecx*4]
    mov mov edi, dword ptr [eax + edx*4]
    push push ecx
    push push edx
    push push esi
    push push ebp
    call dword ptr [fp_101D4B94]
    mov mov ecx, dword ptr [esp + 36]
    mov mov edx, dword ptr [ecx + 44]
    mov mov esi, eax
    mov mov eax, dword ptr [esp + 44]
    mov mov dword ptr [edx + eax*4], edi
    mov mov eax, dword ptr [esi + 16]
    add add esp, 16
    test test eax, eax
    jne sub_1001F2C9
    mov mov ecx, dword ptr [g_101CE70C]
    mov mov al, byte ptr [ecx + 8]
    test test al, al
    je L0
    mov mov eax, dword ptr [esi + 20]
    test test eax, eax
    je L1
    mov mov dword ptr [ebx + 12], 0
    movsx movsx edx, word ptr [esi + 2]
    push push edx
    call sub_1001E636
    add add esp, 4
    test test eax, eax
    mov mov dword ptr [ebx + 8], eax
    jl L3
    mov mov eax, dword ptr [g_101DA9C8]
    mov mov ecx, dword ptr [eax + 0217C78h]
    mov mov edx, dword ptr [ecx]
    add add edx, dword ptr [g_101D49B0]
    mov mov dword ptr [esp + 12], edx
    jne sub_1001F302
    mov mov eax, dword ptr [g_101CE708]
    xor xor ecx, ecx
    mov mov dword ptr [ebx + 8], -1
    mov mov edi, dword ptr [eax + 8]
    movsx movsx eax, word ptr [esi + 2]
    cmp cmp edi, 2
    setne setne cl
    dec dec ecx
    and and ecx, -28
    add add ecx, 64
    imul imul eax, ecx
    mov mov ecx, dword ptr [g_101D49C4]
    lea lea edx, [ecx + eax]
    cmp cmp edx, 0A00000h
    jle sub_1001F311
    mov mov eax, dword ptr [g_101DA9C8]
    mov mov eax, dword ptr [eax]
    cmp cmp dword ptr [g_1076A868], eax
    je sub_1001F319
    push push 010196978h
    push push 2
    mov mov dword ptr [g_1076A868], eax
    call dword ptr [fp_101D49C8]
    add add esp, 8
    pop pop edi
    pop pop esi
    xor xor eax, eax
    pop pop ebp
    pop pop ecx
    ret ret
    mov mov edx, dword ptr [g_101D49C0]
    add add edx, ecx
    mov mov dword ptr [ebx + 12], edx
    mov mov edi, dword ptr [g_101D49C4]
    add add edi, eax
    push push eax
L1:
    mov mov dword ptr [g_101D49C4], edi
    mov mov eax, dword ptr [ebx + 12]
    push push eax
    call dword ptr [fp_101D49EC]
    add add esp, 8
    pop pop edi
    mov mov dword ptr [ebx + 4], esi
    pop pop esi
    mov mov dword ptr [ebx], 3
    mov mov eax, 16
    pop pop ebp
    pop pop ecx
    ret ret
    pop pop edi
    mov mov dword ptr [ebx + 4], esi
    pop pop esi
    mov mov dword ptr [ebx], 4
    mov mov eax, 56
    pop pop ebp
    pop pop ecx
    ret ret
FUN_1001f120 ENDP
END
