; FUN_10067634 @ 0x10067634 — auto-synthesized
    sub_100f788e PROTO C
.CODE
FUN_10067634 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 8]
    push esi
    push edi
    mov edi, ecx
    lea ecx, [eax + 1]
    mov dl, byte ptr [eax]
    inc eax
    test dl, dl
    jne L0
    sub eax, ecx
    lea esi, [eax + 1]
    lea eax, [esi + 4]
    push eax
    call sub_100f788e
    test eax, eax
    pop ecx
    jne L1
    mov eax, 0x8007000e
    jmp L2
    mov ecx, dword ptr [edi]
    mov dword ptr [eax], ecx
    lea ecx, [esi - 1]
    add dword ptr [edi + 4], ecx
    mov dword ptr [edi], eax
    mov ecx, esi
    mov esi, dword ptr [ebp + 8]
    lea edi, [eax + 4]
    mov eax, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, eax
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    xor eax, eax
    pop edi
    pop esi
    pop ebp
    ret 4
FUN_10067634 ENDP
END