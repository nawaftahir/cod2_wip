; FUN_100ac974 @ 0x100ac974 — auto-synthesized
.CODE
FUN_100ac974 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ebx
    xor eax, eax
    push esi
    mov esi, dword ptr [ebp + 8]
    inc eax
    cmp dword ptr [esi + 0x28], eax
    mov ebx, ecx
    jne L0
    push edi
    xor edi, edi
    cmp dword ptr [esi + 0x14], edi
    jbe L1
    mov eax, dword ptr [esi + 0x18]
    mov eax, dword ptr [eax + edi*4]
    mov ecx, dword ptr [ebx + 0x18]
    push dword ptr [ecx + eax*4]
    mov ecx, ebx
    call L2
    test eax, eax
    jne L3
    inc edi
    cmp edi, dword ptr [esi + 0x14]
    jb L4
    xor eax, eax
    pop edi
    pop esi
    pop ebx
    pop ebp
    ret 4
    xor eax, eax
    inc eax
    jmp L5
FUN_100ac974 ENDP
END