.686
.MODEL FLAT, C
.CODE
FUN_100563c0 PROC
    mov ecx, dword ptr [esi + 108]
    mov eax, dword ptr [esi + 0000001B0h]
    push ebp
    mov ebp, dword ptr [esi + 100]
    push edi
    xor edi, edi
    test ecx, ecx
    lea ebp, [ebp + ebp + 4]
    jle L1
    push ebx
    lea ebx, [eax + 68]
    lea esp, [esp]
L0:
    mov eax, dword ptr [esi + 4]
    push ebp
    push 1
    push esi
    call dword ptr [eax + 4]
    add esp, 12
    mov dword ptr [ebx], eax
    mov eax, dword ptr [esi + 108]
    inc edi
    add ebx, 4
    cmp edi, eax
    jl L0
    pop ebx
L1:
    pop edi
    pop ebp
    ret
FUN_100563c0 ENDP
END
