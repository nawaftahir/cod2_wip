.686
.MODEL FLAT, C
EXTRN sub_10006677:PROC
EXTRN sub_10006682:PROC
EXTRN sub_100066C3:PROC
EXTRN sub_100066C9:PROC
EXTRN sub_100066D1:PROC
EXTRN sub_100066E3:PROC
EXTRN EXTRN g_1019BC84:DWORD:DWORD
EXTRN EXTRN g_101CE5C0:DWORD:DWORD
EXTRN EXTRN g_101CE5C4:DWORD:DWORD
.CODE
FUN_100065c0 PROC
    push push ebx
    push push esi
    xor xor bl, bl
    test test eax, eax
    push push edi
    mov mov esi, edx
    jle L0
    add add ecx, 17
    mov mov edx, eax
    movzx movzx eax, byte ptr [ecx + 2]
    cmp cmp dword ptr [esp + 16], eax
    jg L2
    movzx movzx eax, byte ptr [ecx - 1]
    mov mov edi, esi
    sub sub edi, eax
    movzx movzx eax, byte ptr [ecx]
    fld fld dword ptr [edi + 12]
    fmul fmul dword ptr [ecx - 17]
    mov mov edi, esi
    sub sub edi, eax
    movzx movzx eax, byte ptr [ecx + 1]
    fld fld dword ptr [edi + 20]
    fmul fmul dword ptr [ecx - 13]
    mov mov edi, esi
    sub sub edi, eax
    faddp faddp st(1)
    fld fld dword ptr [edi + 28]
    fmul fmul dword ptr [ecx - 9]
    faddp faddp st(1)
    fadd fadd dword ptr [ecx - 5]
    fcomp fcomp dword ptr [g_1019BC84]
    fnstsw fnstsw ax
    test test ah, 1
    jne sub_10006677
    mov mov al, byte ptr [esp + 16]
    mov mov byte ptr [ecx + 2], al
    jmp sub_10006682
    mov mov bl, 1
    add add ecx, 20
    dec dec edx
    jne L1
    test test bl, bl
    jne sub_100066C3
    mov mov esi, dword ptr [g_101CE5C0]
    xor xor eax, eax
    test test esi, esi
    jle sub_100066C9
L1:
    mov mov ecx, dword ptr [g_101CE5C4]
    mov mov edi, edi
    mov mov edx, dword ptr [ecx + eax*4]
    mov mov edi, dword ptr [esp + 16]
    cmp cmp edi, dword ptr [edx + 24]
    jle sub_100066E3
    inc inc eax
    cmp cmp eax, esi
    jl sub_100066D1
    pop pop edi
    pop pop esi
    xor xor al, al
    pop pop ebx
    ret ret
    pop pop edi
    pop pop esi
    mov mov al, 1
    pop pop ebx
    ret ret
FUN_100065c0 ENDP
END
