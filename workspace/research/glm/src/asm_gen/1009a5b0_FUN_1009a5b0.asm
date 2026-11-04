; FUN_1009a5b0 @ 0x1009a5b0 — auto-synthesized
    sub_1006507b PROTO C
    sub_100650ae PROTO C
    sub_100828c5 PROTO C
    sub_10083171 PROTO C
.CODE
FUN_1009a5b0 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    push 0x24
    call sub_1006507b
    test eax, eax
    je L0
    mov ecx, eax
    call sub_10083171
    mov esi, eax
    jmp L1
    xor esi, esi
    test esi, esi
    je L2
    mov ecx, dword ptr [ebp + 8]
    and dword ptr [esi + 0x10], 0
    test ecx, ecx
    je L3
    mov eax, dword ptr [ecx]
    call dword ptr [eax + 4]
    test eax, eax
    mov dword ptr [esi + 0x14], eax
    je L2
    push 0x14
    call sub_100650ae
    test eax, eax
    je L4
    push 0x10114734
    push 0
    push esi
    mov ecx, eax
    call sub_100828c5
    jmp L5
    xor eax, eax
    test eax, eax
    jne L6
    xor eax, eax
    pop esi
    pop ebp
    ret 4
FUN_1009a5b0 ENDP
END