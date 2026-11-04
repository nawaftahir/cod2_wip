; R_BeginCubemapShot @ 0x10026a70 — auto-synthesized
    sub_100268ba PROTO C
    sub_1003ea44 PROTO C
.CODE
R_BeginCubemapShot PROC
    mov eax, dword ptr [esp + 4]
    push eax
    call sub_100268ba
    add esp, 4
    xor eax, eax
    jmp sub_1003ea44
R_BeginCubemapShot ENDP
END