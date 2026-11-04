.686
.MODEL FLAT, C
EXTRN sub_10027792:PROC
EXTRN sub_10028266:PROC
EXTRN g_1019BC78:DWORD
EXTRN g_1019BC84:DWORD
EXTRN g_1019BDE4:DWORD
EXTRN g_1019BF1C:DWORD
EXTRN g_101CE620:DWORD
EXTRN g_101CE718:DWORD
EXTRN g_101CE72C:DWORD
EXTRN g_101CE76C:DWORD
EXTRN g_101CE7D0:DWORD
EXTRN g_10678504:DWORD
EXTRN g_10678AB8:DWORD
EXTRN g_10696BD0:DWORD
EXTRN g_10696BD4:DWORD
.CODE
FUN_10027f40 PROC
    sub esp, 24
    mov eax, dword ptr [g_101CE76C]
    fld dword ptr [g_1019BC78]
    push ebx
    push ebp
    push esi
    xor esi, esi
    mov dword ptr [edi + 000000A20h], esi
    fsub dword ptr [eax + 8]
    mov ebp, dword ptr [esp + 44]
    mov ebx, dword ptr [g_10678AB8]
    fmul dword ptr [g_10696BD0]
    mov dword ptr [esp + 20], esi
    fstp dword ptr [esp + 28]
    fld dword ptr [g_10696BD0]
    fmul dword ptr [eax + 8]
    fdivr dword ptr [g_1019BC78]
    fstp dword ptr [esp + 32]
    jmp L0
    lea esp, [esp]
L0:
    mov ecx, dword ptr [ebp + esi*8]
    cmp ecx, -1
    je L5
    fld dword ptr [ebp + esi*8 + 4]
    fst dword ptr [esp + 16]
    fcomp dword ptr [g_10696BD0]
    fnstsw ax
    test ah, 65
    je L3
    fld dword ptr [esp + 16]
    fcomp dword ptr [esp + 28]
    fnstsw ax
    test ah, 65
    jne L1
    fld dword ptr [g_1019BC84]
    fld dword ptr [esp + 16]
    fucompp
    fnstsw ax
    test ah, 68
    jnp L1
    fld dword ptr [g_10696BD0]
    fsub dword ptr [esp + 16]
    fmul dword ptr [esp + 32]
    fstp dword ptr [esp + 24]
    jmp L2
L1:
    mov dword ptr [esp + 24], 03F800000h
L2:
    mov eax, dword ptr [esp + 24]
    push edi
    push eax
    push ecx
    mov ecx, dword ptr [esp + 52]
    push ebx
    push ecx
    call sub_10027792
    add esp, 20
    inc esi
    cmp esi, 24
    jne L0
    mov dword ptr [esp + 20], 0FFFFFFFFh
    jmp L5
L3:
    mov edx, dword ptr [g_101CE72C]
    mov eax, dword ptr [g_101CE718]
    mov ecx, dword ptr [edx + 8]
    mov eax, dword ptr [eax + 8]
    lea edx, [eax + ecx]
    cmp esi, edx
    jle L4
    mov dword ptr [esp + 20], 0FFFFFFFFh
    jmp L5
L4:
    sub eax, ecx
    cmp esi, eax
    jge L5
    mov dword ptr [esp + 20], 1
L5:
    mov eax, dword ptr [g_10696BD4]
    cmp eax, -1
    mov ecx, dword ptr [g_10678504]
    je L6
    mov edx, ecx
    sub edx, eax
    mov dword ptr [esp + 32], edx
    fild dword ptr [esp + 32]
    fmul dword ptr [g_1019BDE4]
    fcom dword ptr [g_1019BC84]
    fnstsw ax
    test ah, 5
    jp L7
    fstp st(0)
L6:
    fld dword ptr [g_1019BC84]
L7:
    mov eax, dword ptr [esp + 20]
    test eax, eax
    mov dword ptr [g_10696BD4], ecx
    jle L8
    mov eax, dword ptr [g_101CE7D0]
    fmul dword ptr [eax + 8]
    fadd dword ptr [g_10696BD0]
    fstp dword ptr [g_10696BD0]
    jmp L10
L8:
    jge L9
    mov ecx, dword ptr [g_101CE620]
    fmul dword ptr [ecx + 8]
    fsubr dword ptr [g_10696BD0]
    fstp dword ptr [g_10696BD0]
    jmp L10
L9:
    fstp st(0)
L10:
    fld dword ptr [g_10696BD0]
    fcomp dword ptr [g_1019BF1C]
    fnstsw ax
    test ah, 5
    jp sub_10028266
    mov dword ptr [g_10696BD0], 038D1B717h
FUN_10027f40 ENDP
END
