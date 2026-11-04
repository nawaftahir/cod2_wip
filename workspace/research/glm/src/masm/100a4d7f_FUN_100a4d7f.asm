.686
.MODEL FLAT, C
.CODE
FUN_100a4d7f PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    push edi
    mov edi, dword ptr [ebp + 8]
    push dword ptr [edi + 108]
    mov esi, ecx
    mov eax, dword ptr [esi]
    call dword ptr [eax + 0x54]
    cmp eax, 00000FFFFh
    jne L0
    mov eax, dword ptr [ebp + 16]
    and dword ptr [eax], 0
    push dword ptr [edi + 108]
    mov eax, dword ptr [esi]
    mov ecx, esi
    call dword ptr [eax + 0x58]
    jmp L3
L0:
    push 17
    pop ecx
    cmp eax, ecx
    jne L1
    mov eax, dword ptr [ebp + 16]
    mov dword ptr [eax], ecx
    mov eax, dword ptr [ebp + 12]
    mov dword ptr [eax], 1
    jmp L4
L1:
    cmp eax, 18
    mov eax, dword ptr [ebp + 16]
    jne L2
    mov dword ptr [eax], ecx
    mov eax, dword ptr [ebp + 12]
    and dword ptr [eax], 0
    jmp L4
L2:
    mov dword ptr [eax], 1
    mov eax, dword ptr [edi + 12]
L3:
    mov ecx, dword ptr [ebp + 12]
    mov dword ptr [ecx], eax
L4:
    pop edi
    xor eax, eax
    pop esi
    pop ebp
    ret 12
FUN_100a4d7f ENDP
END
