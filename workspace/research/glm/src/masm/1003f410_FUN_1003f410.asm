.686
.MODEL FLAT, C
EXTRN sub_1002DF69:PROC
EXTRN g_1072D9B0:DWORD
EXTRN g_1072D9D0:DWORD
EXTRN g_1072D9D4:DWORD
EXTRN g_1072DDC8:DWORD
.CODE
FUN_1003f410 PROC
    mov eax, dword ptr [g_1072D9D4]
    sub esp, 28
    add eax, 4
    cmp eax, 00000154Ah
    push ebp
    jg L0
    mov ecx, dword ptr [g_1072D9D0]
    add ecx, 6
    cmp ecx, 000100000h
    jle L1
L0:
    call sub_1002DF69
L1:
    mov eax, dword ptr [g_1072D9D4]
    mov edx, dword ptr [g_1072D9B0]
    mov ecx, dword ptr [g_1072D9D0]
    mov word ptr [edx + ecx*2], ax
    mov edx, dword ptr [g_1072D9B0]
    mov ebp, dword ptr [g_1072D9D0]
    lea ecx, [eax + 1]
    mov word ptr [edx + ebp*2 + 2], cx
    mov edx, dword ptr [g_1072D9B0]
    mov ebp, dword ptr [g_1072D9D0]
    lea ecx, [eax + 3]
    mov word ptr [edx + ebp*2 + 4], cx
    mov edx, dword ptr [g_1072D9B0]
    mov ebp, dword ptr [g_1072D9D0]
    mov word ptr [edx + ebp*2 + 6], cx
    mov edx, dword ptr [g_1072D9B0]
    mov ebp, dword ptr [g_1072D9D0]
    lea ecx, [eax + 1]
    mov word ptr [edx + ebp*2 + 8], cx
    mov edx, dword ptr [g_1072D9D0]
    mov ebp, dword ptr [g_1072D9B0]
    lea ecx, [eax + 2]
    mov word ptr [ebp + edx*2 + 10], cx
    fld dword ptr [ebx]
    fadd dword ptr [edi]
    movzx eax, ax
    fld dword ptr [edi + 4]
    lea eax, [eax + eax*8]
    fadd dword ptr [ebx + 4]
    lea eax, [eax*4 + 0106D3200h]
    fld dword ptr [ebx + 8]
    mov ecx, dword ptr [g_1072DDC8]
    fadd dword ptr [edi + 8]
    fstp dword ptr [esp + 28]
    fld dword ptr [ebx]
    fsub dword ptr [edi]
    fstp dword ptr [esp + 8]
    fld dword ptr [ebx + 4]
    fsub dword ptr [edi + 4]
    fstp dword ptr [esp + 12]
    fld dword ptr [ebx + 8]
    fsub dword ptr [edi + 8]
    fstp dword ptr [esp + 16]
    fld st(1)
    fadd dword ptr [esi]
    fstp dword ptr [eax]
    fld st(0)
    fadd dword ptr [esi + 4]
    fstp dword ptr [eax + 4]
    fld dword ptr [esp + 28]
    fadd dword ptr [esi + 8]
    fstp dword ptr [eax + 8]
    fld dword ptr [esi]
    fsub dword ptr [esp + 8]
    fstp dword ptr [eax + 36]
    fld dword ptr [esi + 4]
    fsub dword ptr [esp + 12]
    fstp dword ptr [eax + 40]
    fld dword ptr [esi + 8]
    fsub dword ptr [esp + 16]
    fstp dword ptr [eax + 44]
    fld dword ptr [esi]
    fsub st(2)
    fstp dword ptr [eax + 72]
    fld dword ptr [esi + 4]
    fsub st(1)
    fstp dword ptr [eax + 76]
    fstp st(0)
    fstp st(0)
    fld dword ptr [esi + 8]
    fsub dword ptr [esp + 28]
    fstp dword ptr [eax + 80]
    fld dword ptr [esp + 8]
    fadd dword ptr [esi]
    fstp dword ptr [eax + 108]
    fld dword ptr [esp + 12]
    fadd dword ptr [esi + 4]
    fstp dword ptr [eax + 112]
    fld dword ptr [esp + 16]
    fadd dword ptr [esi + 8]
    fstp dword ptr [eax + 116]
    fld dword ptr [ecx + 12]
    mov edx, dword ptr [esp + 40]
    fchs
    pop ebp
    fld dword ptr [ecx + 16]
    fchs
    fld dword ptr [ecx + 20]
    fchs
    fst dword ptr [esp + 24]
    mov ecx, dword ptr [esp + 24]
    fld st(2)
    fstp dword ptr [eax + 12]
    fld st(1)
    fstp dword ptr [eax + 16]
    fst dword ptr [eax + 20]
    fld st(2)
    fstp dword ptr [eax + 48]
    fld st(1)
    fstp dword ptr [eax + 52]
    fst dword ptr [eax + 56]
    fld st(2)
    fstp dword ptr [eax + 84]
    fld st(1)
    fstp dword ptr [eax + 88]
    fstp dword ptr [eax + 92]
    mov dword ptr [eax + 000000080h], ecx
    mov ecx, dword ptr [esp + 40]
    fxch st(1)
    fstp dword ptr [eax + 120]
    fstp dword ptr [eax + 124]
    mov dword ptr [eax + 32], ecx
    mov dword ptr [eax + 28], edx
    mov edx, dword ptr [esp + 44]
    mov dword ptr [eax + 68], ecx
    mov ecx, dword ptr [esp + 48]
    mov dword ptr [eax + 64], edx
    mov dword ptr [eax + 104], ecx
    mov dword ptr [eax + 100], edx
    mov edx, dword ptr [esp + 36]
    mov dword ptr [eax + 00000008Ch], ecx
    mov ecx, dword ptr [esp + 32]
    mov dword ptr [eax + 000000088h], edx
    mov dword ptr [eax + 24], ecx
    mov dword ptr [eax + 60], ecx
    mov dword ptr [eax + 96], ecx
    mov dword ptr [eax + 000000084h], ecx
    mov ecx, dword ptr [g_1072D9D4]
    mov eax, dword ptr [g_1072D9D0]
    add ecx, 4
    add eax, 6
    mov dword ptr [g_1072D9D4], ecx
    mov dword ptr [g_1072D9D0], eax
    add esp, 28
    ret
FUN_1003f410 ENDP
END
