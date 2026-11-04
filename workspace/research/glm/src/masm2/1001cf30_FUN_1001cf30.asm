.686
.MODEL FLAT, C
EXTRN sub_1001CFE4:PROC
EXTRN sub_1001D397:PROC
.CODE
FUN_1001cf30 PROC
    sub sub esp, 12
    push push ebx
    mov mov ebx, eax
    push push ebp
    push push esi
    mov mov esi, ecx
    sub sub esi, ebx
    mov mov eax, 02AAAAAABh
    imul imul esi
    sar sar edx, 1
    mov mov eax, edx
    shr shr eax, 31
    add add eax, edx
    cmp cmp eax, 1
    push push edi
    jle sub_1001CFE4
    lea lea eax, [ebx + esi - 12]
    mov mov edi, eax
    mov mov ecx, dword ptr [edi]
    mov mov edx, dword ptr [edi + 4]
    mov mov edi, dword ptr [edi + 8]
    mov mov dword ptr [esp + 24], edi
    mov mov edi, ebx
    mov mov ebp, dword ptr [edi]
    mov mov dword ptr [eax], ebp
    mov mov ebp, dword ptr [edi + 4]
    mov mov dword ptr [eax + 4], ebp
    mov mov edi, dword ptr [edi + 8]
    mov mov dword ptr [eax + 8], edi
    mov mov eax, dword ptr [esp + 32]
    push push eax
    sub sub esp, 12
    mov mov eax, esp
    mov mov dword ptr [eax], ecx
    mov mov ecx, dword ptr [esp + 40]
    mov mov dword ptr [eax + 4], edx
    mov mov dword ptr [eax + 8], ecx
    lea lea ecx, [esi - 12]
    mov mov eax, 02AAAAAABh
    imul imul ecx
    sar sar edx, 1
    mov mov eax, edx
    shr shr eax, 31
    add add eax, edx
    push push eax
    xor xor eax, eax
    call sub_1001D397
    sub sub esi, 12
    mov mov eax, 02AAAAAABh
    imul imul esi
    sar sar edx, 1
    mov mov eax, edx
    shr shr eax, 31
    add add eax, edx
    add add esp, 20
    cmp cmp eax, 1
    jg sub_1001CFE4
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    add add esp, 12
    ret ret
FUN_1001cf30 ENDP
END
