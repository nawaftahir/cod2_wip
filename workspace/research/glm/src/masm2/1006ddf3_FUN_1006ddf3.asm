.686
.MODEL FLAT, C
EXTRN sub_1006DCF0:PROC
EXTRN sub_1006DF3A:PROC
EXTRN sub_1006DF41:PROC
EXTRN sub_1006DF43:PROC
EXTRN sub_1006DF48:PROC
EXTRN sub_1006DF4C:PROC
EXTRN sub_1006DF4F:PROC
EXTRN sub_1006DF53:PROC
EXTRN sub_1006DF5A:PROC
EXTRN sub_1006DF72:PROC
EXTRN sub_1006DF7A:PROC
EXTRN sub_1006DF8E:PROC
EXTRN sub_1006DFB7:PROC
EXTRN sub_1006DFEA:PROC
EXTRN sub_1006DFF3:PROC
EXTRN sub_1006DFF8:PROC
EXTRN sub_1006E00F:PROC
EXTRN sub_1006E014:PROC
EXTRN sub_1006E015:PROC
EXTRN sub_1006E044:PROC
.CODE
FUN_1006ddf3 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push ecx
    push push esi
    mov mov esi, dword ptr [ebp + 8]
    push push edi
    xor xor edi, edi
    cmp cmp esi, edi
    mov mov edx, ecx
    mov mov dword ptr [ebp - 4], edx
    jne L0
    xor xor eax, eax
    jmp sub_1006DF43
    mov mov eax, dword ptr [esi + 4]
    push push ebx
    xor xor ebx, ebx
    dec dec eax
    je L9
    sub sub eax, 5
    je L8
L0:
    dec dec eax
    dec dec eax
    je L5
    dec dec eax
    je L3
    dec dec eax
    dec dec eax
    je L2
    push push 01010F7B0h
    push push edi
    push push edi
    push push edx
    call sub_1006DCF0
    add add esp, 16
    jmp sub_1006DF7A
    push push dword ptr [ebp + 12]
    push push dword ptr [esi + 32]
    mov mov ecx, edx
    call L1
L1:
    mov mov ebx, eax
    jmp sub_1006DF8E
    mov mov ebx, dword ptr [esi + 28]
    imul imul ebx, dword ptr [esi + 24]
    mov mov esi, dword ptr [esi + 20]
    xor xor eax, eax
    cmp cmp esi, 12
    mov mov ecx, 02000000h
    ja L11
    jmp jmp dword ptr [esi*4 + 01006DF2Ch]
    push push 23
    jmp L7
    push push 2
    pop pop eax
    jmp sub_1006DF3A
    mov mov eax, 02000002h
    jmp sub_1006DF41
    mov mov eax, 04000002h
    jmp sub_1006DF48
    mov mov eax, 08000002h
    jmp sub_1006DF4F
    mov mov eax, ecx
    jmp sub_1006DF53
    mov mov eax, 04000000h
    jmp sub_1006DF5A
    mov mov eax, 08000000h
    test test byte ptr [edx + 20], 32
    je sub_1006DF72
    and and eax, 0F3FFFFFFh
    or or eax, ecx
    test test ebx, ebx
    jbe sub_1006DFEA
    mov mov edi, dword ptr [ebp + 12]
    mov mov ecx, ebx
    rep stosd rep stosd dword ptr es:[edi], eax
    jmp sub_1006DFF3
    cmp cmp dword ptr [esi + 20], edi
    jbe sub_1006DFF8
    mov mov eax, dword ptr [ebp + 12]
    mov mov ecx, dword ptr [ebp - 4]
    lea lea eax, [eax + ebx*4]
    push push eax
    push push dword ptr [esi + 16]
    call L4
L4:
    add add ebx, eax
    inc inc edi
    cmp cmp edi, dword ptr [esi + 20]
    jb sub_1006DFB7
    jmp sub_1006E014
    push push dword ptr [ebp + 12]
    push push dword ptr [esi + 24]
    jmp sub_1006DF4C
    mov mov edi, dword ptr [ebp + 12]
    cmp cmp dword ptr [esi + 4], 1
    jne sub_1006E015
    mov mov ecx, dword ptr [ebp - 4]
    lea lea eax, [edi + ebx*4]
L5:
    push push eax
    push push dword ptr [esi + 8]
    call L6
L6:
    mov mov esi, dword ptr [esi + 12]
    add add ebx, eax
    test test esi, esi
    jne sub_1006E00F
    test test esi, esi
    je sub_1006E044
    mov mov ecx, dword ptr [ebp - 4]
L8:
    lea lea eax, [edi + ebx*4]
    push push eax
    push push esi
    call L10
L10:
    add add ebx, eax
    mov mov eax, ebx
    pop pop ebx
    pop pop edi
    pop pop esi
    leave leave
    ret ret 8
FUN_1006ddf3 ENDP
END
