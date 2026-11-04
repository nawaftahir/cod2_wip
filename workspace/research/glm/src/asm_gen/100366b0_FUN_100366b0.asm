; FUN_100366b0 @ 0x100366b0 — auto-synthesized
    EXTRN g_1019bdf4:DWORD
    EXTRN g_101d1b9c:DWORD
    EXTRN g_1072ddb4:DWORD
    sub_100363fd PROTO C
.CODE
FUN_100366b0 PROC
    mov ecx, dword ptr [g_1072ddb4]
    mov dword ptr [esi], ecx
    mov cl, byte ptr [eax + 4]
    sub esp, 0xc
    test cl, cl
    jns L0
    mov edx, dword ptr [eax + 8]
    mov ecx, dword ptr [eax + 0xc]
    mov dword ptr [esp], edx
    mov edx, dword ptr [eax + 0x10]
    mov dword ptr [esp + 4], ecx
    mov dword ptr [esp + 8], edx
    jmp L1
    fld dword ptr [eax + 0x44]
    mov ecx, dword ptr [eax + 0x3c]
    fadd dword ptr [g_1019bdf4]
    mov edx, dword ptr [eax + 0x40]
    mov dword ptr [esp], ecx
    mov dword ptr [esp + 4], edx
    fstp dword ptr [esp + 8]
    mov edx, dword ptr [g_101d1b9c]
    lea eax, [esi + 8]
    push eax
    lea ecx, [esp + 4]
    push ecx
    add edx, 0x11c
    push edx
    call sub_100363fd
    fstp dword ptr [esi + 4]
    add esp, 0x18
    ret
FUN_100366b0 ENDP
END