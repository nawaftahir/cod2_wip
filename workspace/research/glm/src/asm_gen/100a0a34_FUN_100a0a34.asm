; FUN_100a0a34 @ 0x100a0a34 — auto-synthesized
    sub_100650ba PROTO C
    sub_10082e99 PROTO C
    sub_10099511 PROTO C
    sub_10099558 PROTO C
    sub_100a07ff PROTO C
.CODE
FUN_100a0a34 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    mov esi, dword ptr [ebp + 8]
    test esi, esi
    push edi
    mov edi, ecx
    je L0
    lea eax, [ebp + 8]
    push eax
    push dword ptr [ebp + 0xc]
    call sub_100a07ff
    test eax, eax
    jge L1
    push 0x10115218
    push 0xbf4
    lea eax, [edi + 0x20]
    push eax
    push edi
    call sub_10099511
    add esp, 0x10
    jmp L0
    cmp dword ptr [ebp + 8], 1
    jb L2
    cmp dword ptr [ebp + 8], 4
    ja L2
    push 0x24
    call sub_100650ba
    test eax, eax
    je L0
    push 0
    push dword ptr [ebp + 8]
    mov ecx, eax
    push 1
    push dword ptr [esi + 0x14]
    push 1
    call sub_10082e99
    jmp L3
    push 4
    push 0x101151ec
    push 0xbec
    lea eax, [edi + 0x20]
    push eax
    push edi
    call sub_10099558
    add esp, 0x14
    xor eax, eax
    pop edi
    pop esi
    pop ebp
    ret 8
FUN_100a0a34 ENDP
END