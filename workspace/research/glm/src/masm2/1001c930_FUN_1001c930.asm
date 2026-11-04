.686
.MODEL FLAT, C
EXTRN sub_1001C873:PROC
EXTRN sub_1001C8B2:PROC
EXTRN sub_1001CA8A:PROC
EXTRN sub_1001CAAB:PROC
EXTRN sub_1001CAAD:PROC
EXTRN sub_1001CB7F:PROC
EXTRN EXTRN fp_101D49D4:DWORD:DWORD
EXTRN EXTRN fp_101D4B08:DWORD:DWORD
EXTRN EXTRN fp_101D4B0C:DWORD:DWORD
EXTRN EXTRN g_101DA964:DWORD:DWORD
EXTRN EXTRN g_101DA968:DWORD:DWORD
.CODE
FUN_1001c930 PROC
    sub sub esp, 12
    push push ebx
    push push ebp
    push push esi
    push push edi
    push push 20
    lea lea eax, [esp + 20]
    push push eax
    push push 0
    push push 010194928h
    push push 010194914h
    call dword ptr [fp_101D4B08]
    push push 20
    lea lea ecx, [esp + 44]
    push push ecx
    push push 0
    push push 010194928h
    push push 0101948FCh
    mov mov ebp, eax
    call dword ptr [fp_101D4B08]
    mov mov edx, dword ptr [esp + 56]
    mov mov dword ptr [esp + 64], eax
    mov mov eax, dword ptr [esp + 60]
    add add eax, edx
    mov mov dword ptr [g_101DA964], eax
    lea lea eax, [eax + eax*2]
    shl shl eax, 2
    push push eax
    call dword ptr [fp_101D49D4]
    mov mov ecx, eax
    mov mov eax, dword ptr [esp + 60]
    add add esp, 44
    xor xor esi, esi
    test test eax, eax
    mov mov dword ptr [g_101DA968], ecx
    mov mov edi, eax
    jle L1
    mov mov ebx, ecx
    mov mov ecx, dword ptr [ebp + esi*4]
    push push 01019166Eh
    push push ecx
    call sub_1001C873
    add add esp, 8
    inc inc esi
    add add ebx, 12
    cmp cmp esi, edi
    jl L0
    mov mov eax, dword ptr [esp + 16]
    mov mov ecx, dword ptr [g_101DA968]
    mov mov edi, dword ptr [esp + 20]
    lea lea edx, [eax + eax*2]
    xor xor esi, esi
    test test edi, edi
    lea lea ebx, [ecx + edx*4]
    jle sub_1001CAAB
    jmp sub_1001CA8A
    lea lea ebx, [ebx]
    mov mov eax, dword ptr [esp + 24]
    mov mov ecx, dword ptr [eax + esi*4]
    push push 0101948F4h
    push push ecx
    call sub_1001C8B2
    add add esp, 8
    inc inc esi
    add add ebx, 12
    cmp cmp esi, edi
    jl sub_1001CAAD
    mov mov ecx, dword ptr [g_101DA968]
    mov mov eax, dword ptr [g_101DA964]
    lea lea edx, [eax + eax*2]
    lea lea esi, [ecx + edx*4]
    mov mov edx, esi
    sub sub edx, ecx
    mov mov eax, 02AAAAAABh
    imul imul edx
    sar sar edx, 1
    mov mov eax, edx
    shr shr eax, 31
    push push 01001C8D0h
    add add eax, edx
    push push eax
    push push esi
    push push ecx
    call sub_1001CB7F
    mov mov ecx, dword ptr [esp + 40]
    push push 20
    push push ecx
    call dword ptr [fp_101D4B0C]
    push push 20
    push push ebp
    call dword ptr [fp_101D4B0C]
    add add esp, 32
    pop pop edi
    pop pop esi
FUN_1001c930 ENDP
END
