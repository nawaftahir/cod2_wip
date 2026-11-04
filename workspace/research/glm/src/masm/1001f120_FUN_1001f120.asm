.686
.MODEL FLAT, C
EXTRN sub_1001E636:PROC
EXTRN fp_101D49C8:DWORD
EXTRN fp_101D49EC:DWORD
EXTRN fp_101D4B68:DWORD
EXTRN fp_101D4B94:DWORD
EXTRN fp_101D4BB4:DWORD
EXTRN g_101CE708:DWORD
EXTRN g_101CE70C:DWORD
EXTRN g_101D49B0:DWORD
EXTRN g_101D49C0:DWORD
EXTRN g_101D49C4:DWORD
EXTRN g_101DA9C8:DWORD
EXTRN g_1076A868:DWORD
.CODE
FUN_1001f120 PROC
    push ecx
    push ebp
    mov ebp, dword ptr [esp + 16]
    push esi
    push edi
    mov edi, eax
    movsx esi, word ptr [edi]
    push esi
    push ebp
    call dword ptr [fp_101D4BB4]
    push eax
    call dword ptr [fp_101D4B68]
    add esp, 12
    test eax, eax
    je L1
    mov ecx, dword ptr [esp + 32]
    movsx ecx, byte ptr [esi + ecx]
    movsx edx, word ptr [edi + 2]
    mov eax, dword ptr [eax + ecx*4]
    mov edi, dword ptr [eax + edx*4]
    push ecx
    push edx
    push esi
    push ebp
    call dword ptr [fp_101D4B94]
    mov ecx, dword ptr [esp + 36]
    mov edx, dword ptr [ecx + 44]
    mov esi, eax
    mov eax, dword ptr [esp + 44]
    mov dword ptr [edx + eax*4], edi
    mov eax, dword ptr [esi + 16]
    add esp, 16
    test eax, eax
    jne L4
    mov ecx, dword ptr [g_101CE70C]
    mov al, byte ptr [ecx + 8]
    test al, al
    je L0
    mov eax, dword ptr [esi + 20]
    test eax, eax
    je L0
    mov dword ptr [ebx + 12], 0
    movsx edx, word ptr [esi + 2]
    push edx
    call sub_1001E636
    add esp, 4
    test eax, eax
    mov dword ptr [ebx + 8], eax
    jl L0
    mov eax, dword ptr [g_101DA9C8]
    mov ecx, dword ptr [eax + 000217C78h]
    mov edx, dword ptr [ecx]
    add edx, dword ptr [g_101D49B0]
    mov dword ptr [esp + 12], edx
    jne L3
L0:
    mov eax, dword ptr [g_101CE708]
    xor ecx, ecx
    mov dword ptr [ebx + 8], 0FFFFFFFFh
    mov edi, dword ptr [eax + 8]
    movsx eax, word ptr [esi + 2]
    cmp edi, 2
    setne cl
    dec ecx
    and ecx, 0FFFFFFE4h
    add ecx, 64
    imul eax, ecx
    mov ecx, dword ptr [g_101D49C4]
    lea edx, [ecx + eax]
    cmp edx, 000A00000h
    jle L2
    mov eax, dword ptr [g_101DA9C8]
    mov eax, dword ptr [eax]
    cmp dword ptr [g_1076A868], eax
    je L1
    push 010196978h
    push 2
    mov dword ptr [g_1076A868], eax
    call dword ptr [fp_101D49C8]
    add esp, 8
L1:
    pop edi
    pop esi
    xor eax, eax
    pop ebp
    pop ecx
    ret
L2:
    mov edx, dword ptr [g_101D49C0]
    add edx, ecx
    mov dword ptr [ebx + 12], edx
    mov edi, dword ptr [g_101D49C4]
    add edi, eax
    push eax
    mov dword ptr [g_101D49C4], edi
    mov eax, dword ptr [ebx + 12]
    push eax
    call dword ptr [fp_101D49EC]
    add esp, 8
L3:
    pop edi
    mov dword ptr [ebx + 4], esi
    pop esi
    mov dword ptr [ebx], 3
    mov eax, 16
    pop ebp
    pop ecx
    ret
L4:
    pop edi
    mov dword ptr [ebx + 4], esi
    pop esi
    mov dword ptr [ebx], 4
    mov eax, 56
    pop ebp
    pop ecx
    ret
FUN_1001f120 ENDP
END
