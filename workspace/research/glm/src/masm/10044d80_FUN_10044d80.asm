.686
.MODEL FLAT, C
.CODE
FUN_10044d80 PROC
    mov eax, dword ptr [esi + 4]
    push 64
    push 1
    push esi
    call dword ptr [eax]
    mov dword ptr [esi + 000000148h], eax
    mov dword ptr [eax], 010044C80h
    mov cl, byte ptr [esi + 0000000B8h]
    add esp, 12
    test cl, cl
    jne L3
    mov cl, byte ptr [esp + 4]
    test cl, cl
    je L0
    mov ecx, dword ptr [esi]
    mov dword ptr [ecx + 20], 4
    mov edx, dword ptr [esi]
    mov dword ptr [esp + 4], esi
    jmp dword ptr [edx]
L0:
    mov edx, dword ptr [esi + 68]
    mov ecx, dword ptr [esi + 76]
    push ebp
    xor ebp, ebp
    test edx, edx
    jle L2
    push ebx
    push edi
    lea edi, [ecx + 28]
    lea ebx, [eax + 24]
L1:
    mov ecx, dword ptr [edi - 16]
    mov edx, dword ptr [edi]
    mov eax, dword ptr [esi + 4]
    shl ecx, 3
    push ecx
    shl edx, 3
    push edx
    push 1
    push esi
    call dword ptr [eax + 8]
    add esp, 16
    mov dword ptr [ebx], eax
    mov eax, dword ptr [esi + 68]
    inc ebp
    add ebx, 4
    add edi, 84
    cmp ebp, eax
    jl L1
    pop edi
    pop ebx
L2:
    pop ebp
L3:
    ret
FUN_10044d80 ENDP
END
