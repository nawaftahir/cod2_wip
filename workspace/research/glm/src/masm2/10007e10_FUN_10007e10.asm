.686
.MODEL FLAT, C
EXTRN sub_10007E77:PROC
EXTRN sub_10007E7C:PROC
EXTRN sub_10007E7E:PROC
EXTRN sub_10007EA7:PROC
EXTRN EXTRN g_1019BC84:DWORD:DWORD
.CODE
FUN_10007e10 PROC
    push push ebx
    push push ebp
    push push esi
    push push edi
    mov mov edi, ecx
    test test edi, edi
    mov mov esi, edx
    je sub_10007E77
    mov mov ebx, dword ptr [eax + 32]
    movzx movzx ebp, byte ptr [eax + 36]
    mov mov edx, ebp
    test test edx, edx
    mov mov ecx, ebx
    je sub_10007E77
    jmp L0
    lea lea ecx, [ecx]
    fld fld dword ptr [ecx + 4]
    fmul fmul dword ptr [esi + 4]
    fld fld dword ptr [ecx + 8]
    fmul fmul dword ptr [esi + 8]
    faddp faddp st(1)
    fld fld dword ptr [ecx]
    fmul fmul dword ptr [esi]
    faddp faddp st(1)
    fadd fadd dword ptr [esi + 12]
    fcomp fcomp dword ptr [g_1019BC84]
L0:
    fnstsw fnstsw ax
    test test ah, 65
    je sub_10007EA7
    dec dec edx
    add add ecx, 12
    test test edx, edx
    jne sub_10007E7C
    pop pop edi
    pop pop esi
    pop pop ebp
    mov mov al, 1
    pop pop ebx
    ret ret
    dec dec edi
    add add esi, 20
    test test edi, edi
    jne sub_10007E7E
    pop pop edi
    pop pop esi
    pop pop ebp
FUN_10007e10 ENDP
END
