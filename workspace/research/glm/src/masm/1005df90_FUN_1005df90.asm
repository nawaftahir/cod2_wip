.686
.MODEL FLAT, C
EXTRN g_1019BC84:DWORD
EXTRN g_1019BD90:DWORD
EXTRN g_1019BD98:DWORD
.CODE
FUN_1005df90 PROC
    push ebp
    mov ebp, esp
    and esp, 0FFFFFFF8h
    sub esp, 80
    mov edx, dword ptr [eax + 4]
    mov ecx, dword ptr [eax]
    mov eax, dword ptr [eax + 8]
    push esi
    mov esi, edx
    mov dword ptr [esp + 40], edx
    mov edx, 2
    push edi
    mov edi, eax
    mov dword ptr [esp + 48], eax
    mov eax, 1
    mov dword ptr [esp + 68], edx
    mov dword ptr [esp + 72], edx
    xor edx, edx
    mov dword ptr [esp + 40], ecx
    mov dword ptr [esp + 52], ecx
    mov dword ptr [esp + 56], esi
    mov dword ptr [esp + 60], edi
    mov dword ptr [esp + 64], eax
    mov dword ptr [esp + 76], edx
    mov dword ptr [esp + 80], edx
    mov dword ptr [esp + 84], eax
L0:
    fld dword ptr [g_1019BC84]
    fld dword ptr [ebx + edx*4]
    fucompp
    fnstsw ax
    test ah, 68
    jnp L1
    fld dword ptr [ebx + edx*4]
    lea eax, [esp + 16]
    fmul dword ptr [g_1019BD98]
    lea ecx, [esp + 24]
    mov dword ptr [esp + 12], eax
    mov dword ptr [esp + 8], ecx
    fdiv qword ptr [g_1019BD90]
    fstp qword ptr [esp + 32]
    push eax
    push ecx
    fld qword ptr [esp + 40]
    fsincos
    mov ecx, dword ptr [esp + 20]
    mov eax, dword ptr [esp + 16]
    fstp qword ptr [ecx]
    fstp qword ptr [eax]
    pop ecx
    pop eax
    mov eax, dword ptr [esp + edx*8 + 64]
    mov ecx, dword ptr [esp + edx*8 + 68]
    shl eax, 2
    fld dword ptr [esp + eax + 40]
    lea esi, [esp + eax + 40]
    fmul qword ptr [esp + 16]
    shl ecx, 2
    fld dword ptr [esp + ecx + 40]
    fmul qword ptr [esp + 24]
    fsubp st(1)
    fstp dword ptr [esp + eax + 52]
    fld dword ptr [esp + ecx + 40]
    fmul qword ptr [esp + 16]
    fld dword ptr [esi]
    fmul qword ptr [esp + 24]
    faddp st(1)
    fstp dword ptr [esp + ecx + 52]
    mov esi, dword ptr [esp + 56]
    mov ecx, dword ptr [esp + 52]
    mov edi, dword ptr [esp + 60]
L1:
    inc edx
    cmp edx, 3
    mov dword ptr [esp + 40], ecx
    mov dword ptr [esp + 44], esi
    mov dword ptr [esp + 48], edi
    jl L0
    mov eax, dword ptr [ebp + 8]
    mov dword ptr [eax + 8], edi
    pop edi
    mov dword ptr [eax + 4], esi
    mov dword ptr [eax], ecx
    pop esi
    mov esp, ebp
    pop ebp
    ret
FUN_1005df90 ENDP
END
