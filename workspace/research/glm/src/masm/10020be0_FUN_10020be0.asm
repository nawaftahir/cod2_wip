.686
.MODEL FLAT, C
EXTRN sub_1001F562:PROC
EXTRN sub_1001F668:PROC
EXTRN sub_10023D63:PROC
EXTRN sub_10023DA3:PROC
EXTRN sub_1002B70B:PROC
EXTRN fp_101D4C5C:DWORD
EXTRN fp_101D4C60:DWORD
.CODE
FUN_10020be0 PROC
    push ecx
    mov eax, dword ptr [esp + 8]
    cmp eax, 7
    push ebx
    push esi
    push edi
    ja L0
    jmp dword ptr [eax*4 + 0x10020c7c]
    mov eax, dword ptr [esp + 24]
    mov esi, dword ptr [eax]
    call sub_10023D63
    pop edi
    pop esi
    pop ebx
    pop ecx
    ret
    mov ecx, dword ptr [esp + 24]
    mov edi, dword ptr [ecx]
    call sub_10023DA3
    pop edi
    pop esi
    pop ebx
    pop ecx
    ret
    mov edx, dword ptr [esp + 24]
    push edx
    call sub_1001F562
    add esp, 4
    pop edi
    pop esi
    pop ebx
    pop ecx
    ret
    mov eax, dword ptr [esp + 28]
    mov ebx, dword ptr [esp + 24]
    push eax
    call sub_1001F668
    add esp, 4
    pop edi
    pop esi
    pop ebx
    pop ecx
    ret
    mov eax, dword ptr [esp + 28]
    mov edx, dword ptr [esp + 24]
    lea ecx, [eax + eax*4]
    shl ecx, 13
    add ecx, 0101DAA00h
    push ecx
    push edx
    call sub_1002B70B
    add esp, 8
    pop edi
    pop esi
    pop ebx
    pop ecx
    ret
    call dword ptr [fp_101D4C60]
    pop edi
    pop esi
    pop ebx
    pop ecx
    ret
    call dword ptr [fp_101D4C5C]
L0:
    pop edi
    pop esi
    pop ebx
    pop ecx
    ret
FUN_10020be0 ENDP
END
