.686
.MODEL FLAT, C
EXTRN sub_1008B2F3:PROC
EXTRN sub_1008B330:PROC
EXTRN sub_100A7499:PROC
EXTRN sub_100A74A2:PROC
EXTRN sub_100A7500:PROC
EXTRN sub_100A7506:PROC
EXTRN sub_100A7507:PROC
EXTRN sub_100A751A:PROC
EXTRN sub_100A7520:PROC
EXTRN sub_100A7526:PROC
EXTRN sub_100A7533:PROC
EXTRN sub_100A753D:PROC
EXTRN sub_100A7545:PROC
EXTRN sub_100A7561:PROC
EXTRN sub_100A7569:PROC
EXTRN sub_100A756D:PROC
EXTRN sub_100A7572:PROC
EXTRN sub_100A7579:PROC
EXTRN sub_100A75B8:PROC
EXTRN sub_100A75CD:PROC
EXTRN sub_100A75D2:PROC
EXTRN sub_100A75D8:PROC
EXTRN sub_100A75F9:PROC
EXTRN sub_100A75FA:PROC
EXTRN sub_100A7605:PROC
EXTRN sub_100A761D:PROC
EXTRN sub_100A7655:PROC
EXTRN sub_100A76C8:PROC
EXTRN sub_100A76F2:PROC
.CODE
FUN_100a7207 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 44
    push push ebx
    mov mov ebx, ecx
    mov mov eax, dword ptr [ebx + 0100h]
    mov mov ecx, dword ptr [eax]
    and and ecx, 0FFFFFh
    cmp cmp ecx, 4
    push push esi
    push push edi
    mov mov dword ptr [ebp - 36], ebx
    mov mov dword ptr [ebp - 32], eax
    jne sub_100A7499
    cmp cmp dword ptr [eax + 4], ecx
    jne sub_100A74A2
    mov mov esi, dword ptr [eax + 8]
    mov mov ecx, dword ptr [esi + 12]
    mov mov eax, dword ptr [ebx + 20]
    mov mov edx, dword ptr [eax + ecx*4]
    mov mov eax, dword ptr [ebx + 0100h]
    mov mov eax, dword ptr [eax + 8]
    and and dword ptr [ebp - 4], 0
    mov mov edi, dword ptr [eax + 12]
    mov mov dword ptr [ebp - 44], ecx
    mov mov dword ptr [ebp - 8], eax
    mov mov eax, dword ptr [ebp - 8]
    cmp cmp dword ptr [eax], edi
    je L6
    inc inc dword ptr [ebp - 4]
    add add dword ptr [ebp - 8], 4
    cmp cmp dword ptr [ebp - 4], 3
    jb L0
    mov mov edx, dword ptr [edx + 72]
    or or dword ptr [ebp - 28], -1
    cmp cmp edx, -1
    mov mov dword ptr [ebp - 40], edx
    je L1
    mov mov eax, dword ptr [ebx + 24]
    mov mov eax, dword ptr [eax + edx*4]
    mov mov edx, dword ptr [eax]
    and and edx, 0FFF00000h
    cmp cmp edx, 010000000h
    jne L2
    and and dword ptr [ebp - 4], 0
    cmp cmp dword ptr [eax + 12], 0
    jbe L3
    mov mov edx, dword ptr [ebp - 4]
    mov mov edi, dword ptr [eax + 16]
    shl shl edx, 2
    cmp cmp ecx, dword ptr [edi + edx]
    jne L4
    mov mov edi, dword ptr [eax + 8]
    mov mov edx, dword ptr [edx + edi]
    mov mov dword ptr [ebp - 28], edx
    inc inc dword ptr [ebp - 4]
    mov mov edx, dword ptr [ebp - 4]
    cmp cmp edx, dword ptr [eax + 12]
    jb L3
    xor xor ecx, ecx
    mov mov eax, esi
L0:
    mov mov edx, dword ptr [eax]
    cmp cmp edx, dword ptr [ebp - 28]
    je L7
    inc inc ecx
    add add eax, 4
    cmp cmp ecx, 3
    jb L5
    and and dword ptr [ebp - 28], 0
    mov mov dword ptr [ebp - 8], esi
    mov mov eax, dword ptr [ebp - 8]
    mov mov eax, dword ptr [eax]
    mov mov ecx, dword ptr [ebx + 20]
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov edx, dword ptr [eax + 72]
    cmp cmp edx, -1
    je sub_100A7506
    mov mov eax, dword ptr [ebx + 24]
    mov mov ecx, dword ptr [ebp - 40]
    mov mov edi, dword ptr [eax + ecx*4]
    mov mov esi, dword ptr [eax + edx*4]
    mov mov edx, dword ptr [edi]
    mov mov eax, dword ptr [esi]
    mov mov ecx, edx
    xor xor ecx, eax
    test test ecx, 0FFF00000h
    jne sub_100A7526
    mov mov ecx, 0FFFFFh
    and and edx, ecx
    and and eax, ecx
    test test edx, edx
    mov mov dword ptr [ebp - 12], edx
    mov mov dword ptr [ebp - 16], eax
    je sub_100A753D
    test test eax, eax
    je sub_100A7545
    mov mov eax, dword ptr [edi + 4]
    xor xor edx, edx
    div div dword ptr [ebp - 12]
    xor xor edx, edx
    mov mov dword ptr [ebp - 24], eax
    mov mov eax, dword ptr [esi + 4]
    div div dword ptr [ebp - 16]
    cmp cmp dword ptr [ebp - 24], eax
    jne sub_100A7561
    mov mov eax, dword ptr [ebp - 12]
    cmp cmp eax, dword ptr [edi + 12]
    jne sub_100A756D
    mov mov edx, dword ptr [esi + 12]
    cmp cmp dword ptr [ebp - 16], edx
    jne sub_100A7579
    or or dword ptr [ebp - 20], -1
    and and dword ptr [ebp - 4], 0
    test test edx, edx
    jbe sub_100A751A
    mov mov ecx, dword ptr [esi + 16]
    mov mov eax, dword ptr [ebp - 8]
    mov mov eax, dword ptr [eax]
    cmp cmp dword ptr [ecx], eax
    je sub_100A7520
    inc inc dword ptr [ebp - 4]
    add add ecx, 4
    cmp cmp dword ptr [ebp - 4], edx
    jb sub_100A7507
    jmp sub_100A7533
    mov mov eax, dword ptr [ebp - 32]
    mov mov dword ptr [eax], 011000003h
    jmp sub_100A7605
    mov mov eax, dword ptr [ebp - 4]
    mov mov dword ptr [ebp - 20], eax
    xor xor eax, eax
    test test edx, edx
    jbe sub_100A75B8
    mov mov ecx, dword ptr [edi + 16]
    mov mov edx, dword ptr [ecx]
    cmp cmp edx, dword ptr [ebp - 44]
    je sub_100A7572
    inc inc eax
    add add ecx, 4
    cmp cmp eax, dword ptr [esi + 12]
    jb sub_100A7569
    jmp sub_100A75CD
    cmp cmp eax, -1
    je sub_100A75D2
    cmp cmp dword ptr [ebp - 20], -1
    je sub_100A75D8
    cmp cmp dword ptr [ebp - 24], 0
    mov mov dword ptr [ebp - 4], 1
    jbe sub_100A761D
    mov mov edx, dword ptr [edi + 8]
    mov mov ebx, dword ptr [ebp - 12]
    mov mov ecx, dword ptr [ebp - 16]
    lea lea edx, [edx + eax*4]
    mov mov eax, dword ptr [esi + 8]
    mov mov esi, dword ptr [ebp - 20]
    shl shl ebx, 2
    lea lea eax, [eax + esi*4]
    mov mov esi, dword ptr [ebp - 24]
    shl shl ecx, 2
    mov mov edi, dword ptr [edx]
    cmp cmp edi, dword ptr [eax]
    je sub_100A75F9
    and and dword ptr [ebp - 4], 0
    add add eax, ecx
    add add edx, ebx
    dec dec esi
    jne sub_100A75FA
    cmp cmp dword ptr [ebp - 4], 0
    mov mov ebx, dword ptr [ebp - 36]
    jne sub_100A7655
    inc inc dword ptr [ebp - 28]
    add add dword ptr [ebp - 8], 4
    cmp cmp dword ptr [ebp - 28], 3
    jb sub_100A7500
    mov mov eax, dword ptr [ebx + 0C8h]
    and and eax, 0FFh
    push push eax
    mov mov eax, dword ptr [ebp - 32]
    push push 010116C14h
    push push 011C0h
    push push dword ptr [eax + 60]
    push push ebx
    call sub_1008B2F3
    add add esp, 20
    jmp sub_100A76C8
    mov mov eax, dword ptr [ebx + 0100h]
    mov mov dword ptr [eax], 011000003h
    mov mov ecx, dword ptr [ebx + 0100h]
    push push 3
    pop pop eax
    mov mov dword ptr [ecx + 4], eax
    mov mov ecx, dword ptr [ebx + 0100h]
    mov mov dword ptr [ecx + 12], eax
    xor xor eax, eax
    jmp sub_100A76F2
    push push 010116BECh
    push push 012D4h
    push push dword ptr [eax + 60]
    push push ebx
    call sub_1008B330
    add add esp, 16
    mov mov eax, 080004005h
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret
FUN_100a7207 ENDP
END
