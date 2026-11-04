.686
.MODEL FLAT, C
EXTRN sub_1001C341:PROC
EXTRN sub_1001C35A:PROC
EXTRN sub_1001C3DF:PROC
EXTRN g_101CE708:DWORD
.CODE
FUN_1001c400 PROC
    push ecx
    push ebp
    mov ebp, dword ptr [esp + 12]
    push esi
    mov esi, eax
    mov eax, dword ptr [g_101CE708]
    push edi
    mov edi, ecx
    cmp dword ptr [eax + 8], 2
    jne L0
    push ebp
    mov eax, edi
    call sub_1001C3DF
    add esp, 4
    pop edi
    pop esi
    pop ebp
    pop ecx
    ret
L0:
    cmp word ptr [esi + 6], 0
    push ebx
    mov dword ptr [esp + 16], 0
    jbe L2
    lea ebx, [esi + 26]
    lea ebx, [ebx]
L1:
    mov ecx, dword ptr [ebx + 6]
    movzx edx, word ptr [ebx]
    mov eax, dword ptr [esi]
    push ecx
    push edx
    push eax
    push ebp
    call sub_1001C341
    add esp, 16
    test al, al
    je L3
    mov ecx, dword ptr [ebx + 2]
    movzx edx, word ptr [ebx - 2]
    mov eax, dword ptr [esi]
    push ecx
    push edx
    push eax
    push ebp
    call sub_1001C35A
    add esp, 16
    test al, al
    je L3
    mov eax, dword ptr [esp + 16]
    movzx ecx, word ptr [esi + 6]
    inc eax
    add ebx, 28
    cmp eax, ecx
    mov dword ptr [esp + 16], eax
    jl L1
L2:
    pop ebx
    pop edi
    pop esi
    mov al, 1
    pop ebp
    pop ecx
    ret
L3:
    pop ebx
    pop edi
    pop esi
    xor al, al
    pop ebp
    pop ecx
    ret
FUN_1001c400 ENDP
END
