.686
.MODEL FLAT, C
EXTRN g_1019BC84:DWORD
EXTRN g_101CE5C0:DWORD
EXTRN g_101CE5C4:DWORD
.CODE
FUN_10006300 PROC
    push esi
    push edi
    mov edi, dword ptr [esp + 12]
    xor esi, esi
    test edi, edi
    jle L2
    add ecx, 19
    nop
L0:
    movzx eax, byte ptr [ecx]
    cmp ebx, eax
    jg L1
    movzx eax, byte ptr [ecx - 3]
    mov byte ptr [ecx], 0000000FFh
    fld dword ptr [eax + edx]
    movzx eax, byte ptr [ecx - 2]
    fmul dword ptr [ecx - 19]
    fld dword ptr [eax + edx]
    movzx eax, byte ptr [ecx - 1]
    fmul dword ptr [ecx - 15]
    faddp st(1)
    fld dword ptr [eax + edx]
    fmul dword ptr [ecx - 11]
    faddp st(1)
    fadd dword ptr [ecx - 7]
    fcomp dword ptr [g_1019BC84]
    fnstsw ax
    test ah, 65
    jnp L6
L1:
    inc esi
    add ecx, 20
    cmp esi, edi
    jl L0
L2:
    mov eax, dword ptr [g_101CE5C0]
    push ebp
    xor ebp, ebp
    test eax, eax
    jle L8
L3:
    mov ecx, dword ptr [g_101CE5C4]
    mov edi, dword ptr [ecx + ebp*4]
    cmp ebx, dword ptr [edi + 24]
    jg L7
    mov ecx, dword ptr [edi + 32]
    xor esi, esi
L4:
    cmp esi, dword ptr [edi + 28]
    jge L9
    movzx eax, byte ptr [ecx + 19]
    cmp ebx, eax
    jg L5
    movzx eax, byte ptr [ecx + 17]
    mov byte ptr [ecx + 19], 0000000FFh
    fld dword ptr [eax + edx]
    movzx eax, byte ptr [ecx + 16]
    fmul dword ptr [ecx + 4]
    fld dword ptr [eax + edx]
    movzx eax, byte ptr [ecx + 18]
    fmul dword ptr [ecx]
    faddp st(1)
    fld dword ptr [eax + edx]
    fmul dword ptr [ecx + 8]
    faddp st(1)
    fadd dword ptr [ecx + 12]
    fcomp dword ptr [g_1019BC84]
    fnstsw ax
    test ah, 65
    je L7
L5:
    inc esi
    add ecx, 20
    jmp L4
L6:
    pop edi
    mov al, 1
    pop esi
    ret
L7:
    mov eax, dword ptr [g_101CE5C0]
    inc ebp
    cmp ebp, eax
    jl L3
L8:
    pop ebp
    pop edi
    xor al, al
    pop esi
    ret
L9:
    pop ebp
    pop edi
    mov al, 1
    pop esi
    ret
FUN_10006300 ENDP
END
