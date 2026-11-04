.686
.MODEL FLAT, C
EXTRN sub_10005F11:PROC
EXTRN sub_100591BD:PROC
EXTRN EXTRN g_1019BC84:DWORD:DWORD
EXTRN EXTRN g_101CE5D0:DWORD:DWORD
EXTRN EXTRN g_101CE5D4:DWORD:DWORD
EXTRN EXTRN g_101CE5D8:DWORD:DWORD
EXTRN EXTRN g_101CE5DC:DWORD:DWORD
.CODE
FUN_10005d70 PROC
    fld fld dword ptr [g_1019BC84]
    sub sub esp, 24
    fld fld dword ptr [g_101CE5DC]
    push push esi
    fucompp fucompp
    mov mov esi, eax
    fnstsw fnstsw ax
    test test ah, 68
    jnp L0
    fld fld dword ptr [edi]
    fsub fsub dword ptr [g_101CE5D0]
    fstp fstp dword ptr [esp + 4]
    fld fld dword ptr [edi + 4]
    fsub fsub dword ptr [g_101CE5D4]
    fstp fstp dword ptr [esp + 8]
    fld fld dword ptr [edi + 8]
    fsub fsub dword ptr [g_101CE5D8]
    fstp fstp dword ptr [esp + 12]
    fld fld dword ptr [ecx]
    fsub fsub dword ptr [g_101CE5D0]
    fstp fstp dword ptr [esp + 16]
    fld fld dword ptr [ecx + 4]
    fsub fsub dword ptr [g_101CE5D4]
    fstp fstp dword ptr [esp + 20]
    fld fld dword ptr [ecx + 8]
    fsub fsub dword ptr [g_101CE5D8]
    fstp fstp dword ptr [esp + 24]
    fld fld dword ptr [esp + 20]
    fmul fmul dword ptr [esp + 12]
    fld fld dword ptr [esp + 24]
    fmul fmul dword ptr [esp + 8]
    fsubp fsubp st(1)
    fstp fstp dword ptr [esi]
    fld fld dword ptr [esp + 24]
    fmul fmul dword ptr [esp + 4]
    fld fld dword ptr [esp + 12]
    fmul fmul dword ptr [esp + 16]
    fsubp fsubp st(1)
    fstp fstp dword ptr [esi + 4]
    fld fld dword ptr [esp + 16]
    fmul fmul dword ptr [esp + 8]
    fld fld dword ptr [esp + 20]
    jmp sub_10005F11
    fld fld dword ptr [ecx]
    fsub fsub dword ptr [edi]
    fstp fstp dword ptr [esp + 4]
    fld fld dword ptr [ecx + 4]
    fsub fsub dword ptr [edi + 4]
    fstp fstp dword ptr [esp + 8]
    fld fld dword ptr [ecx + 8]
    fsub fsub dword ptr [edi + 8]
    fstp fstp dword ptr [esp + 12]
    fld fld dword ptr [g_101CE5D4]
    fmul fmul dword ptr [esp + 12]
    fld fld dword ptr [g_101CE5D8]
    fmul fmul dword ptr [esp + 8]
    fsubp fsubp st(1)
    fstp fstp dword ptr [esi]
    fld fld dword ptr [g_101CE5D8]
    fmul fmul dword ptr [esp + 4]
    fld fld dword ptr [g_101CE5D0]
    fmul fmul dword ptr [esp + 12]
    fsubp fsubp st(1)
    fstp fstp dword ptr [esi + 4]
    fld fld dword ptr [g_101CE5D0]
    fmul fmul dword ptr [esp + 8]
    fld fld dword ptr [g_101CE5D4]
    fmul fmul dword ptr [esp + 4]
    fsubp fsubp st(1)
    fstp fstp dword ptr [esi + 8]
    call sub_100591BD
    mov mov eax, dword ptr [esi]
    fstp fstp st(0)
    fld fld dword ptr [esi + 4]
    mov mov ecx, dword ptr [esi + 4]
    fmul fmul dword ptr [edi + 4]
    test test eax, eax
    fld fld dword ptr [edi]
    setle setle al
    fmul fmul dword ptr [esi]
    dec dec al
    faddp faddp st(1)
    fld fld dword ptr [edi + 8]
    mov mov byte ptr [esi + 19], 0FFh
    fmul fmul dword ptr [esi + 8]
    and and eax, 12
    test test ecx, ecx
    faddp faddp st(1)
    setle setle cl
    dec dec cl
    fsubr fsubr dword ptr [g_1019BC84]
    and and cl, 12
    mov mov byte ptr [esi + 16], al
    mov mov eax, dword ptr [esi + 8]
    add add cl, 4
    fstp fstp dword ptr [esi + 12]
    test test eax, eax
    setle setle dl
    dec dec dl
    and and dl, 12
    add add dl, 8
    mov mov byte ptr [esi + 17], cl
    mov mov byte ptr [esi + 18], dl
    pop pop esi
    add add esp, 24
    ret ret
FUN_10005d70 ENDP
END
