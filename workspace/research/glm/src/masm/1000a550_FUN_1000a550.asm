.686
.MODEL FLAT, C
EXTRN g_1019BDBC:DWORD
EXTRN g_101CE588:DWORD
EXTRN g_101CE58C:DWORD
EXTRN g_101CE590:DWORD
EXTRN g_101CE594:DWORD
EXTRN g_101CE598:DWORD
EXTRN g_101CE599:DWORD
EXTRN g_101CE59A:DWORD
EXTRN g_101CE5B0:DWORD
EXTRN g_101CE5B4:DWORD
EXTRN g_101CE5D0:DWORD
EXTRN g_101CE5D4:DWORD
EXTRN g_101CE5D8:DWORD
EXTRN g_101CE5DC:DWORD
.CODE
FUN_1000a550 PROC
    fld dword ptr [eax + 12]
    fchs
    fstp dword ptr [g_101CE5D0]
    fld dword ptr [eax + 16]
    fchs
    fstp dword ptr [g_101CE5D4]
    fld dword ptr [eax + 20]
    mov dword ptr [g_101CE5DC], 0
    fchs
    fstp dword ptr [g_101CE5D8]
    mov ecx, dword ptr [eax + 12]
    mov dword ptr [g_101CE588], ecx
    mov edx, dword ptr [eax + 16]
    mov dword ptr [g_101CE58C], edx
    mov eax, dword ptr [eax + 20]
    mov dword ptr [g_101CE590], eax
    fld dword ptr [g_101CE590]
    fmul dword ptr [g_101CE5D8]
    xor eax, eax
    fld dword ptr [g_101CE58C]
    cmp ecx, eax
    fmul dword ptr [g_101CE5D4]
    setle cl
    dec cl
    mov dword ptr [g_101CE5B0], eax
    faddp st(1)
    mov dword ptr [g_101CE5B4], eax
    fld dword ptr [g_101CE588]
    fmul dword ptr [g_101CE5D0]
    and ecx, 12
    faddp st(1)
    cmp edx, eax
    setle dl
    fsubr dword ptr [g_1019BDBC]
    dec dl
    mov byte ptr [g_101CE598], cl
    mov ecx, dword ptr [g_101CE590]
    and dl, 12
    fstp dword ptr [g_101CE594]
    add dl, 4
    cmp ecx, eax
    setle cl
    dec cl
    and cl, 12
    add cl, 8
    mov byte ptr [g_101CE599], dl
    mov byte ptr [g_101CE59A], cl
    ret
FUN_1000a550 ENDP
END
