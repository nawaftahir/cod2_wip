.686
.MODEL FLAT, C
.CODE
FUN_100a4c91 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ebx
    push esi
    push edi
    mov edi, dword ptr [ebp + 8]
    push dword ptr [edi + 108]
    mov esi, ecx
    mov eax, dword ptr [esi]
    call dword ptr [eax + 0x54]
    push dword ptr [edi + 108]
    mov ebx, eax
    mov eax, dword ptr [esi]
    mov ecx, esi
    call dword ptr [eax + 0x58]
    mov ecx, dword ptr [ebp + 12]
    mov dword ptr [ecx], eax
    test byte ptr [esi + 112], 64
    je L3
    mov eax, dword ptr [ebp + 20]
    xor esi, esi
    cmp eax, esi
    je L0
    mov dword ptr [eax], esi
L0:
    cmp ebx, 5
    jne L1
    cmp dword ptr [ecx], esi
    jne L2
    cmp eax, esi
    je L2
    mov dword ptr [eax], 1
L1:
    cmp ebx, 00000FFFFh
    jne L2
    mov eax, dword ptr [ebp + 16]
    mov dword ptr [eax], esi
    jmp L9
L2:
    mov eax, dword ptr [ebp + 16]
    mov dword ptr [eax], 6
    mov eax, dword ptr [edi + 12]
    mov dword ptr [ecx], eax
    jmp L9
L3:
    xor esi, esi
    xor edi, edi
    cmp ebx, 11
    jne L4
    cmp eax, 4
    jae L10
    mov eax, dword ptr [ebp + 16]
    mov dword ptr [eax], 8
    jmp L8
L4:
    cmp ebx, 13
    jne L5
    cmp eax, esi
    jne L10
    mov eax, dword ptr [ebp + 16]
    xor edi, edi
    inc edi
    mov dword ptr [eax], 9
    jmp L8
L5:
    push 17
    pop edx
    cmp ebx, edx
    jne L6
    cmp eax, esi
    jne L10
    mov eax, dword ptr [ebp + 16]
    mov dword ptr [eax], edx
    mov dword ptr [ecx], 1
    jmp L8
L6:
    cmp ebx, 18
    jne L7
    cmp eax, esi
    jne L10
    mov eax, dword ptr [ebp + 16]
    mov dword ptr [eax], edx
    mov dword ptr [ecx], esi
    jmp L8
L7:
    cmp ebx, 00000FFFFh
    jne L10
    mov eax, dword ptr [ebp + 16]
    mov dword ptr [eax], esi
    xor edi, edi
L8:
    mov eax, dword ptr [ebp + 20]
    cmp eax, esi
    je L9
    mov dword ptr [eax], edi
L9:
    xor eax, eax
    jmp L11
L10:
    mov eax, 080004005h
L11:
    pop edi
    pop esi
    pop ebx
    pop ebp
    ret 16
FUN_100a4c91 ENDP
END
