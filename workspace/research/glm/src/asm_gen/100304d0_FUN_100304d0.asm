; FUN_100304d0 @ 0x100304d0 — auto-synthesized
    EXTRN g_1019bc84:DWORD
    EXTRN g_101d1b9c:DWORD
    EXTRN g_101d1bd8:DWORD
    EXTRN g_101d1bdc:DWORD
    EXTRN g_1072dc10:DWORD
    EXTRN g_1072dc14:DWORD
    EXTRN g_1072dc18:DWORD
    EXTRN g_1072dc1c:DWORD
    EXTRN g_1073055c:DWORD
    EXTRN g_1076671c:DWORD
    EXTRN g_10766720:DWORD
    sub_1002e8f2 PROTO C
    sub_1003a97a PROTO C
.CODE
FUN_100304d0 PROC
    push ecx
    mov ecx, dword ptr [g_101d1b9c]
    mov edx, dword ptr [ecx + 0x20]
    test edx, edx
    push ebx
    je L0
    mov edx, dword ptr [eax*4 + 0x101ce740]
    fld dword ptr [edx + 8]
    jmp L1
    fld dword ptr [g_1019bc84]
    mov eax, dword ptr [eax*4 + 0x101ce6e8]
    fld dword ptr [eax + 8]
    fld dword ptr [g_1019bc84]
    fld st(2)
    fucompp
    fnstsw ax
    test ah, 0x44
    mov eax, dword ptr [g_101d1bdc]
    jnp L2
    mov eax, dword ptr [g_101d1bd8]
    mov ecx, dword ptr [esp + 0xc]
    fxch st(1)
    push 0x3f800000
    fstp dword ptr [g_1072dc10]
    push 0x3f800000
    fstp dword ptr [g_1072dc1c]
    push 0
    fild dword ptr [g_10766720]
    push 0
    sub esp, 8
    or ebx, 0xffffffff
    fstp dword ptr [esp + 4]
    mov dword ptr [g_1072dc14], 0
    fild dword ptr [g_1076671c]
    mov dword ptr [g_1072dc18], 0
    mov dword ptr [g_1073055c], ecx
    fstp dword ptr [esp]
    push 0
    push 0
    call sub_1002e8f2
    add esp, 0x20
    call sub_1003a97a
    pop ebx
    pop ecx
    ret
FUN_100304d0 ENDP
END