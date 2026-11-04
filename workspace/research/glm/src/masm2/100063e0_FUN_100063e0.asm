.686
.MODEL FLAT, C
EXTRN sub_100064D3:PROC
EXTRN sub_100064F7:PROC
EXTRN sub_100064FF:PROC
EXTRN sub_1000651B:PROC
EXTRN sub_1000653E:PROC
EXTRN EXTRN g_1019BC84:DWORD:DWORD
EXTRN EXTRN g_101CE5C0:DWORD:DWORD
EXTRN EXTRN g_101CE5C4:DWORD:DWORD
.CODE
FUN_100063e0 PROC
    push push ebx
    push push esi
    push push edi
    mov mov edi, eax
    xor xor esi, esi
    test test edi, edi
    mov mov bl, 0FFh
    jle L0
    add add ecx, 17
    movzx movzx eax, byte ptr [ecx - 1]
    mov mov byte ptr [ecx + 2], bl
    fld fld dword ptr [eax + edx]
    movzx movzx eax, byte ptr [ecx]
    fmul fmul dword ptr [ecx - 17]
    fld fld dword ptr [eax + edx]
    movzx movzx eax, byte ptr [ecx + 1]
    fmul fmul dword ptr [ecx - 13]
    faddp faddp st(1)
    fld fld dword ptr [eax + edx]
    fmul fmul dword ptr [ecx - 9]
    faddp faddp st(1)
    fadd fadd dword ptr [ecx - 5]
    fcomp fcomp dword ptr [g_1019BC84]
    fnstsw fnstsw ax
    test test ah, 65
    jnp sub_100064D3
    inc inc esi
    add add ecx, 20
    cmp cmp esi, edi
    jl L1
    mov mov eax, dword ptr [g_101CE5C0]
    push push ebp
    xor xor ebp, ebp
    test test eax, eax
    jle sub_100064F7
    jmp L2
    lea lea ebx, [ebx]
    mov mov ecx, dword ptr [g_101CE5C4]
    mov mov edi, dword ptr [ecx + ebp*4]
    mov mov ecx, dword ptr [edi + 32]
    xor xor esi, esi
    mov mov edi, edi
    cmp cmp esi, dword ptr [edi + 28]
    jge sub_1000651B
    movzx movzx eax, byte ptr [ecx + 17]
    mov mov byte ptr [ecx + 19], bl
    fld fld dword ptr [eax + edx]
    movzx movzx eax, byte ptr [ecx + 16]
    fmul fmul dword ptr [ecx + 4]
    fld fld dword ptr [eax + edx]
    movzx movzx eax, byte ptr [ecx + 18]
    fmul fmul dword ptr [ecx]
    faddp faddp st(1)
    fld fld dword ptr [eax + edx]
    fmul fmul dword ptr [ecx + 8]
    faddp faddp st(1)
    fadd fadd dword ptr [ecx + 12]
    fcomp fcomp dword ptr [g_1019BC84]
    fnstsw fnstsw ax
    test test ah, 65
    je sub_1000653E
    inc inc esi
    add add ecx, 20
    jmp sub_100064FF
    pop pop edi
    pop pop esi
    mov mov al, 1
    pop pop ebx
    ret ret
    mov mov eax, dword ptr [g_101CE5C0]
L2:
    inc inc ebp
    cmp cmp ebp, eax
    jl sub_100064FF
    pop pop ebp
    pop pop edi
    pop pop esi
    xor xor al, al
    pop pop ebx
    ret ret
    pop pop ebp
FUN_100063e0 ENDP
END
