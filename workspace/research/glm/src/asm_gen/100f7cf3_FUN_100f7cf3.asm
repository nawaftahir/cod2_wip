; FUN_100f7cf3 @ 0x100f7cf3 — auto-synthesized
    EXTRN g_101a47c4:DWORD
    sub_100f7d23 PROTO C
    sub_100f7d37 PROTO C
    sub_100fc47b PROTO C
.CODE
FUN_100f7cf3 PROC
    mov eax, dword ptr [g_101a47c4]
    push ebp
    xor ebp, ebp
    inc ebp
    test eax, eax
    jne sub_100f7d23
    push 0x351
    call sub_100fc47b
    test eax, eax
    pop ecx
    mov dword ptr [g_101a47c4], eax
    jne sub_100f7d37
    pop ebp
    ret
FUN_100f7cf3 ENDP
END