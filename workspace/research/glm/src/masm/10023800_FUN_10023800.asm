.686
.MODEL FLAT, C
EXTRN fp_101D4BB4:DWORD
EXTRN g_101DA9C8:DWORD
.CODE
FUN_10023800 PROC
    mov eax, dword ptr [esp + 4]
    mov ecx, dword ptr [eax]
    mov eax, dword ptr [g_101DA9C8]
    mov edx, dword ptr [esp + 8]
    mov edx, dword ptr [edx]
    push ebx
    push ebp
    push esi
    mov esi, ecx
    imul esi, esi, 116
    push edi
    lea edi, [esi + eax + 0000A0010h]
    mov esi, edx
    imul esi, esi, 116
    mov ebp, dword ptr [esi + eax + 0000A0010h]
    lea ebx, [esi + eax + 0000A0010h]
    mov esi, dword ptr [edi]
    mov eax, esi
    sub eax, ebp
    jne L1
    imul ecx, ecx, 52
    imul edx, edx, 52
    add ecx, 010678AC4h
    add edx, 010678AC4h
    cmp esi, 3
    ja L0
    jmp dword ptr [esi*4 + 0x100238b8]
    mov edx, dword ptr [edx + 4]
    mov esi, dword ptr [ecx + 4]
    push 0
    push edx
    call dword ptr [fp_101D4BB4]
    push 0
    push esi
    mov edi, eax
    call dword ptr [fp_101D4BB4]
    add esp, 16
    sub eax, edi
    pop edi
    pop esi
    pop ebp
    pop ebx
    ret
    mov eax, dword ptr [ecx + 4]
    mov ecx, dword ptr [edx + 4]
    pop edi
    pop esi
    pop ebp
    sub eax, ecx
    pop ebx
    ret
    mov esi, dword ptr [edx + 4]
    mov eax, dword ptr [ecx + 4]
    pop edi
    sub eax, esi
    pop esi
    pop ebp
    sar eax, 5
    pop ebx
    ret
L0:
    mov ecx, dword ptr [edi + 84]
    sub ecx, dword ptr [ebx + 84]
    mov eax, 078787879h
    imul ecx
    sar edx, 5
    mov eax, edx
    shr eax, 31
    add eax, edx
L1:
    pop edi
    pop esi
    pop ebp
    pop ebx
    ret
FUN_10023800 ENDP
END
