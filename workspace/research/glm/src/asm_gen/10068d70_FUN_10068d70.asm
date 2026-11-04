; FUN_10068d70 @ 0x10068d70 — auto-synthesized
    sub_10067c67 PROTO C
.CODE
FUN_10068d70 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 8]
    test eax, eax
    push esi
    mov esi, ecx
    jne L0
    push edi
    xor edi, edi
    inc edi
    cmp dword ptr [esi + 0x4c], eax
    jne L1
    push 0x1010c734
    push eax
    lea eax, [esi + 0x10]
    push eax
    push dword ptr [esi]
    call sub_10067c67
    add esp, 0x10
    mov dword ptr [esi + 0x4c], edi
    mov dword ptr [esi + 0x50], edi
    xor eax, eax
    pop edi
    pop esi
    pop ebp
    ret 4
FUN_10068d70 ENDP
END