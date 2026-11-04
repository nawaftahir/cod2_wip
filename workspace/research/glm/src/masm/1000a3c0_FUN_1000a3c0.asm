.686
.MODEL FLAT, C
EXTRN sub_1000AB29:PROC
EXTRN g_1019BC84:DWORD
EXTRN g_1019BEC0:DWORD
EXTRN g_101CE588:DWORD
EXTRN g_101CE58C:DWORD
EXTRN g_101CE590:DWORD
EXTRN g_101CE594:DWORD
EXTRN g_101CE598:DWORD
EXTRN g_101CE599:DWORD
EXTRN g_101CE59A:DWORD
EXTRN g_101CE59B:DWORD
EXTRN g_101CE59C:DWORD
EXTRN g_101CE5A0:DWORD
EXTRN g_101CE5A4:DWORD
EXTRN g_101CE5A8:DWORD
EXTRN g_101CE5AC:DWORD
EXTRN g_101CE5AD:DWORD
EXTRN g_101CE5AE:DWORD
EXTRN g_101CE5AF:DWORD
EXTRN g_101CE5B0:DWORD
EXTRN g_101CE5B4:DWORD
EXTRN g_101CE5D0:DWORD
EXTRN g_101CE5D4:DWORD
EXTRN g_101CE5D8:DWORD
EXTRN g_101CE5DC:DWORD
.CODE
FUN_1000a3c0 PROC
    mov eax, dword ptr [ecx]
    mov dword ptr [g_101CE5D0], eax
    mov edx, dword ptr [ecx + 4]
    mov dword ptr [g_101CE5D4], edx
    mov eax, dword ptr [ecx + 8]
    mov dword ptr [g_101CE5D8], eax
    mov dword ptr [g_101CE5DC], 03F800000h
    mov edx, dword ptr [ecx + 12]
    mov dword ptr [g_101CE588], edx
    mov eax, dword ptr [ecx + 16]
    mov dword ptr [g_101CE58C], eax
    mov eax, dword ptr [g_101CE588]
    mov edx, dword ptr [ecx + 20]
    test eax, eax
    setle al
    dec al
    mov dword ptr [g_101CE590], edx
    fld dword ptr [g_101CE590]
    fmul dword ptr [g_101CE5D8]
    mov edx, dword ptr [g_101CE58C]
    fld dword ptr [g_101CE58C]
    mov dword ptr [g_101CE5B0], 0101CE588h
    fmul dword ptr [g_101CE5D4]
    and eax, 12
    faddp st(1)
    fld dword ptr [g_101CE588]
    test edx, edx
    fmul dword ptr [g_101CE5D0]
    setle dl
    dec dl
    mov byte ptr [g_101CE598], al
    mov eax, dword ptr [g_101CE590]
    faddp st(1)
    and dl, 12
    add dl, 4
    fsubr dword ptr [g_1019BEC0]
    test eax, eax
    setle al
    dec al
    and al, 12
    fstp dword ptr [g_101CE594]
    mov byte ptr [g_101CE599], dl
    add al, 8
    mov dl, 0000000FFh
    mov byte ptr [g_101CE59A], al
    mov byte ptr [g_101CE59B], dl
    call sub_1000AB29
    fcom dword ptr [g_1019BC84]
    fnstsw ax
    test ah, 65
    jp L0
    mov dword ptr [g_101CE5B4], 0
    fstp st(0)
    ret
L0:
    fld dword ptr [ecx + 12]
    fchs
    fstp dword ptr [g_101CE59C]
    fld dword ptr [ecx + 16]
    fchs
    fstp dword ptr [g_101CE5A0]
    mov eax, dword ptr [g_101CE5A0]
    fld dword ptr [ecx + 20]
    mov ecx, dword ptr [g_101CE59C]
    test ecx, ecx
    fchs
    setle cl
    fst dword ptr [g_101CE5A4]
    fmul dword ptr [g_101CE5D8]
    dec cl
    fld dword ptr [g_101CE5A0]
    mov byte ptr [g_101CE5AF], dl
    fmul dword ptr [g_101CE5D4]
    mov dword ptr [g_101CE5B4], 0101CE59Ch
    faddp st(1)
    fld dword ptr [g_101CE59C]
    fmul dword ptr [g_101CE5D0]
    and ecx, 12
    test eax, eax
    setle al
    dec al
    faddp st(1)
    mov byte ptr [g_101CE5AC], cl
    mov ecx, dword ptr [g_101CE5A4]
    and al, 12
    fsubr st(1)
    add al, 4
    test ecx, ecx
    setle cl
    fstp dword ptr [g_101CE5A8]
    dec cl
    and cl, 12
    fstp st(0)
    add cl, 8
    mov byte ptr [g_101CE5AD], al
    mov byte ptr [g_101CE5AE], cl
    ret
FUN_1000a3c0 ENDP
END
