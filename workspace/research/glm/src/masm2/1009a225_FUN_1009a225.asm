.686
.MODEL FLAT, C
EXTRN sub_1009A337:PROC
EXTRN sub_1009A33A:PROC
EXTRN sub_1009A34B:PROC
EXTRN sub_1009A353:PROC
EXTRN sub_1009A36D:PROC
EXTRN sub_1009A381:PROC
EXTRN sub_1009A389:PROC
EXTRN sub_1009A3B9:PROC
EXTRN sub_1009A3C8:PROC
EXTRN sub_1009A3CF:PROC
EXTRN sub_1009A3E1:PROC
EXTRN sub_1009A3E7:PROC
EXTRN sub_1009A3ED:PROC
EXTRN sub_1009A41E:PROC
.CODE
FUN_1009a225 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push ecx
    push push ebx
    push push esi
    mov mov esi, dword ptr [ebp + 8]
    push push edi
    mov mov ebx, ecx
    xor xor edi, edi
    test test esi, esi
    mov mov dword ptr [ebp - 4], ebx
    jne L0
    xor xor eax, eax
    jmp sub_1009A34B
    mov mov eax, dword ptr [esi + 4]
    dec dec eax
    je L7
    push push 5
    pop pop ecx
    sub sub eax, ecx
    je L7
    dec dec eax
    dec dec eax
L0:
    je L4
    dec dec eax
    je L2
    dec dec eax
    dec dec eax
    jne sub_1009A36D
    push push dword ptr [ebp + 12]
    push push dword ptr [esi + 32]
    mov mov ecx, ebx
    call L1
L1:
    mov mov edi, eax
    jmp sub_1009A381
    mov mov edi, dword ptr [esi + 28]
    imul imul edi, dword ptr [esi + 24]
    mov mov esi, dword ptr [esi + 20]
    cmp cmp esi, 29
    push push 3
    pop pop eax
    ja L6
    movzx movzx edx, byte ptr [esi + 01009A34Ch]
    jmp jmp dword ptr [edx*4 + 01009A334h]
    xor xor eax, eax
    jmp L8
    xor xor eax, eax
    inc inc eax
    jmp L10
    push push 2
    jmp L9
    push push 4
    pop pop eax
    jmp sub_1009A337
    mov mov eax, ecx
    test test edi, edi
    jbe sub_1009A3B9
    mov mov ecx, dword ptr [ebp + 12]
    mov mov edx, edi
    mov mov dword ptr [ecx], eax
    add add ecx, 16
    dec dec edx
    jne sub_1009A353
    jmp sub_1009A3C8
    xor xor ebx, ebx
    cmp cmp dword ptr [esi + 20], ebx
    jbe sub_1009A3CF
    mov mov ecx, dword ptr [ebp - 4]
    mov mov eax, edi
    shl shl eax, 4
    add add eax, dword ptr [ebp + 12]
    push push eax
    push push dword ptr [esi + 16]
    call L3
L3:
    add add edi, eax
    inc inc ebx
    cmp cmp ebx, dword ptr [esi + 20]
    jb sub_1009A389
    jmp sub_1009A3ED
    push push dword ptr [ebp + 12]
    push push dword ptr [esi + 24]
    jmp sub_1009A33A
    cmp cmp dword ptr [esi + 4], 1
    jne sub_1009A3E7
    mov mov eax, edi
    shl shl eax, 4
    add add eax, dword ptr [ebp + 12]
    mov mov ecx, ebx
    push push eax
    push push dword ptr [esi + 8]
    call L5
L5:
    mov mov esi, dword ptr [esi + 12]
    add add edi, eax
    test test esi, esi
    jne sub_1009A3E1
    test test esi, esi
    je sub_1009A41E
    mov mov eax, edi
L7:
    shl shl eax, 4
    add add eax, dword ptr [ebp + 12]
    mov mov ecx, ebx
    push push eax
    push push esi
    call L8
L8:
    add add edi, eax
    mov mov eax, edi
L9:
    pop pop edi
L10:
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 8
FUN_1009a225 ENDP
END
