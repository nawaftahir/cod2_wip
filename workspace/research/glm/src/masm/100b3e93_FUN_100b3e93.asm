.686
.MODEL FLAT, C
.CODE
FUN_100b3e93 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ebx
    push esi
    push edi
    mov edi, dword ptr [ebp + 8]
    push dword ptr [edi + 108]
    mov esi, ecx
    mov eax, dword ptr [esi]
    mov dword ptr [ebp - 4], 1
    call dword ptr [eax + 0x54]
    push dword ptr [edi + 108]
    mov ebx, eax
    mov eax, dword ptr [esi]
    mov ecx, esi
    call dword ptr [eax + 0x58]
    cmp ebx, 11
    mov ecx, dword ptr [ebp + 12]
    mov dword ptr [ecx], eax
    jne L0
    cmp eax, 4
    jae L4
    mov eax, dword ptr [ebp + 16]
    mov dword ptr [eax], 8
    jmp L2
L0:
    cmp ebx, 13
    jne L1
    test eax, eax
    jne L4
    mov eax, dword ptr [ebp + 16]
    mov dword ptr [eax], 9
    jmp L2
L1:
    cmp ebx, 00000FFFFh
    jne L4
    mov eax, dword ptr [ebp + 16]
    and dword ptr [eax], 0
    and dword ptr [ebp - 4], 0
L2:
    mov eax, dword ptr [ebp + 20]
    test eax, eax
    je L3
    mov ecx, dword ptr [ebp - 4]
    mov dword ptr [eax], ecx
L3:
    xor eax, eax
    jmp L5
L4:
    mov eax, 080004005h
L5:
    pop edi
    pop esi
    pop ebx
    leave
    ret 16
FUN_100b3e93 ENDP
END
