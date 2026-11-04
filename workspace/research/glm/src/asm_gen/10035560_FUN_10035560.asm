; FUN_10035560 @ 0x10035560 — auto-synthesized
    EXTRN g_1019bc80:DWORD
    EXTRN g_1019bd58:DWORD
    EXTRN g_101d4848:DWORD
    EXTRN g_101d4c6c:DWORD
    EXTRN g_101d4c70:DWORD
    EXTRN g_101d4c80:DWORD
    EXTRN g_1072ddc8:DWORD
    sub_10035235 PROTO C
    sub_10035536 PROTO C
.CODE
FUN_10035560 PROC
    mov eax, dword ptr [g_1072ddc8]
    mov edx, dword ptr [eax + 0x3c]
    fild dword ptr [eax + 0x3c]
    sub esp, 0x99c
    test edx, edx
    push esi
    jge L0
    fadd dword ptr [g_1019bc80]
    fmul dword ptr [esp + 0x9a4]
    mov esi, dword ptr [g_101d4848]
    lea eax, [ecx + ecx*4]
    shl eax, 2
    mov edx, dword ptr [eax + 0x101d482c]
    mov eax, dword ptr [eax + 0x101d4830]
    mov dword ptr [esp + 0x990], ecx
    lea ecx, [esp + 0xc]
    push ecx
    push eax
    mov eax, dword ptr [g_101d4c6c]
    push edx
    mov edx, dword ptr [g_101d4c70]
    fmul dword ptr [g_1019bd58]
    push edx
    push eax
    fstp dword ptr [esp + 0x18]
    mov dword ptr [esp + 0x9a8], 0xb
    mov ecx, dword ptr [esp + 0x18]
    fld dword ptr [g_101d4c80]
    fmul dword ptr [esp + 0x18]
    push ecx
    push ecx
    mov dword ptr [esp + 0x9b4], 0xc
    fstp dword ptr [esp]
    mov dword ptr [esp + 0x9a8], esi
    call sub_10035235
    lea edx, [esp + 0x24]
    add esp, 0x1c
    push edx
    mov dword ptr [esp + 0xc], eax
    call sub_10035536
    add esp, 4
    pop esi
    add esp, 0x99c
    ret
FUN_10035560 ENDP
END