.686
.MODEL FLAT, C
.CODE
FUN_100b3e25 PROC
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
    cmp ebx, 11
    mov ecx, dword ptr [ebp + 12]
    mov dword ptr [ecx], eax
    jne L0
    cmp eax, dword ptr [esi + 40]
    jae L3
    mov eax, dword ptr [ebp + 16]
    mov dword ptr [eax], 1
    jmp L2
L0:
    cmp ebx, 6
    jne L1
    cmp eax, 8
    jae L3
    mov eax, dword ptr [ebp + 16]
    mov dword ptr [eax], 3
    jmp L2
L1:
    cmp ebx, 00000FFFFh
    jne L3
    mov eax, dword ptr [ebp + 16]
    and dword ptr [eax], 0
L2:
    xor eax, eax
    jmp L4
L3:
    mov eax, 080004005h
L4:
    pop edi
    pop esi
    pop ebx
    pop ebp
    ret 12
FUN_100b3e25 ENDP
END
