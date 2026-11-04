.686
.MODEL FLAT, C
EXTRN g_1019BC84:DWORD
EXTRN g_101CE5C0:DWORD
EXTRN g_101CE5C4:DWORD
.CODE
FUN_100064b0 PROC
    push ebx
    push esi
    mov esi, eax
    xor edx, edx
    test esi, esi
    jle L2
    add ecx, 19
    lea ecx, [ecx]
L0:
    movzx eax, byte ptr [ecx]
    cmp dword ptr [esp + 12], eax
    jg L1
    movzx eax, byte ptr [ecx - 3]
    mov byte ptr [ecx], 0000000FFh
    fld dword ptr [eax + edi]
    movzx eax, byte ptr [ecx - 2]
    fmul dword ptr [ecx - 19]
    fld dword ptr [eax + edi]
    movzx eax, byte ptr [ecx - 1]
    fmul dword ptr [ecx - 15]
    faddp st(1)
    fld dword ptr [eax + edi]
    fmul dword ptr [ecx - 11]
    faddp st(1)
    fadd dword ptr [ecx - 7]
    fcomp dword ptr [g_1019BC84]
    fnstsw ax
    test ah, 65
    jnp L5
L1:
    inc edx
    add ecx, 20
    cmp edx, esi
    jl L0
L2:
    mov eax, dword ptr [g_101CE5C0]
    push ebp
    xor ebp, ebp
    test eax, eax
    jle L9
    lea ebx, [ebx]
L3:
    mov ecx, dword ptr [g_101CE5C4]
    mov edx, dword ptr [ecx + ebp*4]
    mov eax, dword ptr [esp + 16]
    cmp eax, dword ptr [edx + 24]
    jg L8
    mov eax, dword ptr [edx + 28]
    mov ecx, dword ptr [edx + 32]
    xor esi, esi
    test eax, eax
    mov bl, 1
    jle L10
L4:
    movzx eax, byte ptr [ecx + 19]
    cmp dword ptr [esp + 16], eax
    jg L7
    movzx eax, byte ptr [ecx + 17]
    mov byte ptr [ecx + 19], 0000000FFh
    fld dword ptr [eax + edi]
    movzx eax, byte ptr [ecx + 16]
    fmul dword ptr [ecx + 4]
    fld dword ptr [eax + edi]
    movzx eax, byte ptr [ecx + 18]
    fmul dword ptr [ecx]
    faddp st(1)
    fld dword ptr [eax + edi]
    fmul dword ptr [ecx + 8]
    faddp st(1)
    fadd dword ptr [ecx + 12]
    fcomp dword ptr [g_1019BC84]
    fnstsw ax
    test ah, 65
    jne L6
    xor bl, bl
    jmp L7
L5:
    pop esi
    mov al, 1
    pop ebx
    ret
L6:
    mov al, byte ptr [esp + 16]
    mov byte ptr [ecx + 19], al
L7:
    mov eax, dword ptr [edx + 28]
    inc esi
    add ecx, 20
    cmp esi, eax
    jl L4
    test bl, bl
    jne L10
L8:
    mov eax, dword ptr [g_101CE5C0]
    inc ebp
    cmp ebp, eax
    jl L3
L9:
    pop ebp
    pop esi
    xor al, al
    pop ebx
    ret
L10:
    pop ebp
    pop esi
    mov al, 1
    pop ebx
    ret
FUN_100064b0 ENDP
END
