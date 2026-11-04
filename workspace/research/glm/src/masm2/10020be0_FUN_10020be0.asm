.686
.MODEL FLAT, C
EXTRN sub_1001F562:PROC
EXTRN sub_1001F668:PROC
EXTRN sub_10020C85:PROC
EXTRN sub_10023D63:PROC
EXTRN sub_10023DA3:PROC
EXTRN sub_1002B70B:PROC
EXTRN EXTRN fp_101D4C5C:DWORD:DWORD
EXTRN EXTRN fp_101D4C60:DWORD:DWORD
.CODE
FUN_10020be0 PROC
    push push ecx
    mov mov eax, dword ptr [esp + 8]
    cmp cmp eax, 7
    push push ebx
    push push esi
    push push edi
    ja sub_10020C85
    jmp jmp dword ptr [eax*4 + 010020C7Ch]
    mov mov eax, dword ptr [esp + 24]
    mov mov esi, dword ptr [eax]
    call sub_10023D63
    pop pop edi
    pop pop esi
    pop pop ebx
    pop pop ecx
    ret ret
    mov mov ecx, dword ptr [esp + 24]
    mov mov edi, dword ptr [ecx]
    call sub_10023DA3
    pop pop edi
    pop pop esi
    pop pop ebx
    pop pop ecx
    ret ret
    mov mov edx, dword ptr [esp + 24]
    push push edx
    call sub_1001F562
    add add esp, 4
    pop pop edi
    pop pop esi
    pop pop ebx
    pop pop ecx
    ret ret
    mov mov eax, dword ptr [esp + 28]
    mov mov ebx, dword ptr [esp + 24]
    push push eax
    call sub_1001F668
    add add esp, 4
    pop pop edi
    pop pop esi
    pop pop ebx
    pop pop ecx
    ret ret
    mov mov eax, dword ptr [esp + 28]
    mov mov edx, dword ptr [esp + 24]
    lea lea ecx, [eax + eax*4]
    shl shl ecx, 13
    add add ecx, 0101DAA00h
    push push ecx
    push push edx
    call sub_1002B70B
    add add esp, 8
    pop pop edi
    pop pop esi
    pop pop ebx
    pop pop ecx
    ret ret
    call dword ptr [fp_101D4C60]
    pop pop edi
    pop pop esi
    pop pop ebx
    pop pop ecx
    ret ret
    call dword ptr [fp_101D4C5C]
    pop pop edi
    pop pop esi
    pop pop ebx
    pop pop ecx
    ret ret
FUN_10020be0 ENDP
END
