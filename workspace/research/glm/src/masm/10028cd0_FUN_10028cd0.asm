.686
.MODEL FLAT, C
EXTRN sub_10017120:PROC
EXTRN sub_1001714D:PROC
EXTRN sub_1010AD41:PROC
EXTRN sub_1010AD79:PROC
EXTRN sub_1010AE0B:PROC
EXTRN sub_1010AE31:PROC
EXTRN sub_1010AEC3:PROC
EXTRN sub_1010AEEA:PROC
EXTRN g_1019BCB0:DWORD
EXTRN g_1019BD80:DWORD
EXTRN g_1019BD8C:DWORD
EXTRN g_1019BEE0:DWORD
EXTRN g_101D1B2C:DWORD
EXTRN g_10696BDC:DWORD
EXTRN g_10696BE0:DWORD
EXTRN g_10696BE4:DWORD
EXTRN g_10696BE8:DWORD
EXTRN g_10696BEC:DWORD
EXTRN g_10696BF0:DWORD
EXTRN g_10696BF4:DWORD
EXTRN g_10696BF8:DWORD
EXTRN g_10696BFC:DWORD
EXTRN g_10696C00:DWORD
EXTRN g_10696C04:DWORD
EXTRN g_10696C08:DWORD
EXTRN g_10696C0C:DWORD
EXTRN g_10696C10:DWORD
EXTRN g_10696C14:DWORD
EXTRN g_10696C18:DWORD
EXTRN g_10696C1C:DWORD
EXTRN g_10696C20:DWORD
EXTRN g_10696C24:DWORD
EXTRN g_10696C2C:DWORD
EXTRN g_10696C30:DWORD
.CODE
FUN_10028cd0 PROC
    mov eax, dword ptr [g_10696BE0]
    mov eax, dword ptr [eax + 8]
    mov cl, byte ptr [eax]
    sub esp, 48
    test cl, cl
    push edi
    jne L0
    mov eax, dword ptr [g_101D1B2C]
    jmp L1
L0:
    push 6
    call sub_10017120
    add esp, 4
L1:
    mov ecx, dword ptr [g_10696C2C]
    mov dword ptr [esi + 4], eax
    mov edx, dword ptr [ecx + 8]
    mov eax, dword ptr [g_10696C24]
    mov dword ptr [esi + 12], edx
    mov eax, dword ptr [eax + 8]
    cmp byte ptr [eax], 0
    jne L2
    mov eax, dword ptr [g_101D1B2C]
    jmp L3
L2:
    push 6
    call sub_1001714D
    add esp, 4
L3:
    mov ecx, dword ptr [g_10696BDC]
    mov edx, dword ptr [g_10696C1C]
    mov dword ptr [esi + 8], eax
    fld dword ptr [ecx + 8]
    fmul dword ptr [g_1019BCB0]
    fstp dword ptr [esi + 16]
    fld dword ptr [edx + 8]
    fmul dword ptr [g_1019BD8C]
    fstp dword ptr [esp + 32]
    fld dword ptr [esp + 32]
    call sub_1010AD41
    fstp dword ptr [esp + 32]
    fld dword ptr [esp + 32]
    mov eax, dword ptr [g_10696C20]
    mov ecx, dword ptr [g_10696C0C]
    fstp dword ptr [esi + 20]
    fld dword ptr [eax + 8]
    fmul dword ptr [g_1019BCB0]
    fstp dword ptr [esi + 24]
    fld dword ptr [ecx + 8]
    fmul dword ptr [g_1019BD8C]
    fstp dword ptr [esp + 32]
    fld dword ptr [esp + 32]
    call sub_1010AD79
    fstp dword ptr [esp + 32]
    fld dword ptr [esp + 32]
    mov edx, dword ptr [g_10696C04]
    mov ecx, dword ptr [g_10696BF8]
    fstp dword ptr [esi + 28]
    mov eax, dword ptr [edx + 8]
    mov dword ptr [esi + 32], eax
    fld dword ptr [ecx + 8]
    fmul dword ptr [g_1019BEE0]
    fstp dword ptr [esp + 32]
    fld qword ptr [g_1019BD80]
    fstp qword ptr [esp + 40]
    fld dword ptr [esp + 32]
    fadd qword ptr [esp + 40]
    fistp dword ptr [esp + 28]
    mov edx, dword ptr [esp + 28]
    mov eax, dword ptr [g_10696C00]
    mov dword ptr [esi + 36], edx
    fld dword ptr [eax + 8]
    fmul dword ptr [g_1019BEE0]
    fstp dword ptr [esp + 32]
    fld qword ptr [g_1019BD80]
    fstp qword ptr [esp + 40]
    fld dword ptr [esp + 32]
    fadd qword ptr [esp + 40]
    fistp dword ptr [esp + 28]
    mov ecx, dword ptr [esp + 28]
    mov edx, dword ptr [g_10696BE4]
    mov dword ptr [esi + 40], ecx
    fld dword ptr [edx + 8]
    fmul dword ptr [g_1019BD8C]
    fstp dword ptr [esp + 32]
    fld dword ptr [esp + 32]
    call sub_1010AE0B
    fstp dword ptr [esp + 32]
    fld dword ptr [esp + 32]
    mov eax, dword ptr [g_10696C10]
    fstp dword ptr [esi + 44]
    fld dword ptr [eax + 8]
    fmul dword ptr [g_1019BD8C]
    fstp dword ptr [esp + 32]
    fld dword ptr [esp + 32]
    call sub_1010AE31
    fstp dword ptr [esp + 32]
    fld dword ptr [esp + 32]
    mov ecx, dword ptr [g_10696C08]
    fstp dword ptr [esi + 48]
    mov edx, dword ptr [ecx + 8]
    mov dword ptr [esi + 52], edx
    mov eax, dword ptr [g_10696BFC]
    fld dword ptr [eax + 8]
    fmul dword ptr [g_1019BEE0]
    fstp dword ptr [esp + 32]
    fld qword ptr [g_1019BD80]
    fstp qword ptr [esp + 40]
    fld dword ptr [esp + 32]
    fadd qword ptr [esp + 40]
    fistp dword ptr [esp + 28]
    mov ecx, dword ptr [esp + 28]
    mov edx, dword ptr [g_10696BE8]
    mov dword ptr [esi + 56], ecx
    fld dword ptr [edx + 8]
    fmul dword ptr [g_1019BEE0]
    fstp dword ptr [esp + 32]
    fld qword ptr [g_1019BD80]
    fstp qword ptr [esp + 40]
    fld dword ptr [esp + 32]
    fadd qword ptr [esp + 40]
    fistp dword ptr [esp + 28]
    mov eax, dword ptr [esp + 28]
    mov ecx, dword ptr [g_10696C18]
    mov dword ptr [esi + 60], eax
    fld dword ptr [ecx + 8]
    fmul dword ptr [g_1019BD8C]
    fstp dword ptr [esp + 32]
    fld dword ptr [esp + 32]
    call sub_1010AEC3
    fstp dword ptr [esp + 32]
    fld dword ptr [esp + 32]
    mov edx, dword ptr [g_10696C14]
    fstp dword ptr [esi + 64]
    fld dword ptr [edx + 8]
    fmul dword ptr [g_1019BD8C]
    fstp dword ptr [esp + 32]
    fld dword ptr [esp + 32]
    call sub_1010AEEA
    fstp dword ptr [esp + 32]
    fld dword ptr [esp + 32]
    mov eax, dword ptr [g_10696C30]
    mov edx, dword ptr [g_10696BF0]
    fstp dword ptr [esi + 68]
    mov ecx, dword ptr [eax + 8]
    mov dword ptr [esi + 72], ecx
    fld dword ptr [edx + 8]
    fmul dword ptr [g_1019BEE0]
    fstp dword ptr [esp + 32]
    fld qword ptr [g_1019BD80]
    fstp qword ptr [esp + 40]
    fld dword ptr [esp + 32]
    fadd qword ptr [esp + 40]
    fistp dword ptr [esp + 28]
    mov eax, dword ptr [esp + 28]
    mov ecx, dword ptr [g_10696BF4]
    mov dword ptr [esi + 76], eax
    fld dword ptr [ecx + 8]
    fmul dword ptr [g_1019BEE0]
    fstp dword ptr [esp + 32]
    fld qword ptr [g_1019BD80]
    fstp qword ptr [esp + 40]
    fld dword ptr [esp + 32]
    fadd qword ptr [esp + 40]
    fistp dword ptr [esp + 28]
    mov edx, dword ptr [esp + 28]
    mov eax, dword ptr [g_10696BEC]
    mov dword ptr [esi + 80], edx
    mov edi, dword ptr [eax + 8]
    fld dword ptr [edi + 4]
    lea ecx, [esp + 12]
    fmul dword ptr [g_1019BD8C]
    lea eax, [esp + 16]
    lea edx, [esi + 84]
    mov dword ptr [esp + 40], ecx
    fstp dword ptr [esp + 24]
    mov dword ptr [esp + 36], eax
    push eax
    push ecx
    fld dword ptr [esp + 32]
    fsincos
    mov ecx, dword ptr [esp + 48]
    mov eax, dword ptr [esp + 44]
    fstp dword ptr [ecx]
    fstp dword ptr [eax]
    pop ecx
    pop eax
    fld dword ptr [edi]
    fmul dword ptr [g_1019BD8C]
    lea ecx, [esp + 8]
    lea eax, [esp + 20]
    mov dword ptr [esp + 36], ecx
    fstp dword ptr [esp + 24]
    mov dword ptr [esp + 40], eax
    push eax
    push ecx
    fld dword ptr [esp + 32]
    fsincos
    mov ecx, dword ptr [esp + 44]
    mov eax, dword ptr [esp + 48]
    fstp dword ptr [ecx]
    fstp dword ptr [eax]
    pop ecx
    pop eax
    test edx, edx
    je L4
    fld dword ptr [esp + 8]
    fmul dword ptr [esp + 12]
    fstp dword ptr [edx]
    fld dword ptr [esp + 8]
    fmul dword ptr [esp + 16]
    fstp dword ptr [edx + 4]
    fld dword ptr [esp + 20]
    fchs
    fstp dword ptr [edx + 8]
L4:
    mov byte ptr [esi], 1
    pop edi
    add esp, 48
    ret
FUN_10028cd0 ENDP
END
