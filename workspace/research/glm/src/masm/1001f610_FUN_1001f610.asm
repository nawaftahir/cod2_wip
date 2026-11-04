.686
.MODEL FLAT, C
EXTRN sub_1001EEE8:PROC
EXTRN sub_1001F07D:PROC
EXTRN sub_1001F5CF:PROC
.CODE
FUN_1001f610 PROC
    push ecx
    push ebp
    mov ebp, dword ptr [esp + 12]
    lea ebp, [ebp + ebp*4]
    shl ebp, 13
    push edi
    add ebp, 0101DAA00h
    push ebp
    push ebx
    mov dword ptr [esp + 16], ebp
    call sub_1001F5CF
    mov cl, byte ptr [ebx + 28]
    mov edi, dword ptr [ebx]
    xor eax, eax
    add esp, 8
    test cl, cl
    mov dword ptr [esp + 16], eax
    jbe L4
    push esi
L0:
    movzx eax, byte ptr [ebx + eax + 30]
    mov ecx, dword ptr [edi]
    mov esi, dword ptr [ebx + 4]
    shl eax, 6
    add eax, ebp
    cmp ecx, 3
    jne L1
    mov edx, edi
    call sub_1001F07D
    add edi, 16
    jmp L3
L1:
    cmp ecx, 5
    jne L2
    add edi, 16
    jmp L3
L2:
    mov ebp, dword ptr [edi + 4]
    mov edx, dword ptr [esi + 56]
    movsx ebp, word ptr [ebp + 6]
    push edx
    add ebp, eax
    lea edx, [esi + 20]
    lea ecx, [edi + 8]
    add esi, 60
    push ebp
    call sub_1001EEE8
    mov ebp, dword ptr [esp + 20]
    add esp, 8
    add edi, 56
L3:
    mov eax, dword ptr [esp + 20]
    movzx ecx, byte ptr [ebx + 28]
    inc eax
    cmp eax, ecx
    mov dword ptr [esp + 20], eax
    jl L0
    pop esi
L4:
    pop edi
    pop ebp
    pop ecx
    ret
FUN_1001f610 ENDP
END
