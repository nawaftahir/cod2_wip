.686
.MODEL FLAT, C
.CODE
FUN_10084220 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ebx
    mov ebx, dword ptr [ebp + 12]
    cmp ebx, -1
    jne L0
    mov ebx, dword ptr [ecx + 4]
    add ebx, 3
    shr ebx, 2
    inc ebx
    inc ebx
    jmp L1
L0:
    mov eax, dword ptr [ecx + 4]
    add eax, 3
    shr eax, 2
    inc eax
    inc eax
    cmp ebx, eax
    jb L2
L1:
    cmp ebx, 000008000h
    jbe L3
L2:
    mov eax, 080004005h
    jmp L7
L3:
    mov eax, dword ptr [ebp + 8]
    and dword ptr [ebp + 8], 0
    lea edx, [ebx - 1]
    and edx, 000007FFFh
    shl edx, 16
    or edx, 00000FFFEh
    mov dword ptr [eax], edx
    mov edx, dword ptr [ecx]
    mov dword ptr [eax + 4], edx
    mov edx, dword ptr [ecx + 8]
    add eax, 8
    test edx, edx
    push edi
    mov dword ptr [ebp + 12], eax
    je L6
    push esi
L4:
    test byte ptr [edx + 8], 4
    jne L5
    mov eax, dword ptr [ebp + 8]
    mov edi, dword ptr [ebp + 12]
    lea ecx, [eax + 3]
    and ecx, 0FFFFFFFCh
    sub ecx, eax
    mov dword ptr [ebp - 4], ecx
    mov esi, ecx
    shr ecx, 2
    mov eax, 0ABABABABh
    rep stosd dword ptr es:[edi], eax
    mov ecx, esi
    and ecx, 3
    rep stosb byte ptr es:[edi], al
    mov eax, esi
    add dword ptr [ebp + 12], eax
    add dword ptr [ebp + 8], eax
L5:
    mov ecx, dword ptr [edx + 4]
    mov esi, dword ptr [edx]
    mov edi, dword ptr [ebp + 12]
    mov eax, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, eax
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov eax, dword ptr [edx + 4]
    mov edx, dword ptr [edx + 16]
    add dword ptr [ebp + 12], eax
    add dword ptr [ebp + 8], eax
    test edx, edx
    jne L4
    pop esi
L6:
    mov edi, dword ptr [ebp + 12]
    lea ecx, [ebx*4 - 8]
    sub ecx, dword ptr [ebp + 8]
    mov eax, 0ABABABABh
    mov edx, ecx
    shr ecx, 2
    rep stosd dword ptr es:[edi], eax
    mov ecx, edx
    and ecx, 3
    rep stosb byte ptr es:[edi], al
    xor eax, eax
    pop edi
L7:
    pop ebx
    leave
    ret 8
FUN_10084220 ENDP
END
