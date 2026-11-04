.686
.MODEL FLAT, C
EXTRN sub_1001C341:PROC
EXTRN sub_1001C35A:PROC
EXTRN sub_1001C3DF:PROC
EXTRN sub_1001C4BC:PROC
EXTRN sub_1001C4C5:PROC
EXTRN sub_1001C4E5:PROC
EXTRN sub_1001C4FE:PROC
EXTRN EXTRN g_101CE708:DWORD:DWORD
.CODE
FUN_1001c400 PROC
    push push ecx
    push push ebp
    mov mov ebp, dword ptr [esp + 12]
    push push esi
    mov mov esi, eax
    mov mov eax, dword ptr [g_101CE708]
    push push edi
    mov mov edi, ecx
    cmp cmp dword ptr [eax + 8], 2
    jne L0
    push push ebp
    mov mov eax, edi
    call sub_1001C3DF
    add add esp, 4
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ecx
    ret ret
    cmp cmp word ptr [esi + 6], 0
    push push ebx
    mov mov dword ptr [esp + 16], 0
    jbe sub_1001C4BC
    lea lea ebx, [esi + 26]
    lea lea ebx, [ebx]
    mov mov ecx, dword ptr [ebx + 6]
    movzx movzx edx, word ptr [ebx]
    mov mov eax, dword ptr [esi]
    push push ecx
    push push edx
    push push eax
    push push ebp
    call sub_1001C341
    add add esp, 16
    test test al, al
    je sub_1001C4E5
    mov mov ecx, dword ptr [ebx + 2]
    movzx movzx edx, word ptr [ebx - 2]
    mov mov eax, dword ptr [esi]
    push push ecx
    push push edx
    push push eax
    push push ebp
    call sub_1001C35A
    add add esp, 16
    test test al, al
    je sub_1001C4FE
    mov mov eax, dword ptr [esp + 16]
    movzx movzx ecx, word ptr [esi + 6]
    inc inc eax
    add add ebx, 28
    cmp cmp eax, ecx
    mov mov dword ptr [esp + 16], eax
    jl sub_1001C4C5
    pop pop ebx
    pop pop edi
    pop pop esi
    mov mov al, 1
    pop pop ebp
    pop pop ecx
    ret ret
    pop pop ebx
    pop pop edi
    pop pop esi
    xor xor al, al
    pop pop ebp
    pop pop ecx
    ret ret
FUN_1001c400 ENDP
END
