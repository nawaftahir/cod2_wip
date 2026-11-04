.686
.MODEL FLAT, C
EXTRN sub_100285AF:PROC
.CODE
FUN_10028260 PROC
    mov ecx, dword ptr [esp + 12]
    sub esp, 20
    push ebx
    mov ebx, dword ptr [esp + 40]
    push ebp
    push esi
    push edi
    mov edi, dword ptr [esp + 44]
    mov eax, ecx
    sub eax, edi
    sar eax, 3
    cdq
    sub eax, edx
    sar eax, 1
    push ebx
    add ecx, -8
    lea esi, [edi + eax*8]
    push ecx
    push esi
    mov eax, edi
    call sub_100285AF
    add esp, 12
    cmp edi, esi
    lea ebp, [esi + 8]
    jae L1
    lea esp, [esp]
L0:
    lea edi, [esi - 8]
    push esi
    push edi
    call ebx
    add esp, 8
    test al, al
    jne L1
    push edi
    push esi
    call ebx
    add esp, 8
    test al, al
    jne L1
    mov eax, dword ptr [esp + 44]
    mov esi, edi
    cmp eax, esi
    jb L0
L1:
    mov edi, dword ptr [esp + 48]
    cmp ebp, edi
    jae L3
    jmp L2
    lea ecx, [ecx]
L2:
    push esi
    push ebp
    call ebx
    add esp, 8
    test al, al
    jne L3
    push ebp
    push esi
    call ebx
    add esp, 8
    test al, al
    jne L3
    add ebp, 8
    cmp ebp, edi
    jb L2
L3:
    mov ebx, esi
    mov edi, ebp
    mov dword ptr [esp + 16], ebx
L4:
    cmp edi, dword ptr [esp + 48]
    jae L7
    jmp L5
    lea ecx, [ecx]
L5:
    push edi
    push esi
    call dword ptr [esp + 0x3c]
    add esp, 8
    test al, al
    jne L6
    push esi
    push edi
    call dword ptr [esp + 0x3c]
    add esp, 8
    test al, al
    jne L7
    mov eax, ebp
    mov edx, dword ptr [eax + 4]
    mov ecx, dword ptr [eax]
    mov dword ptr [esp + 32], edx
    mov edx, dword ptr [edi]
    mov dword ptr [eax], edx
    mov edx, dword ptr [edi + 4]
    mov dword ptr [eax + 4], edx
    mov eax, dword ptr [esp + 32]
    add ebp, 8
    mov dword ptr [edi], ecx
    mov dword ptr [edi + 4], eax
L6:
    mov eax, dword ptr [esp + 48]
    add edi, 8
    cmp edi, eax
    jb L5
L7:
    cmp ebx, dword ptr [esp + 44]
    jbe L11
    add ebx, -8
    nop
L8:
    push esi
    push ebx
    call dword ptr [esp + 0x3c]
    add esp, 8
    test al, al
    jne L9
    push ebx
    push esi
    call dword ptr [esp + 0x3c]
    add esp, 8
    test al, al
    jne L10
    mov edx, dword ptr [ebx]
    mov eax, dword ptr [esi - 8]
    mov ecx, dword ptr [esi - 4]
    sub esi, 8
    mov dword ptr [esi], edx
    mov edx, dword ptr [ebx + 4]
    mov dword ptr [esi + 4], edx
    mov dword ptr [ebx], eax
    mov dword ptr [ebx + 4], ecx
L9:
    mov eax, dword ptr [esp + 16]
    mov ecx, dword ptr [esp + 44]
    sub eax, 8
    sub ebx, 8
    cmp ecx, eax
    mov dword ptr [esp + 16], eax
    jb L8
L10:
    mov ebx, dword ptr [esp + 16]
    cmp ebx, dword ptr [esp + 44]
L11:
    mov eax, dword ptr [esp + 48]
    jne L13
    cmp edi, eax
    je L16
    cmp ebp, edi
    je L12
    mov edx, dword ptr [ebp]
    mov eax, dword ptr [esi]
    mov ecx, dword ptr [esi + 4]
    mov dword ptr [esi], edx
    mov edx, dword ptr [ebp + 4]
    mov dword ptr [esi + 4], edx
    mov dword ptr [ebp], eax
    mov dword ptr [ebp + 4], ecx
L12:
    mov ecx, esi
    mov edx, dword ptr [ecx]
    mov dword ptr [esp + 20], edx
    mov edx, dword ptr [ecx + 4]
    mov eax, edi
    mov dword ptr [esp + 24], edx
    mov edx, dword ptr [eax]
    mov dword ptr [ecx], edx
    mov edx, dword ptr [eax + 4]
    mov dword ptr [ecx + 4], edx
    mov ecx, dword ptr [esp + 20]
    mov edx, dword ptr [esp + 24]
    add ebp, 8
    add esi, 8
    add edi, 8
    mov dword ptr [eax], ecx
    mov dword ptr [eax + 4], edx
    jmp L4
L13:
    sub ebx, 8
    cmp edi, eax
    mov dword ptr [esp + 16], ebx
    jne L15
    sub esi, 8
    cmp ebx, esi
    je L14
    mov edx, dword ptr [esi]
    mov eax, dword ptr [ebx]
    mov ecx, dword ptr [ebx + 4]
    mov dword ptr [ebx], edx
    mov edx, dword ptr [esi + 4]
    mov dword ptr [ebx + 4], edx
    mov dword ptr [esi], eax
    mov dword ptr [esi + 4], ecx
L14:
    mov edx, dword ptr [ebp - 8]
    mov eax, dword ptr [esi]
    mov ecx, dword ptr [esi + 4]
    sub ebp, 8
    mov dword ptr [esi], edx
    mov edx, dword ptr [ebp + 4]
    mov dword ptr [esi + 4], edx
    mov dword ptr [ebp], eax
    mov dword ptr [ebp + 4], ecx
    jmp L4
L15:
    mov edx, dword ptr [ebx]
    mov eax, dword ptr [edi]
    mov ecx, dword ptr [edi + 4]
    mov dword ptr [edi], edx
    mov edx, dword ptr [ebx + 4]
    mov dword ptr [edi + 4], edx
    mov dword ptr [ebx], eax
    mov dword ptr [ebx + 4], ecx
    add edi, 8
    jmp L4
L16:
    mov eax, dword ptr [esp + 40]
    pop edi
    mov dword ptr [eax], esi
    pop esi
    mov dword ptr [eax + 4], ebp
FUN_10028260 ENDP
END
