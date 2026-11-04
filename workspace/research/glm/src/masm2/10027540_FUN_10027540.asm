.686
.MODEL FLAT, C
EXTRN sub_100275B8:PROC
EXTRN EXTRN g_1019BC84:DWORD:DWORD
.CODE
FUN_10027540 PROC
    xor xor edx, edx
    add add ecx, 4
    movzx movzx eax, byte ptr [ecx + 12]
    fld fld dword ptr [eax + esi]
    movzx movzx eax, byte ptr [ecx + 13]
    fmul fmul dword ptr [ecx - 4]
    fld fld dword ptr [eax + esi]
    movzx movzx eax, byte ptr [ecx + 14]
    fmul fmul dword ptr [ecx]
    faddp faddp st(1)
    fld fld dword ptr [eax + esi]
    fmul fmul dword ptr [ecx + 4]
    faddp faddp st(1)
    fadd fadd dword ptr [ecx + 8]
    fcomp fcomp dword ptr [g_1019BC84]
    fnstsw fnstsw ax
    test test ah, 65
    jnp sub_100275B8
    inc inc edx
    add add ecx, 20
    cmp cmp edx, 5
    jne L0
    xor xor al, al
    ret ret
    mov mov al, 1
L0:
    ret ret
FUN_10027540 ENDP
END
