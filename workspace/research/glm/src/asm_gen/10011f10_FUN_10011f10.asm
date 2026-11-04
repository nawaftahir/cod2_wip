; FUN_10011f10 @ 0x10011f10 — auto-synthesized
    EXTRN g_1019bc78:DWORD
    EXTRN g_1019bd54:DWORD
    EXTRN g_1019bd80:DWORD
    EXTRN g_1019be44:DWORD
    EXTRN g_101ce62c:DWORD
    sub_100f8f7a PROTO C
.CODE
FUN_10011f10 PROC
    sub esp, 0x18
    fld dword ptr [g_1019bc78]
    mov eax, dword ptr [g_101ce62c]
    fdiv dword ptr [eax + 8]
    push ebx
    push esi
    push edi
    xor edi, edi
    mov dword ptr [esp + 0xc], edi
    mov esi, ecx
    mov ebx, 0x100
    fstp dword ptr [esp + 0x10]
    jmp L0
    lea esp, [esp]
    mov edi, edi
    fld dword ptr [g_1019bc78]
    fld dword ptr [esp + 0x10]
    fucompp
    fnstsw ax
    test ah, 0x44
    jp L1
    mov eax, edi
    jmp L2
    fild dword ptr [esp + 0xc]
    fmul dword ptr [g_1019bd54]
    fld dword ptr [esp + 0x10]
    call sub_100f8f7a
    fmul dword ptr [g_1019be44]
    fstp dword ptr [esp + 0x14]
    fld qword ptr [g_1019bd80]
    fstp qword ptr [esp + 0x1c]
    fld dword ptr [esp + 0x14]
    fadd qword ptr [esp + 0x1c]
    fistp dword ptr [esp + 0x18]
    mov eax, dword ptr [esp + 0x18]
    mov edx, dword ptr [esp + 0xc]
    add edi, 0x101
    mov word ptr [esi], ax
    inc edx
    add esi, 2
    dec ebx
    mov dword ptr [esp + 0xc], edx
FUN_10011f10 ENDP
END