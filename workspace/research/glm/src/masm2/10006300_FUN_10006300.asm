.686
.MODEL FLAT, C
EXTRN sub_10006407:PROC
EXTRN sub_1000642A:PROC
EXTRN sub_1000642E:PROC
EXTRN sub_10006435:PROC
EXTRN sub_10006448:PROC
EXTRN sub_10006475:PROC
EXTRN EXTRN g_1019BC84:DWORD:DWORD
EXTRN EXTRN g_101CE5C0:DWORD:DWORD
EXTRN EXTRN g_101CE5C4:DWORD:DWORD
.CODE
FUN_10006300 PROC
    push push esi
    push push edi
    mov mov edi, dword ptr [esp + 12]
    xor xor esi, esi
    test test edi, edi
    jle L0
    add add ecx, 19
    nop nop
    movzx movzx eax, byte ptr [ecx]
    cmp cmp ebx, eax
    jg L1
    movzx movzx eax, byte ptr [ecx - 3]
    mov mov byte ptr [ecx], 0FFh
    fld fld dword ptr [eax + edx]
    movzx movzx eax, byte ptr [ecx - 2]
    fmul fmul dword ptr [ecx - 19]
    fld fld dword ptr [eax + edx]
    movzx movzx eax, byte ptr [ecx - 1]
    fmul fmul dword ptr [ecx - 15]
    faddp faddp st(1)
    fld fld dword ptr [eax + edx]
    fmul fmul dword ptr [ecx - 11]
    faddp faddp st(1)
    fadd fadd dword ptr [ecx - 7]
    fcomp fcomp dword ptr [g_1019BC84]
    fnstsw fnstsw ax
    test test ah, 65
    jnp sub_10006407
    inc inc esi
    add add ecx, 20
    cmp cmp esi, edi
    jl L2
    mov mov eax, dword ptr [g_101CE5C0]
    push push ebp
    xor xor ebp, ebp
    test test eax, eax
    jle sub_1000642A
L0:
    mov mov ecx, dword ptr [g_101CE5C4]
    mov mov edi, dword ptr [ecx + ebp*4]
    cmp cmp ebx, dword ptr [edi + 24]
    jg sub_1000642E
    mov mov ecx, dword ptr [edi + 32]
    xor xor esi, esi
    cmp cmp esi, dword ptr [edi + 28]
    jge sub_10006448
    movzx movzx eax, byte ptr [ecx + 19]
    cmp cmp ebx, eax
    jg sub_10006435
    movzx movzx eax, byte ptr [ecx + 17]
    mov mov byte ptr [ecx + 19], 0FFh
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
    je sub_10006475
    inc inc esi
    add add ecx, 20
    jmp sub_1000642E
    pop pop edi
    mov mov al, 1
    pop pop esi
    ret ret
    mov mov eax, dword ptr [g_101CE5C0]
    inc inc ebp
    cmp cmp ebp, eax
    jl sub_1000642A
    pop pop ebp
    pop pop edi
    xor xor al, al
    pop pop esi
    ret ret
    pop pop ebp
    pop pop edi
    mov mov al, 1
    pop pop esi
    ret ret
FUN_10006300 ENDP
END
