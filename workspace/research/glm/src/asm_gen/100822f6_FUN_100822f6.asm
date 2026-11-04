; FUN_100822f6 @ 0x100822f6 — auto-synthesized
    EXTRN fp_1010c01c:DWORD
.CODE
FUN_100822f6 PROC
    mov eax, dword ptr [ecx]
    test eax, eax
    je L0
    push eax
    call dword ptr [fp_1010c01c]
    ret
FUN_100822f6 ENDP
END