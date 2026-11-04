.686
.MODEL FLAT, C
EXTRN EXTRN g_1019BDBC:DWORD:DWORD
EXTRN EXTRN g_101CE588:DWORD:DWORD
EXTRN EXTRN g_101CE58C:DWORD:DWORD
EXTRN EXTRN g_101CE590:DWORD:DWORD
EXTRN EXTRN g_101CE594:DWORD:DWORD
EXTRN EXTRN g_101CE598:DWORD:DWORD
EXTRN EXTRN g_101CE599:DWORD:DWORD
EXTRN EXTRN g_101CE59A:DWORD:DWORD
EXTRN EXTRN g_101CE5B0:DWORD:DWORD
EXTRN EXTRN g_101CE5B4:DWORD:DWORD
EXTRN EXTRN g_101CE5D0:DWORD:DWORD
EXTRN EXTRN g_101CE5D4:DWORD:DWORD
EXTRN EXTRN g_101CE5D8:DWORD:DWORD
EXTRN EXTRN g_101CE5DC:DWORD:DWORD
.CODE
FUN_1000a550 PROC
    fld fld dword ptr [eax + 12]
    fchs fchs
    fstp fstp dword ptr [g_101CE5D0]
    fld fld dword ptr [eax + 16]
    fchs fchs
    fstp fstp dword ptr [g_101CE5D4]
    fld fld dword ptr [eax + 20]
    mov mov dword ptr [g_101CE5DC], 0
    fchs fchs
    fstp fstp dword ptr [g_101CE5D8]
    mov mov ecx, dword ptr [eax + 12]
    mov mov dword ptr [g_101CE588], ecx
    mov mov edx, dword ptr [eax + 16]
    mov mov dword ptr [g_101CE58C], edx
    mov mov eax, dword ptr [eax + 20]
    mov mov dword ptr [g_101CE590], eax
    fld fld dword ptr [g_101CE590]
    fmul fmul dword ptr [g_101CE5D8]
    xor xor eax, eax
    fld fld dword ptr [g_101CE58C]
    cmp cmp ecx, eax
    fmul fmul dword ptr [g_101CE5D4]
    setle setle cl
    dec dec cl
    mov mov dword ptr [g_101CE5B0], eax
    faddp faddp st(1)
    mov mov dword ptr [g_101CE5B4], eax
    fld fld dword ptr [g_101CE588]
    fmul fmul dword ptr [g_101CE5D0]
    and and ecx, 12
    faddp faddp st(1)
    cmp cmp edx, eax
    setle setle dl
    fsubr fsubr dword ptr [g_1019BDBC]
    dec dec dl
    mov mov byte ptr [g_101CE598], cl
    mov mov ecx, dword ptr [g_101CE590]
    and and dl, 12
    fstp fstp dword ptr [g_101CE594]
    add add dl, 4
    cmp cmp ecx, eax
    setle setle cl
    dec dec cl
    and and cl, 12
    add add cl, 8
    mov mov byte ptr [g_101CE599], dl
    mov mov byte ptr [g_101CE59A], cl
    ret ret
FUN_1000a550 ENDP
END
