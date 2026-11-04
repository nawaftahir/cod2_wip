.686
.MODEL FLAT, C
EXTRN sub_1001EEE8:PROC
EXTRN sub_1001F07D:PROC
EXTRN sub_1001F5CF:PROC
EXTRN sub_1001F6A8:PROC
EXTRN sub_1001F6C3:PROC
EXTRN sub_1001F6D5:PROC
EXTRN sub_1001F6E4:PROC
EXTRN sub_1001F6EE:PROC
.CODE
FUN_1001f610 PROC
    push push ecx
    push push ebp
    mov mov ebp, dword ptr [esp + 12]
    lea lea ebp, [ebp + ebp*4]
    shl shl ebp, 13
    push push edi
    add add ebp, 0101DAA00h
    push push ebp
    push push ebx
    mov mov dword ptr [esp + 16], ebp
    call sub_1001F5CF
    mov mov cl, byte ptr [ebx + 28]
    mov mov edi, dword ptr [ebx]
    xor xor eax, eax
    add add esp, 8
    test test cl, cl
    mov mov dword ptr [esp + 16], eax
    jbe sub_1001F6D5
    push push esi
    movzx movzx eax, byte ptr [ebx + eax + 30]
    mov mov ecx, dword ptr [edi]
    mov mov esi, dword ptr [ebx + 4]
    shl shl eax, 6
    add add eax, ebp
    cmp cmp ecx, 3
    jne sub_1001F6A8
    mov mov edx, edi
    call sub_1001F07D
    add add edi, 16
    jmp sub_1001F6E4
    cmp cmp ecx, 5
    jne sub_1001F6C3
    add add edi, 16
    jmp sub_1001F6EE
    mov mov ebp, dword ptr [edi + 4]
    mov mov edx, dword ptr [esi + 56]
    movsx movsx ebp, word ptr [ebp + 6]
    push push edx
    add add ebp, eax
    lea lea edx, [esi + 20]
    lea lea ecx, [edi + 8]
    add add esi, 60
    push push ebp
    call sub_1001EEE8
    mov mov ebp, dword ptr [esp + 20]
    add add esp, 8
    add add edi, 56
    mov mov eax, dword ptr [esp + 20]
    movzx movzx ecx, byte ptr [ebx + 28]
    inc inc eax
    cmp cmp eax, ecx
    mov mov dword ptr [esp + 20], eax
    jl sub_1001F6D5
    pop pop esi
    pop pop edi
    pop pop ebp
    pop pop ecx
    ret ret
FUN_1001f610 ENDP
END
