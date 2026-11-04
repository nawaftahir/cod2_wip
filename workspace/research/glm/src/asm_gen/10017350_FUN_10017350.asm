; FUN_10017350 @ 0x10017350 — auto-synthesized
    sub_1001711a PROTO C
    sub_1001739c PROTO C
    sub_100173bd PROTO C
    sub_10061d0d PROTO C
.CODE
FUN_10017350 PROC
    push esi
    xor esi, esi
    test ebx, ebx
    jle sub_1001739c
    jmp L0
    lea esp, [esp]
    mov eax, dword ptr [edi + esi*8]
    push 0
    call sub_1001711a
    mov ecx, dword ptr [edi + esi*8 + 4]
    mov dword ptr [ecx], eax
    mov edx, dword ptr [edi + esi*8 + 4]
    mov eax, dword ptr [edx]
    add esp, 4
    test eax, eax
    jne sub_100173bd
    mov eax, dword ptr [edi + esi*8]
    push eax
    push 0x10194340
    push 0
    call sub_10061d0d
    add esp, 0xc
FUN_10017350 ENDP
END