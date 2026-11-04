.686
.MODEL FLAT, C
EXTRN sub_1008B2F3:PROC
EXTRN sub_1008B330:PROC
.CODE
FUN_100a7207 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 44
    push ebx
    mov ebx, ecx
    mov eax, dword ptr [ebx + 000000100h]
    mov ecx, dword ptr [eax]
    and ecx, 0000FFFFFh
    cmp ecx, 4
    push esi
    push edi
    mov dword ptr [ebp - 36], ebx
    mov dword ptr [ebp - 32], eax
    jne L17
    cmp dword ptr [eax + 4], ecx
    jne L17
    mov esi, dword ptr [eax + 8]
    mov ecx, dword ptr [esi + 12]
    mov eax, dword ptr [ebx + 20]
    mov edx, dword ptr [eax + ecx*4]
    mov eax, dword ptr [ebx + 000000100h]
    mov eax, dword ptr [eax + 8]
    and dword ptr [ebp - 4], 0
    mov edi, dword ptr [eax + 12]
    mov dword ptr [ebp - 44], ecx
    mov dword ptr [ebp - 8], eax
L0:
    mov eax, dword ptr [ebp - 8]
    cmp dword ptr [eax], edi
    je L7
    inc dword ptr [ebp - 4]
    add dword ptr [ebp - 8], 4
    cmp dword ptr [ebp - 4], 3
    jb L0
    mov edx, dword ptr [edx + 72]
    or dword ptr [ebp - 28], 0FFFFFFFFh
    cmp edx, -1
    mov dword ptr [ebp - 40], edx
    je L3
    mov eax, dword ptr [ebx + 24]
    mov eax, dword ptr [eax + edx*4]
    mov edx, dword ptr [eax]
    and edx, 0FFF00000h
    cmp edx, 010000000h
    jne L3
    and dword ptr [ebp - 4], 0
    cmp dword ptr [eax + 12], 0
    jbe L3
L1:
    mov edx, dword ptr [ebp - 4]
    mov edi, dword ptr [eax + 16]
    shl edx, 2
    cmp ecx, dword ptr [edi + edx]
    jne L2
    mov edi, dword ptr [eax + 8]
    mov edx, dword ptr [edx + edi]
    mov dword ptr [ebp - 28], edx
L2:
    inc dword ptr [ebp - 4]
    mov edx, dword ptr [ebp - 4]
    cmp edx, dword ptr [eax + 12]
    jb L1
L3:
    xor ecx, ecx
    mov eax, esi
L4:
    mov edx, dword ptr [eax]
    cmp edx, dword ptr [ebp - 28]
    je L7
    inc ecx
    add eax, 4
    cmp ecx, 3
    jb L4
    and dword ptr [ebp - 28], 0
    mov dword ptr [ebp - 8], esi
L5:
    mov eax, dword ptr [ebp - 8]
    mov eax, dword ptr [eax]
    mov ecx, dword ptr [ebx + 20]
    mov eax, dword ptr [ecx + eax*4]
    mov edx, dword ptr [eax + 72]
    cmp edx, -1
    je L14
    mov eax, dword ptr [ebx + 24]
    mov ecx, dword ptr [ebp - 40]
    mov edi, dword ptr [eax + ecx*4]
    mov esi, dword ptr [eax + edx*4]
    mov edx, dword ptr [edi]
    mov eax, dword ptr [esi]
    mov ecx, edx
    xor ecx, eax
    test ecx, 0FFF00000h
    jne L14
    mov ecx, 0000FFFFFh
    and edx, ecx
    and eax, ecx
    test edx, edx
    mov dword ptr [ebp - 12], edx
    mov dword ptr [ebp - 16], eax
    je L14
    test eax, eax
    je L14
    mov eax, dword ptr [edi + 4]
    xor edx, edx
    div dword ptr [ebp - 12]
    xor edx, edx
    mov dword ptr [ebp - 24], eax
    mov eax, dword ptr [esi + 4]
    div dword ptr [ebp - 16]
    cmp dword ptr [ebp - 24], eax
    jne L14
    mov eax, dword ptr [ebp - 12]
    cmp eax, dword ptr [edi + 12]
    jne L14
    mov edx, dword ptr [esi + 12]
    cmp dword ptr [ebp - 16], edx
    jne L14
    or dword ptr [ebp - 20], 0FFFFFFFFh
    and dword ptr [ebp - 4], 0
    test edx, edx
    jbe L9
    mov ecx, dword ptr [esi + 16]
L6:
    mov eax, dword ptr [ebp - 8]
    mov eax, dword ptr [eax]
    cmp dword ptr [ecx], eax
    je L8
    inc dword ptr [ebp - 4]
    add ecx, 4
    cmp dword ptr [ebp - 4], edx
    jb L6
    jmp L9
L7:
    mov eax, dword ptr [ebp - 32]
    mov dword ptr [eax], 011000003h
    jmp L16
L8:
    mov eax, dword ptr [ebp - 4]
    mov dword ptr [ebp - 20], eax
L9:
    xor eax, eax
    test edx, edx
    jbe L14
    mov ecx, dword ptr [edi + 16]
L10:
    mov edx, dword ptr [ecx]
    cmp edx, dword ptr [ebp - 44]
    je L11
    inc eax
    add ecx, 4
    cmp eax, dword ptr [esi + 12]
    jb L10
    jmp L14
L11:
    cmp eax, -1
    je L14
    cmp dword ptr [ebp - 20], -1
    je L14
    cmp dword ptr [ebp - 24], 0
    mov dword ptr [ebp - 4], 1
    jbe L15
    mov edx, dword ptr [edi + 8]
    mov ebx, dword ptr [ebp - 12]
    mov ecx, dword ptr [ebp - 16]
    lea edx, [edx + eax*4]
    mov eax, dword ptr [esi + 8]
    mov esi, dword ptr [ebp - 20]
    shl ebx, 2
    lea eax, [eax + esi*4]
    mov esi, dword ptr [ebp - 24]
    shl ecx, 2
L12:
    mov edi, dword ptr [edx]
    cmp edi, dword ptr [eax]
    je L13
    and dword ptr [ebp - 4], 0
L13:
    add eax, ecx
    add edx, ebx
    dec esi
    jne L12
    cmp dword ptr [ebp - 4], 0
    mov ebx, dword ptr [ebp - 36]
    jne L15
L14:
    inc dword ptr [ebp - 28]
    add dword ptr [ebp - 8], 4
    cmp dword ptr [ebp - 28], 3
    jb L5
    mov eax, dword ptr [ebx + 0000000C8h]
    and eax, 0000000FFh
    push eax
    mov eax, dword ptr [ebp - 32]
    push 010116C14h
    push 0000011C0h
    push dword ptr [eax + 60]
    push ebx
    call sub_1008B2F3
    add esp, 20
    jmp L18
L15:
    mov eax, dword ptr [ebx + 000000100h]
    mov dword ptr [eax], 011000003h
    mov ecx, dword ptr [ebx + 000000100h]
    push 3
    pop eax
    mov dword ptr [ecx + 4], eax
    mov ecx, dword ptr [ebx + 000000100h]
    mov dword ptr [ecx + 12], eax
L16:
    xor eax, eax
    jmp L19
L17:
    push 010116BECh
    push 0000012D4h
    push dword ptr [eax + 60]
    push ebx
    call sub_1008B330
    add esp, 16
L18:
    mov eax, 080004005h
L19:
    pop edi
    pop esi
    pop ebx
    leave
    ret
FUN_100a7207 ENDP
END
