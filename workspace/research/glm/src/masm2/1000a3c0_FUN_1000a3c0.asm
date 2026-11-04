.686
.MODEL FLAT, C
EXTRN sub_1000A579:PROC
EXTRN sub_1000AB29:PROC
EXTRN EXTRN g_1019BC84:DWORD:DWORD
EXTRN EXTRN g_1019BEC0:DWORD:DWORD
EXTRN EXTRN g_101CE588:DWORD:DWORD
EXTRN EXTRN g_101CE58C:DWORD:DWORD
EXTRN EXTRN g_101CE590:DWORD:DWORD
EXTRN EXTRN g_101CE594:DWORD:DWORD
EXTRN EXTRN g_101CE598:DWORD:DWORD
EXTRN EXTRN g_101CE599:DWORD:DWORD
EXTRN EXTRN g_101CE59A:DWORD:DWORD
EXTRN EXTRN g_101CE59B:DWORD:DWORD
EXTRN EXTRN g_101CE59C:DWORD:DWORD
EXTRN EXTRN g_101CE5A0:DWORD:DWORD
EXTRN EXTRN g_101CE5A4:DWORD:DWORD
EXTRN EXTRN g_101CE5A8:DWORD:DWORD
EXTRN EXTRN g_101CE5AC:DWORD:DWORD
EXTRN EXTRN g_101CE5AD:DWORD:DWORD
EXTRN EXTRN g_101CE5AE:DWORD:DWORD
EXTRN EXTRN g_101CE5AF:DWORD:DWORD
EXTRN EXTRN g_101CE5B0:DWORD:DWORD
EXTRN EXTRN g_101CE5B4:DWORD:DWORD
EXTRN EXTRN g_101CE5D0:DWORD:DWORD
EXTRN EXTRN g_101CE5D4:DWORD:DWORD
EXTRN EXTRN g_101CE5D8:DWORD:DWORD
EXTRN EXTRN g_101CE5DC:DWORD:DWORD
.CODE
FUN_1000a3c0 PROC
    mov mov eax, dword ptr [ecx]
    mov mov dword ptr [g_101CE5D0], eax
    mov mov edx, dword ptr [ecx + 4]
    mov mov dword ptr [g_101CE5D4], edx
    mov mov eax, dword ptr [ecx + 8]
    mov mov dword ptr [g_101CE5D8], eax
    mov mov dword ptr [g_101CE5DC], 03F800000h
    mov mov edx, dword ptr [ecx + 12]
    mov mov dword ptr [g_101CE588], edx
    mov mov eax, dword ptr [ecx + 16]
    mov mov dword ptr [g_101CE58C], eax
    mov mov eax, dword ptr [g_101CE588]
    mov mov edx, dword ptr [ecx + 20]
    test test eax, eax
    setle setle al
    dec dec al
    mov mov dword ptr [g_101CE590], edx
    fld fld dword ptr [g_101CE590]
    fmul fmul dword ptr [g_101CE5D8]
    mov mov edx, dword ptr [g_101CE58C]
    fld fld dword ptr [g_101CE58C]
    mov mov dword ptr [g_101CE5B0], 0101CE588h
    fmul fmul dword ptr [g_101CE5D4]
    and and eax, 12
    faddp faddp st(1)
    fld fld dword ptr [g_101CE588]
    test test edx, edx
    fmul fmul dword ptr [g_101CE5D0]
    setle setle dl
    dec dec dl
    mov mov byte ptr [g_101CE598], al
    mov mov eax, dword ptr [g_101CE590]
    faddp faddp st(1)
    and and dl, 12
    add add dl, 4
    fsubr fsubr dword ptr [g_1019BEC0]
    test test eax, eax
    setle setle al
    dec dec al
    and and al, 12
    fstp fstp dword ptr [g_101CE594]
    mov mov byte ptr [g_101CE599], dl
    add add al, 8
    mov mov dl, 0FFh
    mov mov byte ptr [g_101CE59A], al
    mov mov byte ptr [g_101CE59B], dl
    call sub_1000AB29
    fcom fcom dword ptr [g_1019BC84]
    fnstsw fnstsw ax
    test test ah, 65
    jp sub_1000A579
    mov mov dword ptr [g_101CE5B4], 0
    fstp fstp st(0)
    ret ret
    fld fld dword ptr [ecx + 12]
    fchs fchs
    fstp fstp dword ptr [g_101CE59C]
    fld fld dword ptr [ecx + 16]
    fchs fchs
    fstp fstp dword ptr [g_101CE5A0]
    mov mov eax, dword ptr [g_101CE5A0]
    fld fld dword ptr [ecx + 20]
    mov mov ecx, dword ptr [g_101CE59C]
    test test ecx, ecx
    fchs fchs
    setle setle cl
    fst fst dword ptr [g_101CE5A4]
    fmul fmul dword ptr [g_101CE5D8]
    dec dec cl
    fld fld dword ptr [g_101CE5A0]
    mov mov byte ptr [g_101CE5AF], dl
    fmul fmul dword ptr [g_101CE5D4]
    mov mov dword ptr [g_101CE5B4], 0101CE59Ch
    faddp faddp st(1)
    fld fld dword ptr [g_101CE59C]
    fmul fmul dword ptr [g_101CE5D0]
    and and ecx, 12
    test test eax, eax
    setle setle al
    dec dec al
    faddp faddp st(1)
    mov mov byte ptr [g_101CE5AC], cl
    mov mov ecx, dword ptr [g_101CE5A4]
    and and al, 12
    fsubr fsubr st(1)
    add add al, 4
    test test ecx, ecx
    setle setle cl
    fstp fstp dword ptr [g_101CE5A8]
    dec dec cl
    and and cl, 12
    fstp fstp st(0)
    add add cl, 8
    mov mov byte ptr [g_101CE5AD], al
    mov mov byte ptr [g_101CE5AE], cl
    ret ret
FUN_1000a3c0 ENDP
END
