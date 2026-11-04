.686
.MODEL FLAT, C
.CODE
FUN_100c48ff PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 36
    mov eax, dword ptr [ebp + 8]
    mov eax, dword ptr [eax]
    push ebx
    mov ebx, dword ptr [ecx + 16]
    push esi
    mov esi, dword ptr [ecx + 20]
    push edi
    shl eax, 2
    mov edi, dword ptr [esi + eax]
    mov dword ptr [ebp - 4], edi
    mov edi, dword ptr [edi + 4]
    mov edi, dword ptr [ebx + edi*4]
    xor edx, edx
    test byte ptr [edi + 4], 000000080h
    je L0
    mov eax, dword ptr [ebp + 20]
    mov dword ptr [eax], 000E40000h
    jmp L14
L0:
    mov ebx, dword ptr [ebp + 16]
    xor edi, edi
    inc edi
    test ebx, 000010000h
    je L1
    and dword ptr [ebp - 20], 0
    mov edx, edi
L1:
    test ebx, 000020000h
    je L2
    mov dword ptr [ebp + edx*4 - 20], edi
    inc edx
L2:
    test ebx, 000040000h
    je L3
    mov dword ptr [ebp + edx*4 - 20], 2
    inc edx
L3:
    test ebx, 000080000h
    je L4
    mov dword ptr [ebp + edx*4 - 20], 3
    inc edx
L4:
    mov ebx, dword ptr [ebp + 12]
    cmp ebx, edx
    jbe L5
    mov ebx, edx
L5:
    xor edx, edx
    test ebx, ebx
    jbe L9
    mov ecx, dword ptr [ecx + 20]
    mov eax, dword ptr [ecx + eax]
    mov eax, dword ptr [eax + 16]
L6:
    mov edi, dword ptr [ebp + 8]
    mov edi, dword ptr [edi + edx*4]
    mov edi, dword ptr [ecx + edi*4]
    cmp eax, dword ptr [edi + 16]
    jne L7
    inc edx
    cmp edx, ebx
    jb L6
L7:
    cmp edx, ebx
    jae L9
    xor eax, eax
L8:
    mov dword ptr [ebp + eax*4 - 36], eax
    inc eax
    cmp eax, 4
    jb L8
    jmp L10
L9:
    mov eax, dword ptr [ebp - 4]
    mov eax, dword ptr [eax + 16]
    lea edi, [ebp - 36]
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
L10:
    xor eax, eax
    test ebx, ebx
    jbe L12
    mov ecx, dword ptr [ebp + 8]
    lea edx, [ebp - 20]
    sub ecx, edx
L11:
    mov edi, dword ptr [ebp + eax*4 - 20]
    lea edx, [ecx + eax*4]
    mov edx, dword ptr [ebp + edx - 20]
    mov edx, dword ptr [esi + edx*4]
    mov edx, dword ptr [edx + 16]
    inc eax
    cmp eax, ebx
    mov dword ptr [ebp + edi*4 - 36], edx
    jb L11
L12:
    push 16
    xor edx, edx
    pop ecx
    lea eax, [ebp - 36]
L13:
    mov esi, dword ptr [eax]
    shl esi, cl
    add eax, 4
    or edx, esi
    inc ecx
    inc ecx
    cmp ecx, 24
    jb L13
    mov eax, dword ptr [ebp + 20]
    mov dword ptr [eax], edx
L14:
    pop edi
    pop esi
    xor eax, eax
    pop ebx
    leave
    ret 16
FUN_100c48ff ENDP
END
