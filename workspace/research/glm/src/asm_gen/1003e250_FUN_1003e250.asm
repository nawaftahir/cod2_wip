; FUN_1003e250 @ 0x1003e250 — auto-synthesized
    EXTRN g_10730550:DWORD
    sub_1003e14c PROTO C
.CODE
FUN_1003e250 PROC
    mov eax, dword ptr [g_10730550]
    fld dword ptr [esp + 4]
    imul eax, eax, 0xcd0
    fchs
    fstp dword ptr [eax + 0x1072e258]
    jmp sub_1003e14c
FUN_1003e250 ENDP
END