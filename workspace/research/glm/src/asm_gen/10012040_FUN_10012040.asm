; FUN_10012040 @ 0x10012040 — auto-synthesized
    EXTRN g_101ae4c0:DWORD
    EXTRN g_101ae4cc:DWORD
    EXTRN g_101ae4d8:DWORD
    EXTRN g_101ae4f0:DWORD
    EXTRN g_101ae508:DWORD
    EXTRN g_101d1b28:DWORD
    EXTRN g_101d4d00:DWORD
    EXTRN g_101d5d28:DWORD
    EXTRN g_101d620c:DWORD
    sub_1000d886 PROTO C
    sub_10014c7f PROTO C
    sub_100173eb PROTO C
.CODE
FUN_10012040 PROC
    push edi
    call sub_1000d886
    call sub_100173eb
    mov eax, 0x10194250
    mov dword ptr [g_101d5d28], 0
    call sub_10014c7f
    mov dword ptr [g_101d1b28], eax
    xor eax, eax
    mov ecx, 0x28
    mov edi, 0x101d616c
    rep stosd dword ptr es:[edi], eax
    mov ecx, 0x15
    mov edi, 0x101ae4b8
    rep stosd dword ptr es:[edi], eax
    mov dword ptr [g_101d620c], eax
    mov eax, 0x1000
    mov dword ptr [g_101ae4c0], eax
    mov dword ptr [g_101ae4cc], 0x200
    mov dword ptr [g_101ae4d8], eax
    mov dword ptr [g_101ae4f0], 0x4000
    mov dword ptr [g_101ae508], eax
    mov byte ptr [g_101d4d00], 1
    pop edi
    ret
FUN_10012040 ENDP
END