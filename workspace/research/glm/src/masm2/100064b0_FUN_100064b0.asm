.686
.MODEL FLAT, C
EXTRN sub_100065D5:PROC
EXTRN sub_10006616:PROC
EXTRN sub_1000661C:PROC
EXTRN sub_10006620:PROC
EXTRN sub_10006629:PROC
EXTRN sub_1000662A:PROC
EXTRN sub_10006642:PROC
EXTRN sub_10006657:PROC
EXTRN sub_10006662:PROC
EXTRN sub_100066A0:PROC
EXTRN EXTRN g_1019BC84:DWORD:DWORD
EXTRN EXTRN g_101CE5C0:DWORD:DWORD
EXTRN EXTRN g_101CE5C4:DWORD:DWORD
.CODE
FUN_100064b0 PROC
    push push ebx
    push push esi
    mov mov esi, eax
    xor xor edx, edx
    test test esi, esi
    jle L0
    add add ecx, 19
    lea lea ecx, [ecx]
    movzx movzx eax, byte ptr [ecx]
    cmp cmp dword ptr [esp + 12], eax
    jg L2
    movzx movzx eax, byte ptr [ecx - 3]
    mov mov byte ptr [ecx], 0FFh
    fld fld dword ptr [eax + edi]
    movzx movzx eax, byte ptr [ecx - 2]
    fmul fmul dword ptr [ecx - 19]
    fld fld dword ptr [eax + edi]
    movzx movzx eax, byte ptr [ecx - 1]
    fmul fmul dword ptr [ecx - 15]
    faddp faddp st(1)
    fld fld dword ptr [eax + edi]
    fmul fmul dword ptr [ecx - 11]
    faddp faddp st(1)
    fadd fadd dword ptr [ecx - 7]
    fcomp fcomp dword ptr [g_1019BC84]
    fnstsw fnstsw ax
    test test ah, 65
    jnp sub_100065D5
    inc inc edx
    add add ecx, 20
    cmp cmp edx, esi
    jl L1
    mov mov eax, dword ptr [g_101CE5C0]
    push push ebp
    xor xor ebp, ebp
    test test eax, eax
L0:
    jle sub_10006616
L1:
    lea lea ebx, [ebx]
    mov mov ecx, dword ptr [g_101CE5C4]
    mov mov edx, dword ptr [ecx + ebp*4]
    mov mov eax, dword ptr [esp + 16]
    cmp cmp eax, dword ptr [edx + 24]
    jg sub_10006620
    mov mov eax, dword ptr [edx + 28]
    mov mov ecx, dword ptr [edx + 32]
    xor xor esi, esi
    test test eax, eax
    mov mov bl, 1
    jle sub_10006642
    movzx movzx eax, byte ptr [ecx + 19]
    cmp cmp dword ptr [esp + 16], eax
    jg sub_10006629
    movzx movzx eax, byte ptr [ecx + 17]
    mov mov byte ptr [ecx + 19], 0FFh
    fld fld dword ptr [eax + edi]
    movzx movzx eax, byte ptr [ecx + 16]
    fmul fmul dword ptr [ecx + 4]
    fld fld dword ptr [eax + edi]
    movzx movzx eax, byte ptr [ecx + 18]
    fmul fmul dword ptr [ecx]
    faddp faddp st(1)
    fld fld dword ptr [eax + edi]
    fmul fmul dword ptr [ecx + 8]
    faddp faddp st(1)
    fadd fadd dword ptr [ecx + 12]
    fcomp fcomp dword ptr [g_1019BC84]
    fnstsw fnstsw ax
    test test ah, 65
    jne sub_10006657
    xor xor bl, bl
    jmp sub_10006662
    pop pop esi
    mov mov al, 1
    pop pop ebx
    ret ret
    mov mov al, byte ptr [esp + 16]
    mov mov byte ptr [ecx + 19], al
    mov mov eax, dword ptr [edx + 28]
    inc inc esi
    add add ecx, 20
    cmp cmp esi, eax
    jl sub_1000662A
    test test bl, bl
    jne sub_100066A0
    mov mov eax, dword ptr [g_101CE5C0]
    inc inc ebp
    cmp cmp ebp, eax
    jl sub_1000661C
    pop pop ebp
    pop pop esi
    xor xor al, al
    pop pop ebx
    ret ret
    pop pop ebp
    pop pop esi
    mov mov al, 1
    pop pop ebx
    ret ret
FUN_100064b0 ENDP
END
