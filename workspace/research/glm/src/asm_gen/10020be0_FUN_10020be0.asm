; FUN_10020be0 @ 0x10020be0 — auto-synthesized
    EXTRN fp_101d4c5c:DWORD
    EXTRN fp_101d4c60:DWORD
    sub_1001f562 PROTO C
    sub_1001f668 PROTO C
    sub_10023d63 PROTO C
    sub_10023da3 PROTO C
    sub_1002b70b PROTO C
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
    mov eax, dword ptr [esp + 0x18]
    mov esi, dword ptr [eax]
    call sub_10023d63
    pop edi
    pop esi
    pop ebx
    pop ecx
    ret
    mov ecx, dword ptr [esp + 0x18]
    mov edi, dword ptr [ecx]
    call sub_10023da3
    pop edi
    pop esi
    pop ebx
    pop ecx
    ret
    mov edx, dword ptr [esp + 0x18]
    push edx
    call sub_1001f562
    add esp, 4
    pop edi
    pop esi
    pop ebx
    pop ecx
    ret
    mov eax, dword ptr [esp + 0x1c]
    mov ebx, dword ptr [esp + 0x18]
    push eax
    call sub_1001f668
    add esp, 4
    pop edi
    pop esi
    pop ebx
    pop ecx
    ret
    mov eax, dword ptr [esp + 0x1c]
    mov edx, dword ptr [esp + 0x18]
    lea ecx, [eax + eax*4]
    shl ecx, 0xd
    add ecx, 0x101daa00
    push ecx
    push edx
    call sub_1002b70b
    add esp, 8
    pop edi
    pop esi
    pop ebx
    pop ecx
    ret
    call dword ptr [fp_101d4c60]
    pop edi
    pop esi
    pop ebx
    pop ecx
    ret
    call dword ptr [fp_101d4c5c]
    pop edi
    pop esi
    pop ebx
    pop ecx
    ret
FUN_10020be0 ENDP
END