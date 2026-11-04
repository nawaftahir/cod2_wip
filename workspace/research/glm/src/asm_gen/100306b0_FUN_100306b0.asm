; FUN_100306b0 @ 0x100306b0 — auto-synthesized
    EXTRN g_1019bc78:DWORD
    EXTRN g_101ce784:DWORD
    EXTRN g_101ce82c:DWORD
    EXTRN g_1072dc00:DWORD
    EXTRN g_1072dc04:DWORD
    EXTRN g_1072dc08:DWORD
    EXTRN g_1072dc0c:DWORD
    EXTRN g_1072decc:DWORD
    sub_1003061c PROTO C
    sub_10035798 PROTO C
.CODE
FUN_100306b0 PROC
    mov eax, dword ptr [g_101ce784]
    fld dword ptr [eax + 8]
    mov ecx, dword ptr [g_101ce82c]
    fld dword ptr [ecx + 8]
    sub esp, 0x10
    fld st(1)
    push ebx
    fstp dword ptr [g_1072dc00]
    lea ecx, [esp + 8]
    fld dword ptr [g_1019bc78]
    mov dword ptr [g_1072dc08], 0
    fsub st(2)
    fdivr dword ptr [g_1019bc78]
    fstp dword ptr [g_1072dc04]
    fstp dword ptr [g_1072dc0c]
    fstp st(0)
    call sub_1003061c
    mov ebx, ecx
    mov dword ptr [g_1072decc], eax
    call sub_10035798
    pop ebx
    add esp, 0x10
    ret
FUN_100306b0 ENDP
END