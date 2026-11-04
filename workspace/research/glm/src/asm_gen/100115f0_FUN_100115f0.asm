; FUN_100115f0 @ 0x100115f0 — auto-synthesized
    EXTRN g_1019bd80:DWORD
    EXTRN g_1019bdc4:DWORD
    EXTRN g_101ce804:DWORD
    EXTRN g_101d4c6c:DWORD
    EXTRN g_101d4c70:DWORD
    EXTRN g_101d4c74:DWORD
    EXTRN g_101d4c78:DWORD
    EXTRN g_101d4c7c:DWORD
    EXTRN g_101d4c80:DWORD
    sub_100115ab PROTO C
.CODE
FUN_100115f0 PROC
    mov ecx, dword ptr [eax + 0x14]
    mov edx, dword ptr [eax + 0x18]
    mov dword ptr [g_101d4c6c], ecx
    mov ecx, dword ptr [eax + 4]
    mov dword ptr [g_101d4c70], edx
    movzx edx, byte ptr [eax + 8]
    mov eax, dword ptr [g_101ce804]
    mov eax, dword ptr [eax + 8]
    sub esp, 0x14
    cmp eax, 3
    push ebx
    push esi
    mov dword ptr [g_101d4c74], ecx
    mov dword ptr [g_101d4c78], edx
    ja L0
    jmp dword ptr [eax*4 + 0x100116b0]
    lea ebx, [esp + 8]
    lea esi, [esp + 0xc]
    call sub_100115ab
    fild dword ptr [esp + 8]
    fmul dword ptr [g_1019bdc4]
    fidiv dword ptr [esp + 0xc]
    fstp dword ptr [esp + 0xc]
    fld qword ptr [g_1019bd80]
    fstp qword ptr [esp + 0x10]
    fld dword ptr [esp + 0xc]
    fadd qword ptr [esp + 0x10]
    fistp dword ptr [esp + 8]
    mov eax, dword ptr [esp + 8]
    cmp eax, 0xa
    je L1
    jge L2
    mov dword ptr [g_101d4c7c], 0x3fe38e39
    jmp L0
    mov dword ptr [g_101d4c7c], 0x3faaaaab
    jmp L0
    mov dword ptr [g_101d4c7c], 0x3fcccccd
    fild dword ptr [g_101d4c70]
    pop esi
    pop ebx
    fmul dword ptr [g_101d4c7c]
    fidiv dword ptr [g_101d4c6c]
    fstp dword ptr [g_101d4c80]
    add esp, 0x14
    ret
FUN_100115f0 ENDP
END