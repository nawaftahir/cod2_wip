.686
.MODEL FLAT, C
EXTRN sub_1001E66C:PROC
EXTRN sub_1001E68A:PROC
EXTRN sub_1001E6A4:PROC
EXTRN EXTRN fp_1010C024:DWORD:DWORD
EXTRN EXTRN fp_1010C080:DWORD:DWORD
EXTRN EXTRN fp_101D49C8:DWORD:DWORD
EXTRN EXTRN g_101CE708:DWORD:DWORD
EXTRN EXTRN g_101D49B0:DWORD:DWORD
EXTRN EXTRN g_101DA9C8:DWORD:DWORD
EXTRN EXTRN g_1076A864:DWORD:DWORD
.CODE
FUN_1001e5b0 PROC
    mov mov eax, dword ptr [g_101D49B0]
    test test eax, eax
    jne L0
    or or eax, -1
    ret ret
    mov mov ecx, dword ptr [g_101CE708]
    mov mov edx, dword ptr [ecx + 8]
L0:
    xor xor eax, eax
    cmp cmp edx, 2
    mov mov edx, dword ptr [g_101DA9C8]
    setne setne al
    push push esi
    dec dec eax
    and and eax, -28
    add add eax, 64
    imul imul eax, dword ptr [esp + 8]
    push push eax
    mov mov eax, dword ptr [edx + 0217C78h]
    push push eax
    call dword ptr [fp_1010C024]
    mov mov edx, dword ptr [g_101DA9C8]
    mov mov ecx, dword ptr [edx + 0217C78h]
    mov mov esi, dword ptr [ecx]
    cmp cmp esi, dword ptr [ecx + 4]
    jle sub_1001E68A
    cmp cmp eax, dword ptr [ecx + 4]
    jg sub_1001E66C
    push push eax
    push push ecx
    call dword ptr [fp_1010C080]
    mov mov edx, dword ptr [g_101DA9C8]
    mov mov edx, dword ptr [edx]
    cmp cmp dword ptr [g_1076A864], edx
    je sub_1001E6A4
    push push 0101969ACh
    push push 2
    mov mov dword ptr [g_1076A864], edx
    call dword ptr [fp_101D49C8]
    add add esp, 8
    or or eax, -1
    pop pop esi
    ret ret
FUN_1001e5b0 ENDP
END
