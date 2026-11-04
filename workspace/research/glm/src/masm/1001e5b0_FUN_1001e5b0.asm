.686
.MODEL FLAT, C
EXTRN fp_1010C024:DWORD
EXTRN fp_1010C080:DWORD
EXTRN fp_101D49C8:DWORD
EXTRN g_101CE708:DWORD
EXTRN g_101D49B0:DWORD
EXTRN g_101DA9C8:DWORD
EXTRN g_1076A864:DWORD
.CODE
FUN_1001e5b0 PROC
    mov eax, dword ptr [g_101D49B0]
    test eax, eax
    jne L0
    or eax, 0FFFFFFFFh
    ret
L0:
    mov ecx, dword ptr [g_101CE708]
    mov edx, dword ptr [ecx + 8]
    xor eax, eax
    cmp edx, 2
    mov edx, dword ptr [g_101DA9C8]
    setne al
    push esi
    dec eax
    and eax, 0FFFFFFE4h
    add eax, 64
    imul eax, dword ptr [esp + 8]
    push eax
    mov eax, dword ptr [edx + 000217C78h]
    push eax
    call dword ptr [fp_1010C024]
    mov edx, dword ptr [g_101DA9C8]
    mov ecx, dword ptr [edx + 000217C78h]
    mov esi, dword ptr [ecx]
    cmp esi, dword ptr [ecx + 4]
    jle L3
    cmp eax, dword ptr [ecx + 4]
    jg L1
    push eax
    push ecx
    call dword ptr [fp_1010C080]
    mov edx, dword ptr [g_101DA9C8]
L1:
    mov edx, dword ptr [edx]
    cmp dword ptr [g_1076A864], edx
    je L2
    push 0101969ACh
    push 2
    mov dword ptr [g_1076A864], edx
    call dword ptr [fp_101D49C8]
    add esp, 8
L2:
    or eax, 0FFFFFFFFh
L3:
    pop esi
    ret
FUN_1001e5b0 ENDP
END
