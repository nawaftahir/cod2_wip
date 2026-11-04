; FUN_100995d8 @ 0x100995d8 — auto-synthesized
    sub_100995a1 PROTO C
.CODE
FUN_100995d8 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    xor eax, eax
    cmp dword ptr [ebp + 8], eax
    push esi
    mov esi, ecx
    jne L0
    cmp dword ptr [esi + 0x40], eax
    jne L1
    push 0x10114710
    push eax
    push eax
    push esi
    call sub_100995a1
    add esp, 0x10
    xor eax, eax
    inc eax
    mov dword ptr [esi + 0x40], eax
    mov dword ptr [esi + 0x44], eax
    mov eax, dword ptr [ebp + 8]
    pop esi
    pop ebp
    ret 4
FUN_100995d8 ENDP
END