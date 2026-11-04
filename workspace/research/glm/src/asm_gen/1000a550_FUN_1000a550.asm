; FUN_1000a550 @ 0x1000a550 — auto-synthesized
    EXTRN g_1019bdbc:DWORD
    EXTRN g_101ce588:DWORD
    EXTRN g_101ce58c:DWORD
    EXTRN g_101ce590:DWORD
    EXTRN g_101ce594:DWORD
    EXTRN g_101ce598:DWORD
    EXTRN g_101ce599:DWORD
    EXTRN g_101ce59a:DWORD
    EXTRN g_101ce5b0:DWORD
    EXTRN g_101ce5b4:DWORD
    EXTRN g_101ce5d0:DWORD
    EXTRN g_101ce5d4:DWORD
    EXTRN g_101ce5d8:DWORD
    EXTRN g_101ce5dc:DWORD
.CODE
FUN_1000a550 PROC
    fld dword ptr [eax + 0xc]
    fchs
    fstp dword ptr [g_101ce5d0]
    fld dword ptr [eax + 0x10]
    fchs
    fstp dword ptr [g_101ce5d4]
    fld dword ptr [eax + 0x14]
    mov dword ptr [g_101ce5dc], 0
    fchs
    fstp dword ptr [g_101ce5d8]
    mov ecx, dword ptr [eax + 0xc]
    mov dword ptr [g_101ce588], ecx
    mov edx, dword ptr [eax + 0x10]
    mov dword ptr [g_101ce58c], edx
    mov eax, dword ptr [eax + 0x14]
    mov dword ptr [g_101ce590], eax
    fld dword ptr [g_101ce590]
    fmul dword ptr [g_101ce5d8]
    xor eax, eax
    fld dword ptr [g_101ce58c]
    cmp ecx, eax
    fmul dword ptr [g_101ce5d4]
    setle cl
    dec cl
    mov dword ptr [g_101ce5b0], eax
    faddp st(1)
    mov dword ptr [g_101ce5b4], eax
    fld dword ptr [g_101ce588]
    fmul dword ptr [g_101ce5d0]
    and ecx, 0xc
    faddp st(1)
    cmp edx, eax
    setle dl
    fsubr dword ptr [g_1019bdbc]
    dec dl
    mov byte ptr [g_101ce598], cl
    mov ecx, dword ptr [g_101ce590]
    and dl, 0xc
    fstp dword ptr [g_101ce594]
    add dl, 4
    cmp ecx, eax
    setle cl
    dec cl
    and cl, 0xc
    add cl, 8
    mov byte ptr [g_101ce599], dl
    mov byte ptr [g_101ce59a], cl
    ret
FUN_1000a550 ENDP
END