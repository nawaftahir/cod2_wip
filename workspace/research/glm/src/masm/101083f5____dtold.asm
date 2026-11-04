.686
.MODEL FLAT, C
.CODE
___dtold PROC
    push ebp
    mov ebp, esp
    push ecx
    mov edx, dword ptr [ebp + 12]
    xor eax, eax
    mov ax, word ptr [edx + 6]
    push ebx
    push esi
    push edi
    mov edi, 0000007FFh
    mov esi, 080000000h
    mov dword ptr [ebp - 4], esi
    mov ecx, eax
    shr ecx, 4
    and eax, 000008000h
    and ecx, edi
    mov dword ptr [ebp + 12], eax
    mov eax, dword ptr [edx + 4]
    mov edx, dword ptr [edx]
    movzx ebx, cx
    and eax, 0000FFFFFh
    test ebx, ebx
    je L1
    cmp ebx, edi
    je L0
    lea edi, [ecx + 000003C00h]
    jmp L3
L0:
    mov edi, 000007FFFh
    jmp L3
L1:
    xor ebx, ebx
    cmp eax, ebx
    jne L2
    cmp edx, ebx
    jne L2
    mov eax, dword ptr [ebp + 8]
    mov dword ptr [eax + 4], ebx
    mov dword ptr [eax], ebx
    mov word ptr [eax + 8], bx
    jmp L6
L2:
    lea edi, [ecx + 000003C01h]
    mov dword ptr [ebp - 4], ebx
L3:
    mov ecx, edx
    shr ecx, 21
    shl eax, 11
    or ecx, eax
    or ecx, dword ptr [ebp - 4]
    mov eax, dword ptr [ebp + 8]
    shl edx, 11
    test esi, ecx
    mov dword ptr [eax + 4], ecx
    mov dword ptr [eax], edx
    jne L5
L4:
    mov ecx, dword ptr [eax]
    mov edx, dword ptr [eax + 4]
    mov ebx, ecx
    shl edx, 1
    shr ebx, 31
    or edx, ebx
    add ecx, ecx
    add edi, 00000FFFFh
    test esi, edx
    mov dword ptr [eax + 4], edx
    mov dword ptr [eax], ecx
    je L4
L5:
    mov ecx, dword ptr [ebp + 12]
    or ecx, edi
    mov word ptr [eax + 8], cx
L6:
    pop edi
    pop esi
    pop ebx
    leave
    ret
___dtold ENDP
END
