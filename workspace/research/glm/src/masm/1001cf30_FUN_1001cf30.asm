.686
.MODEL FLAT, C
EXTRN sub_1001D397:PROC
.CODE
FUN_1001cf30 PROC
    sub esp, 12
    push ebx
    mov ebx, eax
    push ebp
    push esi
    mov esi, ecx
    sub esi, ebx
    mov eax, 02AAAAAABh
    imul esi
    sar edx, 1
    mov eax, edx
    shr eax, 31
    add eax, edx
    cmp eax, 1
    push edi
    jle L1
L0:
    lea eax, [ebx + esi - 12]
    mov edi, eax
    mov ecx, dword ptr [edi]
    mov edx, dword ptr [edi + 4]
    mov edi, dword ptr [edi + 8]
    mov dword ptr [esp + 24], edi
    mov edi, ebx
    mov ebp, dword ptr [edi]
    mov dword ptr [eax], ebp
    mov ebp, dword ptr [edi + 4]
    mov dword ptr [eax + 4], ebp
    mov edi, dword ptr [edi + 8]
    mov dword ptr [eax + 8], edi
    mov eax, dword ptr [esp + 32]
    push eax
    sub esp, 12
    mov eax, esp
    mov dword ptr [eax], ecx
    mov ecx, dword ptr [esp + 40]
    mov dword ptr [eax + 4], edx
    mov dword ptr [eax + 8], ecx
    lea ecx, [esi - 12]
    mov eax, 02AAAAAABh
    imul ecx
    sar edx, 1
    mov eax, edx
    shr eax, 31
    add eax, edx
    push eax
    xor eax, eax
    call sub_1001D397
    sub esi, 12
    mov eax, 02AAAAAABh
    imul esi
    sar edx, 1
    mov eax, edx
    shr eax, 31
    add eax, edx
    add esp, 20
    cmp eax, 1
    jg L0
L1:
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 12
    ret
FUN_1001cf30 ENDP
END
