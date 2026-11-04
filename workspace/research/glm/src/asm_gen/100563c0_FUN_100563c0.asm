; FUN_100563c0 @ 0x100563c0 — auto-synthesized
.CODE
FUN_100563c0 PROC
    mov ecx, dword ptr [esi + 0x6c]
    mov eax, dword ptr [esi + 0x1b0]
    push ebp
    mov ebp, dword ptr [esi + 0x64]
    push edi
    xor edi, edi
    test ecx, ecx
    lea ebp, [ebp + ebp + 4]
    jle L0
    push ebx
    lea ebx, [eax + 0x44]
    lea esp, [esp]
    mov eax, dword ptr [esi + 4]
    push ebp
    push 1
    push esi
    call dword ptr [eax + 4]
    add esp, 0xc
    mov dword ptr [ebx], eax
    mov eax, dword ptr [esi + 0x6c]
    inc edi
    add ebx, 4
    cmp edi, eax
    jl L1
    pop ebx
    pop edi
    pop ebp
    ret
FUN_100563c0 ENDP
END