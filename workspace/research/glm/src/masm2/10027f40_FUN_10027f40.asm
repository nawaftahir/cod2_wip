.686
.MODEL FLAT, C
EXTRN sub_10027792:PROC
EXTRN sub_1002811A:PROC
EXTRN sub_10028124:PROC
EXTRN sub_1002813C:PROC
EXTRN sub_10028142:PROC
EXTRN sub_1002818B:PROC
EXTRN sub_100281B0:PROC
EXTRN sub_100281EA:PROC
EXTRN sub_1002821B:PROC
EXTRN sub_10028234:PROC
EXTRN sub_10028266:PROC
EXTRN EXTRN g_1019BC78:DWORD:DWORD
EXTRN EXTRN g_1019BC84:DWORD:DWORD
EXTRN EXTRN g_1019BDE4:DWORD:DWORD
EXTRN EXTRN g_1019BF1C:DWORD:DWORD
EXTRN EXTRN g_101CE620:DWORD:DWORD
EXTRN EXTRN g_101CE718:DWORD:DWORD
EXTRN EXTRN g_101CE72C:DWORD:DWORD
EXTRN EXTRN g_101CE76C:DWORD:DWORD
EXTRN EXTRN g_101CE7D0:DWORD:DWORD
EXTRN EXTRN g_10678504:DWORD:DWORD
EXTRN EXTRN g_10678AB8:DWORD:DWORD
EXTRN EXTRN g_10696BD0:DWORD:DWORD
EXTRN EXTRN g_10696BD4:DWORD:DWORD
.CODE
FUN_10027f40 PROC
    sub sub esp, 24
    mov mov eax, dword ptr [g_101CE76C]
    fld fld dword ptr [g_1019BC78]
    push push ebx
    push push ebp
    push push esi
    xor xor esi, esi
    mov mov dword ptr [edi + 0A20h], esi
    fsub fsub dword ptr [eax + 8]
    mov mov ebp, dword ptr [esp + 44]
    mov mov ebx, dword ptr [g_10678AB8]
    fmul fmul dword ptr [g_10696BD0]
    mov mov dword ptr [esp + 20], esi
    fstp fstp dword ptr [esp + 28]
    fld fld dword ptr [g_10696BD0]
    fmul fmul dword ptr [eax + 8]
    fdivr fdivr dword ptr [g_1019BC78]
    fstp fstp dword ptr [esp + 32]
    jmp L0
    lea lea esp, [esp]
    mov mov ecx, dword ptr [ebp + esi*8]
    cmp cmp ecx, -1
    je L6
    fld fld dword ptr [ebp + esi*8 + 4]
    fst fst dword ptr [esp + 16]
    fcomp fcomp dword ptr [g_10696BD0]
    fnstsw fnstsw ax
    test test ah, 65
    je L4
    fld fld dword ptr [esp + 16]
    fcomp fcomp dword ptr [esp + 28]
    fnstsw fnstsw ax
    test test ah, 65
    jne L2
    fld fld dword ptr [g_1019BC84]
    fld fld dword ptr [esp + 16]
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jnp L3
    fld fld dword ptr [g_10696BD0]
    fsub fsub dword ptr [esp + 16]
    fmul fmul dword ptr [esp + 32]
    fstp fstp dword ptr [esp + 24]
    jmp L5
    mov mov dword ptr [esp + 24], 03F800000h
    mov mov eax, dword ptr [esp + 24]
    push push edi
    push push eax
    push push ecx
    mov mov ecx, dword ptr [esp + 52]
    push push ebx
    push push ecx
    call sub_10027792
    add add esp, 20
    inc inc esi
    cmp cmp esi, 24
    jne L1
    mov mov dword ptr [esp + 20], -1
    jmp sub_1002811A
    mov mov edx, dword ptr [g_101CE72C]
    mov mov eax, dword ptr [g_101CE718]
    mov mov ecx, dword ptr [edx + 8]
    mov mov eax, dword ptr [eax + 8]
    lea lea edx, [eax + ecx]
    cmp cmp esi, edx
    jle sub_10028124
    mov mov dword ptr [esp + 20], -1
    jmp sub_1002813C
    sub sub eax, ecx
    cmp cmp esi, eax
    jge sub_10028142
    mov mov dword ptr [esp + 20], 1
    mov mov eax, dword ptr [g_10696BD4]
    cmp cmp eax, -1
    mov mov ecx, dword ptr [g_10678504]
    je sub_1002818B
    mov mov edx, ecx
    sub sub edx, eax
    mov mov dword ptr [esp + 32], edx
    fild fild dword ptr [esp + 32]
    fmul fmul dword ptr [g_1019BDE4]
    fcom fcom dword ptr [g_1019BC84]
    fnstsw fnstsw ax
    test test ah, 5
    jp sub_100281B0
    fstp fstp st(0)
    fld fld dword ptr [g_1019BC84]
L3:
    mov mov eax, dword ptr [esp + 20]
    test test eax, eax
    mov mov dword ptr [g_10696BD4], ecx
    jle sub_100281EA
    mov mov eax, dword ptr [g_101CE7D0]
    fmul fmul dword ptr [eax + 8]
    fadd fadd dword ptr [g_10696BD0]
L5:
    fstp fstp dword ptr [g_10696BD0]
    jmp sub_1002821B
    jge sub_1002821B
L6:
    mov mov ecx, dword ptr [g_101CE620]
    fmul fmul dword ptr [ecx + 8]
    fsubr fsubr dword ptr [g_10696BD0]
    fstp fstp dword ptr [g_10696BD0]
    jmp sub_10028234
    fstp fstp st(0)
    fld fld dword ptr [g_10696BD0]
    fcomp fcomp dword ptr [g_1019BF1C]
    fnstsw fnstsw ax
    test test ah, 5
    jp sub_10028266
    mov mov dword ptr [g_10696BD0], 038D1B717h
FUN_10027f40 ENDP
END
