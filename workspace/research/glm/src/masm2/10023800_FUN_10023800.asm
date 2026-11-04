.686
.MODEL FLAT, C
EXTRN sub_100238EE:PROC
EXTRN EXTRN fp_101D4BB4:DWORD:DWORD
EXTRN EXTRN g_101DA9C8:DWORD:DWORD
.CODE
FUN_10023800 PROC
    mov mov eax, dword ptr [esp + 4]
    mov mov ecx, dword ptr [eax]
    mov mov eax, dword ptr [g_101DA9C8]
    mov mov edx, dword ptr [esp + 8]
    mov mov edx, dword ptr [edx]
    push push ebx
    push push ebp
    push push esi
    mov mov esi, ecx
    imul imul esi, esi, 116
    push push edi
    lea lea edi, [esi + eax + 0A0010h]
    mov mov esi, edx
    imul imul esi, esi, 116
    mov mov ebp, dword ptr [esi + eax + 0A0010h]
    lea lea ebx, [esi + eax + 0A0010h]
    mov mov esi, dword ptr [edi]
    mov mov eax, esi
    sub sub eax, ebp
    jne sub_100238EE
    imul imul ecx, ecx, 52
    imul imul edx, edx, 52
    add add ecx, 010678AC4h
    add add edx, 010678AC4h
    cmp cmp esi, 3
    ja sub_100238EE
    jmp jmp dword ptr [esi*4 + 0100238B8h]
    mov mov edx, dword ptr [edx + 4]
    mov mov esi, dword ptr [ecx + 4]
    push push 0
    push push edx
    call dword ptr [fp_101D4BB4]
    push push 0
    push push esi
    mov mov edi, eax
    call dword ptr [fp_101D4BB4]
    add add esp, 16
    sub sub eax, edi
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    ret ret
    mov mov eax, dword ptr [ecx + 4]
    mov mov ecx, dword ptr [edx + 4]
    pop pop edi
    pop pop esi
    pop pop ebp
    sub sub eax, ecx
    pop pop ebx
    ret ret
    mov mov esi, dword ptr [edx + 4]
    mov mov eax, dword ptr [ecx + 4]
    pop pop edi
    sub sub eax, esi
    pop pop esi
    pop pop ebp
    sar sar eax, 5
    pop pop ebx
    ret ret
    mov mov ecx, dword ptr [edi + 84]
    sub sub ecx, dword ptr [ebx + 84]
    mov mov eax, 078787879h
    imul imul ecx
    sar sar edx, 5
    mov mov eax, edx
    shr shr eax, 31
    add add eax, edx
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    ret ret
FUN_10023800 ENDP
END
