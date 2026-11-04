.686
.MODEL FLAT, C
EXTRN g_1019BC84:DWORD
.CODE
FUN_10027540 PROC
    xor edx, edx
    add ecx, 4
L0:
    movzx eax, byte ptr [ecx + 12]
    fld dword ptr [eax + esi]
    movzx eax, byte ptr [ecx + 13]
    fmul dword ptr [ecx - 4]
    fld dword ptr [eax + esi]
    movzx eax, byte ptr [ecx + 14]
    fmul dword ptr [ecx]
    faddp st(1)
    fld dword ptr [eax + esi]
    fmul dword ptr [ecx + 4]
    faddp st(1)
    fadd dword ptr [ecx + 8]
    fcomp dword ptr [g_1019BC84]
    fnstsw ax
    test ah, 65
    jnp L1
    inc edx
    add ecx, 20
    cmp edx, 5
    jne L0
    xor al, al
    ret
L1:
    mov al, 1
    ret
FUN_10027540 ENDP
END
