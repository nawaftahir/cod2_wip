.686
.MODEL FLAT, C
EXTRN sub_10006444:PROC
EXTRN sub_10006472:PROC
EXTRN sub_100064DE:PROC
EXTRN sub_1001F7A3:PROC
EXTRN sub_1001FB3E:PROC
EXTRN sub_10020041:PROC
EXTRN sub_1002471C:PROC
EXTRN sub_10024745:PROC
EXTRN sub_10024760:PROC
EXTRN fp_101D4BF8:DWORD
EXTRN fp_101D4BFC:DWORD
EXTRN g_101CE5EF:DWORD
EXTRN g_101CE5F0:DWORD
EXTRN g_10678510:DWORD
.CODE
FUN_100083a0 PROC
    push ecx
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 20]
    push esi
    push edi
    mov edi, dword ptr [eax + 56]
    test edi, edi
    je L6
L0:
    mov eax, dword ptr [edi]
    mov esi, eax
    imul esi, esi, 52
    add esi, 010678AC4h
    cmp dword ptr [esi + 12], 5
    je L5
    mov edx, dword ptr [g_10678510]
    imul eax, eax, 116
    add eax, edx
    mov ebx, eax
    mov eax, dword ptr [ebx]
    cmp eax, 1
    jg L3
    mov al, byte ptr [g_101CE5EF]
    test al, al
    je L5
    cmp dword ptr [esi + 12], 2
    jge L1
    mov ecx, dword ptr [esp + 24]
    lea edx, [edi + 4]
    mov eax, ebp
    call sub_10006444
    test al, al
    jne L5
    mov ecx, dword ptr [esi + 8]
    push ecx
    call dword ptr [fp_101D4BFC]
    add esp, 4
    push esi
    mov eax, ebx
    call sub_10020041
    add esp, 4
L1:
    mov ecx, dword ptr [esp + 24]
    lea edx, [esi + 20]
    mov eax, ebp
    call sub_10006472
    test al, al
    jne L5
    mov edx, dword ptr [esi + 8]
    push edx
    call dword ptr [fp_101D4BF8]
    mov eax, dword ptr [ebx]
    add esp, 4
    cmp eax, 1
    jne L2
    push -1
    push ebx
    push esi
    call sub_1001F7A3
    mov dword ptr [esi + 12], 5
    mov eax, dword ptr [edi]
    add esp, 12
    push eax
    call sub_10024745
    jmp L4
L2:
    push ebx
    push esi
    call sub_1001FB3E
    mov dword ptr [esi + 12], 5
    mov eax, dword ptr [edi]
    add esp, 8
    push eax
    call sub_10024760
    jmp L4
L3:
    cmp eax, 3
    jne L5
    mov al, byte ptr [g_101CE5F0]
    test al, al
    je L5
    mov ecx, dword ptr [esp + 24]
    lea edx, [edi + 4]
    mov eax, ebp
    call sub_100064DE
    test al, al
    jne L5
    mov ecx, dword ptr [edi]
    push ecx
    mov eax, esi
    call sub_1002471C
L4:
    add esp, 4
L5:
    mov edi, dword ptr [edi + 28]
    test edi, edi
    jne L0
L6:
    pop edi
    pop esi
    pop ebp
    pop ebx
    pop ecx
    ret
FUN_100083a0 ENDP
END
