.686
.MODEL FLAT, C
.CODE
FUN_10048d30 PROC
    sub esp, 8
    push ebx
    mov ebx, dword ptr [esp + 16]
    mov eax, dword ptr [ebx + 68]
    test eax, eax
    push ebp
    mov ebp, dword ptr [ebx + 00000015Ch]
    push edi
    mov edi, dword ptr [ebx + 76]
    mov dword ptr [esp + 24], 0
    jle L2
    mov eax, dword ptr [esp + 32]
    lea ecx, [eax*4]
    mov eax, dword ptr [esp + 36]
    push esi
    mov esi, dword ptr [esp + 32]
    add ebp, 12
    sub eax, esi
    mov dword ptr [esp + 20], ecx
    mov dword ptr [esp + 16], eax
    jmp L1
L0:
    mov eax, dword ptr [esp + 16]
    lea esp, [esp]
L1:
    mov edx, dword ptr [edi + 12]
    imul edx, dword ptr [esp + 44]
    mov eax, dword ptr [eax + esi]
    lea ecx, [eax + edx*4]
    mov edx, dword ptr [esi]
    push ecx
    add edx, dword ptr [esp + 24]
    push edx
    push edi
    push ebx
    call dword ptr [ebp]
    mov eax, dword ptr [esp + 44]
    mov ecx, dword ptr [ebx + 68]
    add esp, 16
    inc eax
    add esi, 4
    add ebp, 4
    add edi, 84
    cmp eax, ecx
    mov dword ptr [esp + 28], eax
    jl L0
    pop esi
L2:
    pop edi
    pop ebp
    pop ebx
    add esp, 8
    ret
FUN_10048d30 ENDP
END
