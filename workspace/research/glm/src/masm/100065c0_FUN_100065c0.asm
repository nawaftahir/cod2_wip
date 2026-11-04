.686
.MODEL FLAT, C
EXTRN g_1019BC84:DWORD
EXTRN g_101CE5C0:DWORD
EXTRN g_101CE5C4:DWORD
.CODE
FUN_100065c0 PROC
    push ebx
    push esi
    xor bl, bl
    test eax, eax
    push edi
    mov esi, edx
    jle L3
    add ecx, 17
    mov edx, eax
L0:
    movzx eax, byte ptr [ecx + 2]
    cmp dword ptr [esp + 16], eax
    jg L2
    movzx eax, byte ptr [ecx - 1]
    mov edi, esi
    sub edi, eax
    movzx eax, byte ptr [ecx]
    fld dword ptr [edi + 12]
    fmul dword ptr [ecx - 17]
    mov edi, esi
    sub edi, eax
    movzx eax, byte ptr [ecx + 1]
    fld dword ptr [edi + 20]
    fmul dword ptr [ecx - 13]
    mov edi, esi
    sub edi, eax
    faddp st(1)
    fld dword ptr [edi + 28]
    fmul dword ptr [ecx - 9]
    faddp st(1)
    fadd dword ptr [ecx - 5]
    fcomp dword ptr [g_1019BC84]
    fnstsw ax
    test ah, 1
    jne L1
    mov al, byte ptr [esp + 16]
    mov byte ptr [ecx + 2], al
    jmp L2
L1:
    mov bl, 1
L2:
    add ecx, 20
    dec edx
    jne L0
    test bl, bl
    jne L6
L3:
    mov esi, dword ptr [g_101CE5C0]
    xor eax, eax
    test esi, esi
    jle L5
    mov ecx, dword ptr [g_101CE5C4]
    mov edi, edi
L4:
    mov edx, dword ptr [ecx + eax*4]
    mov edi, dword ptr [esp + 16]
    cmp edi, dword ptr [edx + 24]
    jle L6
    inc eax
    cmp eax, esi
    jl L4
L5:
    pop edi
    pop esi
    xor al, al
    pop ebx
    ret
L6:
    pop edi
    pop esi
    mov al, 1
    pop ebx
    ret
FUN_100065c0 ENDP
END
