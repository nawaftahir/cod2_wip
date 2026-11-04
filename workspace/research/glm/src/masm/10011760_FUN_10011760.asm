.686
.MODEL FLAT, C
EXTRN sub_10005227:PROC
EXTRN fp_101D49C8:DWORD
EXTRN fp_101D49CC:DWORD
EXTRN fp_101D4A6C:DWORD
EXTRN fp_101D4AC4:DWORD
EXTRN g_101CE708:DWORD
EXTRN g_101CE7F8:DWORD
.CODE
FUN_10011760 PROC
    push ebx
    push esi
    push edi
    mov edi, eax
    movzx eax, byte ptr [edi + 0000000CCh]
    movzx ecx, byte ptr [edi + 0000000CDh]
    push eax
    push ecx
    push 010193F8Ch
    push 0
    call dword ptr [fp_101D49C8]
    movzx edx, byte ptr [edi + 0000000C4h]
    movzx eax, byte ptr [edi + 0000000C5h]
    push edx
    push eax
    push 010193F6Ch
    push 0
    call dword ptr [fp_101D49C8]
    add esp, 32
    call sub_10005227
    mov edi, eax
    xor ebx, ebx
    mov esi, 2
L0:
    mov edx, 1
    mov ecx, esi
    shl edx, cl
    test edi, edx
    je L2
    cmp esi, 1
    mov ebx, esi
    mov eax, 010193FB8h
    je L1
    mov eax, 010193FACh
L1:
    push eax
    push 010193F50h
    push 0
    call dword ptr [fp_101D49C8]
    add esp, 12
L2:
    dec esi
    jne L0
    test ebx, ebx
    jne L3
    push 010193F28h
    push ebx
    call dword ptr [fp_101D49CC]
    add esp, 8
L3:
    mov eax, dword ptr [g_101CE7F8]
    mov ecx, dword ptr [eax + 8]
    test ecx, ecx
    je L8
    mov edx, 1
    shl edx, cl
    test edi, edx
    je L5
    mov ebx, ecx
    cmp ebx, 1
    mov esi, 010193FB8h
    je L4
    mov esi, 010193FACh
L4:
    push eax
    call dword ptr [fp_101D4AC4]
    push eax
    push esi
    push 010193EE8h
    push 0
    call dword ptr [fp_101D49C8]
    mov eax, dword ptr [g_101CE708]
    add esp, 20
    push ebx
    push eax
    call dword ptr [fp_101D4A6C]
    add esp, 8
    pop edi
    pop esi
    pop ebx
    ret
L5:
    cmp ecx, 1
    mov ecx, 010193FB8h
    je L6
    mov ecx, 010193FACh
L6:
    cmp ebx, 1
    mov eax, 010193FB8h
    je L7
    mov eax, 010193FACh
L7:
    push ecx
    push eax
    push 010193EA0h
    push 0
    call dword ptr [fp_101D49C8]
    mov eax, dword ptr [g_101CE708]
    add esp, 16
    push ebx
    push eax
    call dword ptr [fp_101D4A6C]
    add esp, 8
    pop edi
    pop esi
    pop ebx
    ret
L8:
    cmp ebx, 1
    mov eax, 010193FB8h
    je L9
    mov eax, 010193FACh
L9:
    push eax
    push 010193E50h
    push 0
    call dword ptr [fp_101D49C8]
    mov eax, dword ptr [g_101CE708]
    add esp, 12
    push ebx
    push eax
    call dword ptr [fp_101D4A6C]
    add esp, 8
    pop edi
    pop esi
    pop ebx
    ret
FUN_10011760 ENDP
END
