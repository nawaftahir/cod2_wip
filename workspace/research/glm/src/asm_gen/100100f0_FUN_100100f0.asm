; FUN_100100f0 @ 0x100100f0 — auto-synthesized
    sub_1000ea7f PROTO C
    sub_1000ec48 PROTO C
    sub_1000ee5f PROTO C
.CODE
FUN_100100f0 PROC
    push esi
    mov esi, dword ptr [esp + 8]
    push 0
    push 3
    mov byte ptr [esp + 0x10], al
    mov al, byte ptr [esp + 0x14]
    push 1
    mov byte ptr [esp + 0x15], cl
    mov byte ptr [esp + 0x17], al
    push 1
    push 1
    mov eax, 0x15
    mov ecx, esi
    mov byte ptr [esp + 0x1e], dl
    call sub_1000ee5f
    mov eax, dword ptr [esi]
    add esp, 0x14
    cmp eax, 4
    jne L0
    lea ecx, [esp + 8]
    push ecx
    push 0
    push 0x15
    push esi
    call sub_1000ec48
    add esp, 0x10
    pop esi
    ret
    push ebx
    push edi
    lea edx, [esp + 0x10]
    push edx
    push 0x15
    xor edi, edi
    xor ebx, ebx
    call sub_1000ea7f
    add esp, 8
    pop edi
    pop ebx
    pop esi
    ret
FUN_100100f0 ENDP
END