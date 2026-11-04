; FUN_1000fb30 @ 0x1000fb30 — auto-synthesized
    sub_1000ea63 PROTO C
    sub_1000ec32 PROTO C
    sub_1000ee4e PROTO C
.CODE
FUN_1000fb30 PROC
    push ebx
    mov ebx, dword ptr [esp + 0xc]
    push esi
    mov esi, dword ptr [esp + 0xc]
    push edi
    push 0
    push 3
    push 1
    push eax
    mov edi, edx
    push ecx
    mov eax, edi
    mov ecx, esi
    call sub_1000ee4e
    mov eax, dword ptr [esi]
    add esp, 0x14
    cmp eax, 4
    push ebx
    jne L0
    push 0
    push edi
    push esi
    call sub_1000ec32
    add esp, 0x10
    pop edi
    pop esi
    pop ebx
    ret
    push edi
    xor edi, edi
    xor ebx, ebx
    call sub_1000ea63
    add esp, 8
    pop edi
    pop esi
    pop ebx
    ret
FUN_1000fb30 ENDP
END