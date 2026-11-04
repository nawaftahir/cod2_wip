; FUN_10045ac0 @ 0x10045ac0 — auto-synthesized
    sub_10044e56 PROTO C
    sub_100456e1 PROTO C
    sub_10045914 PROTO C
.CODE
FUN_10045ac0 PROC
    push esi
    mov esi, dword ptr [esp + 8]
    push edi
    mov edi, dword ptr [esi + 0x154]
    push 0xd8
    call sub_10044e56
    mov dword ptr [edi + 0x1c], 0
    mov al, byte ptr [esi + 0xcc]
    add esp, 4
    test al, al
    je L0
    mov eax, esi
    call sub_100456e1
    mov al, byte ptr [esi + 0xd4]
    test al, al
    pop edi
    je L1
    mov eax, esi
    pop esi
    jmp sub_10045914
    pop esi
    ret
FUN_10045ac0 ENDP
END