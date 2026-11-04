; FUN_1000d450 @ 0x1000d450 — auto-synthesized
    sub_1000c919 PROTO C
    sub_1000fa50 PROTO C
    sub_100138e4 PROTO C
.CODE
FUN_1000d450 PROC
    push ebx
    push esi
    mov esi, eax
    call sub_1000c919
    mov ebx, esi
    call sub_1000fa50
    test al, al
    jne L0
    mov eax, dword ptr [esi + 0x20]
    push eax
    push 0x10193544
    push 1
    call sub_100138e4
    add esp, 0xc
    pop esi
    pop ebx
    ret
FUN_1000d450 ENDP
END