.686
.MODEL FLAT, C
EXTRN sub_1001C873:PROC
EXTRN sub_1001C8B2:PROC
EXTRN sub_1001CB7F:PROC
EXTRN fp_101D49D4:DWORD
EXTRN fp_101D4B08:DWORD
EXTRN fp_101D4B0C:DWORD
EXTRN g_101DA964:DWORD
EXTRN g_101DA968:DWORD
.CODE
FUN_1001c930 PROC
    sub esp, 12
    push ebx
    push ebp
    push esi
    push edi
    push 20
    lea eax, [esp + 20]
    push eax
    push 0
    push 010194928h
    push 010194914h
    call dword ptr [fp_101D4B08]
    push 20
    lea ecx, [esp + 44]
    push ecx
    push 0
    push 010194928h
    push 0101948FCh
    mov ebp, eax
    call dword ptr [fp_101D4B08]
    mov edx, dword ptr [esp + 56]
    mov dword ptr [esp + 64], eax
    mov eax, dword ptr [esp + 60]
    add eax, edx
    mov dword ptr [g_101DA964], eax
    lea eax, [eax + eax*2]
    shl eax, 2
    push eax
    call dword ptr [fp_101D49D4]
    mov ecx, eax
    mov eax, dword ptr [esp + 60]
    add esp, 44
    xor esi, esi
    test eax, eax
    mov dword ptr [g_101DA968], ecx
    mov edi, eax
    jle L1
    mov ebx, ecx
L0:
    mov ecx, dword ptr [ebp + esi*4]
    push 01019166Eh
    push ecx
    call sub_1001C873
    add esp, 8
    inc esi
    add ebx, 12
    cmp esi, edi
    jl L0
    mov eax, dword ptr [esp + 16]
    mov ecx, dword ptr [g_101DA968]
L1:
    mov edi, dword ptr [esp + 20]
    lea edx, [eax + eax*2]
    xor esi, esi
    test edi, edi
    lea ebx, [ecx + edx*4]
    jle L3
    jmp L2
    lea ebx, [ebx]
L2:
    mov eax, dword ptr [esp + 24]
    mov ecx, dword ptr [eax + esi*4]
    push 0101948F4h
    push ecx
    call sub_1001C8B2
    add esp, 8
    inc esi
    add ebx, 12
    cmp esi, edi
    jl L2
    mov ecx, dword ptr [g_101DA968]
L3:
    mov eax, dword ptr [g_101DA964]
    lea edx, [eax + eax*2]
    lea esi, [ecx + edx*4]
    mov edx, esi
    sub edx, ecx
    mov eax, 02AAAAAABh
    imul edx
    sar edx, 1
    mov eax, edx
    shr eax, 31
    push 01001C8D0h
    add eax, edx
    push eax
    push esi
    push ecx
    call sub_1001CB7F
    mov ecx, dword ptr [esp + 40]
    push 20
    push ecx
    call dword ptr [fp_101D4B0C]
    push 20
    push ebp
    call dword ptr [fp_101D4B0C]
    add esp, 32
    pop edi
    pop esi
FUN_1001c930 ENDP
END
