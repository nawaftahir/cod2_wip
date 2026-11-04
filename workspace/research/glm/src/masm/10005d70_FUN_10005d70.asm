.686
.MODEL FLAT, C
EXTRN sub_100591BD:PROC
EXTRN g_1019BC84:DWORD
EXTRN g_101CE5D0:DWORD
EXTRN g_101CE5D4:DWORD
EXTRN g_101CE5D8:DWORD
EXTRN g_101CE5DC:DWORD
.CODE
FUN_10005d70 PROC
    fld dword ptr [g_1019BC84]
    sub esp, 24
    fld dword ptr [g_101CE5DC]
    push esi
    fucompp
    mov esi, eax
    fnstsw ax
    test ah, 68
    jnp L0
    fld dword ptr [edi]
    fsub dword ptr [g_101CE5D0]
    fstp dword ptr [esp + 4]
    fld dword ptr [edi + 4]
    fsub dword ptr [g_101CE5D4]
    fstp dword ptr [esp + 8]
    fld dword ptr [edi + 8]
    fsub dword ptr [g_101CE5D8]
    fstp dword ptr [esp + 12]
    fld dword ptr [ecx]
    fsub dword ptr [g_101CE5D0]
    fstp dword ptr [esp + 16]
    fld dword ptr [ecx + 4]
    fsub dword ptr [g_101CE5D4]
    fstp dword ptr [esp + 20]
    fld dword ptr [ecx + 8]
    fsub dword ptr [g_101CE5D8]
    fstp dword ptr [esp + 24]
    fld dword ptr [esp + 20]
    fmul dword ptr [esp + 12]
    fld dword ptr [esp + 24]
    fmul dword ptr [esp + 8]
    fsubp st(1)
    fstp dword ptr [esi]
    fld dword ptr [esp + 24]
    fmul dword ptr [esp + 4]
    fld dword ptr [esp + 12]
    fmul dword ptr [esp + 16]
    fsubp st(1)
    fstp dword ptr [esi + 4]
    fld dword ptr [esp + 16]
    fmul dword ptr [esp + 8]
    fld dword ptr [esp + 20]
    jmp L1
L0:
    fld dword ptr [ecx]
    fsub dword ptr [edi]
    fstp dword ptr [esp + 4]
    fld dword ptr [ecx + 4]
    fsub dword ptr [edi + 4]
    fstp dword ptr [esp + 8]
    fld dword ptr [ecx + 8]
    fsub dword ptr [edi + 8]
    fstp dword ptr [esp + 12]
    fld dword ptr [g_101CE5D4]
    fmul dword ptr [esp + 12]
    fld dword ptr [g_101CE5D8]
    fmul dword ptr [esp + 8]
    fsubp st(1)
    fstp dword ptr [esi]
    fld dword ptr [g_101CE5D8]
    fmul dword ptr [esp + 4]
    fld dword ptr [g_101CE5D0]
    fmul dword ptr [esp + 12]
    fsubp st(1)
    fstp dword ptr [esi + 4]
    fld dword ptr [g_101CE5D0]
    fmul dword ptr [esp + 8]
    fld dword ptr [g_101CE5D4]
L1:
    fmul dword ptr [esp + 4]
    fsubp st(1)
    fstp dword ptr [esi + 8]
    call sub_100591BD
    mov eax, dword ptr [esi]
    fstp st(0)
    fld dword ptr [esi + 4]
    mov ecx, dword ptr [esi + 4]
    fmul dword ptr [edi + 4]
    test eax, eax
    fld dword ptr [edi]
    setle al
    fmul dword ptr [esi]
    dec al
    faddp st(1)
    fld dword ptr [edi + 8]
    mov byte ptr [esi + 19], 0000000FFh
    fmul dword ptr [esi + 8]
    and eax, 12
    test ecx, ecx
    faddp st(1)
    setle cl
    dec cl
    fsubr dword ptr [g_1019BC84]
    and cl, 12
    mov byte ptr [esi + 16], al
    mov eax, dword ptr [esi + 8]
    add cl, 4
    fstp dword ptr [esi + 12]
    test eax, eax
    setle dl
    dec dl
    and dl, 12
    add dl, 8
    mov byte ptr [esi + 17], cl
    mov byte ptr [esi + 18], dl
    pop esi
    add esp, 24
    ret
FUN_10005d70 ENDP
END
