.686
.MODEL FLAT, C
EXTRN sub_1000E81E:PROC
.CODE
FUN_1000e280 PROC
    mov eax, dword ptr [esp + 8]
    push edi
    mov edi, dword ptr [esp + 8]
    cmp edi, eax
    je L7
    push esi
    lea esi, [edi + 4]
    cmp esi, eax
    je L6
    push ebx
    push ebp
    lea ebp, [esi + 4]
    jmp L1
L0:
    mov edi, dword ptr [esp + 20]
L1:
    mov eax, dword ptr [edi]
    mov ecx, dword ptr [esi]
    mov ebx, dword ptr [esp + 28]
    push eax
    push ecx
    call ebx
    add esp, 8
    test eax, eax
    je L2
    cmp edi, esi
    je L5
    cmp esi, ebp
    je L5
    push edi
    jmp L4
L2:
    mov edx, dword ptr [ebp - 8]
    mov eax, dword ptr [esi]
    lea edi, [ebp - 8]
    push edx
    push eax
    call ebx
    add esp, 8
    test eax, eax
    je L5
L3:
    mov ecx, dword ptr [edi - 4]
    mov edx, dword ptr [esi]
    mov ebx, edi
    sub edi, 4
    push ecx
    push edx
    call dword ptr [esp + 0x24]
    add esp, 8
    test eax, eax
    jne L3
    cmp ebx, esi
    je L5
    cmp esi, ebp
    je L5
    push ebx
L4:
    mov eax, esi
    mov ebx, ebp
    call sub_1000E81E
    add esp, 4
L5:
    mov eax, dword ptr [esp + 24]
    add esi, 4
    add ebp, 4
    cmp esi, eax
    jne L0
    pop ebp
    pop ebx
L6:
    pop esi
L7:
    pop edi
    ret
FUN_1000e280 ENDP
END
