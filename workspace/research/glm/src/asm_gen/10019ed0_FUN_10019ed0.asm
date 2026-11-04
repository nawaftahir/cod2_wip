; FUN_10019ed0 @ 0x10019ed0 — auto-synthesized
    sub_10019e22 PROTO C
    sub_10019e39 PROTO C
.CODE
FUN_10019ed0 PROC
    push esi
    push 0x1018f040
    push edi
    push ebx
    mov word ptr [esi], 1
    call sub_10019e22
    add esp, 0x10
    test al, al
    je L0
    mov al, 1
    ret
    push esi
    push 0x1018f620
    push edi
    push ebx
    call sub_10019e39
    add esp, 0x10
    test al, al
    setne al
    ret
FUN_10019ed0 ENDP
END