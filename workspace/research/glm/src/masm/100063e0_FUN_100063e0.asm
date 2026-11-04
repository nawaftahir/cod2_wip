.686
.MODEL FLAT, C
EXTRN g_1019BC84:DWORD
EXTRN g_101CE5C0:DWORD
EXTRN g_101CE5C4:DWORD
.CODE
FUN_100063e0 PROC
    push ebx
    push esi
    push edi
    mov edi, eax
    xor esi, esi
    test edi, edi
    mov bl, 0000000FFh
    jle L1
    add ecx, 17
L0:
    movzx eax, byte ptr [ecx - 1]
    mov byte ptr [ecx + 2], bl
    fld dword ptr [eax + edx]
    movzx eax, byte ptr [ecx]
    fmul dword ptr [ecx - 17]
    fld dword ptr [eax + edx]
    movzx eax, byte ptr [ecx + 1]
    fmul dword ptr [ecx - 13]
    faddp st(1)
    fld dword ptr [eax + edx]
    fmul dword ptr [ecx - 9]
    faddp st(1)
    fadd dword ptr [ecx - 5]
    fcomp dword ptr [g_1019BC84]
    fnstsw ax
    test ah, 65
    jnp L4
    inc esi
    add ecx, 20
    cmp esi, edi
    jl L0
L1:
    mov eax, dword ptr [g_101CE5C0]
    push ebp
    xor ebp, ebp
    test eax, eax
    jle L6
    jmp L2
    lea ebx, [ebx]
L2:
    mov ecx, dword ptr [g_101CE5C4]
    mov edi, dword ptr [ecx + ebp*4]
    mov ecx, dword ptr [edi + 32]
    xor esi, esi
    mov edi, edi
L3:
    cmp esi, dword ptr [edi + 28]
    jge L7
    movzx eax, byte ptr [ecx + 17]
    mov byte ptr [ecx + 19], bl
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
    je L5
    inc esi
    add ecx, 20
    jmp L3
L4:
    pop edi
    pop esi
    mov al, 1
    pop ebx
    ret
L5:
    mov eax, dword ptr [g_101CE5C0]
    inc ebp
    cmp ebp, eax
    jl L2
L6:
    pop ebp
    pop edi
    pop esi
    xor al, al
    pop ebx
    ret
L7:
    pop ebp
FUN_100063e0 ENDP
END
