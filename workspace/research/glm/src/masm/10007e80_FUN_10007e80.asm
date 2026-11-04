.686
.MODEL FLAT, C
EXTRN g_1019BC84:DWORD
.CODE
FUN_10007e80 PROC
    push ebx
    push ebp
    push esi
    push edi
    mov edi, ecx
    test edi, edi
    mov esi, edx
    je L3
    mov ebx, dword ptr [eax + 32]
    movzx ebp, byte ptr [eax + 36]
L0:
    mov edx, ebp
    test edx, edx
    mov ecx, ebx
    je L2
    jmp L1
    lea ecx, [ecx]
L1:
    fld dword ptr [ecx + 4]
    fmul dword ptr [esi + 4]
    fld dword ptr [ecx + 8]
    fmul dword ptr [esi + 8]
    faddp st(1)
    fld dword ptr [ecx]
    fmul dword ptr [esi]
    faddp st(1)
    fadd dword ptr [esi + 12]
    fcomp dword ptr [g_1019BC84]
    fnstsw ax
    test ah, 65
    je L4
    dec edx
    add ecx, 12
    test edx, edx
    jne L1
L2:
    dec edi
    add esi, 20
    test edi, edi
    jne L0
L3:
    pop edi
    pop esi
    pop ebp
    mov al, 1
    pop ebx
    ret
L4:
    pop edi
    pop esi
    pop ebp
FUN_10007e80 ENDP
END
