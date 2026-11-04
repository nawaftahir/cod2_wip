.686
.MODEL FLAT, C
EXTRN sub_1002DF69:PROC
EXTRN EXTRN g_1072D9B0:DWORD:DWORD
EXTRN EXTRN g_1072D9D0:DWORD:DWORD
EXTRN EXTRN g_1072D9D4:DWORD:DWORD
EXTRN EXTRN g_1072DDC8:DWORD:DWORD
.CODE
FUN_1003f410 PROC
    mov mov eax, dword ptr [g_1072D9D4]
    sub sub esp, 28
    add add eax, 4
    cmp cmp eax, 0154Ah
    push push ebp
    jg L0
    mov mov ecx, dword ptr [g_1072D9D0]
    add add ecx, 6
    cmp cmp ecx, 0100000h
    jle L1
    call sub_1002DF69
    mov mov eax, dword ptr [g_1072D9D4]
    mov mov edx, dword ptr [g_1072D9B0]
    mov mov ecx, dword ptr [g_1072D9D0]
    mov mov word ptr [edx + ecx*2], ax
    mov mov edx, dword ptr [g_1072D9B0]
    mov mov ebp, dword ptr [g_1072D9D0]
    lea lea ecx, [eax + 1]
L1:
    mov mov word ptr [edx + ebp*2 + 2], cx
    mov mov edx, dword ptr [g_1072D9B0]
    mov mov ebp, dword ptr [g_1072D9D0]
    lea lea ecx, [eax + 3]
    mov mov word ptr [edx + ebp*2 + 4], cx
    mov mov edx, dword ptr [g_1072D9B0]
    mov mov ebp, dword ptr [g_1072D9D0]
    mov mov word ptr [edx + ebp*2 + 6], cx
    mov mov edx, dword ptr [g_1072D9B0]
    mov mov ebp, dword ptr [g_1072D9D0]
    lea lea ecx, [eax + 1]
    mov mov word ptr [edx + ebp*2 + 8], cx
    mov mov edx, dword ptr [g_1072D9D0]
    mov mov ebp, dword ptr [g_1072D9B0]
    lea lea ecx, [eax + 2]
    mov mov word ptr [ebp + edx*2 + 10], cx
    fld fld dword ptr [ebx]
    fadd fadd dword ptr [edi]
    movzx movzx eax, ax
    fld fld dword ptr [edi + 4]
    lea lea eax, [eax + eax*8]
    fadd fadd dword ptr [ebx + 4]
    lea lea eax, [eax*4 + 0106D3200h]
    fld fld dword ptr [ebx + 8]
    mov mov ecx, dword ptr [g_1072DDC8]
    fadd fadd dword ptr [edi + 8]
    fstp fstp dword ptr [esp + 28]
    fld fld dword ptr [ebx]
    fsub fsub dword ptr [edi]
    fstp fstp dword ptr [esp + 8]
    fld fld dword ptr [ebx + 4]
    fsub fsub dword ptr [edi + 4]
    fstp fstp dword ptr [esp + 12]
    fld fld dword ptr [ebx + 8]
    fsub fsub dword ptr [edi + 8]
    fstp fstp dword ptr [esp + 16]
    fld fld st(1)
    fadd fadd dword ptr [esi]
    fstp fstp dword ptr [eax]
    fld fld st(0)
    fadd fadd dword ptr [esi + 4]
    fstp fstp dword ptr [eax + 4]
    fld fld dword ptr [esp + 28]
    fadd fadd dword ptr [esi + 8]
    fstp fstp dword ptr [eax + 8]
    fld fld dword ptr [esi]
    fsub fsub dword ptr [esp + 8]
    fstp fstp dword ptr [eax + 36]
    fld fld dword ptr [esi + 4]
    fsub fsub dword ptr [esp + 12]
    fstp fstp dword ptr [eax + 40]
    fld fld dword ptr [esi + 8]
    fsub fsub dword ptr [esp + 16]
    fstp fstp dword ptr [eax + 44]
    fld fld dword ptr [esi]
    fsub fsub st(2)
    fstp fstp dword ptr [eax + 72]
    fld fld dword ptr [esi + 4]
    fsub fsub st(1)
    fstp fstp dword ptr [eax + 76]
    fstp fstp st(0)
    fstp fstp st(0)
    fld fld dword ptr [esi + 8]
    fsub fsub dword ptr [esp + 28]
    fstp fstp dword ptr [eax + 80]
    fld fld dword ptr [esp + 8]
    fadd fadd dword ptr [esi]
    fstp fstp dword ptr [eax + 108]
    fld fld dword ptr [esp + 12]
    fadd fadd dword ptr [esi + 4]
    fstp fstp dword ptr [eax + 112]
    fld fld dword ptr [esp + 16]
    fadd fadd dword ptr [esi + 8]
    fstp fstp dword ptr [eax + 116]
    fld fld dword ptr [ecx + 12]
    mov mov edx, dword ptr [esp + 40]
    fchs fchs
    pop pop ebp
    fld fld dword ptr [ecx + 16]
    fchs fchs
    fld fld dword ptr [ecx + 20]
    fchs fchs
    fst fst dword ptr [esp + 24]
    mov mov ecx, dword ptr [esp + 24]
    fld fld st(2)
    fstp fstp dword ptr [eax + 12]
    fld fld st(1)
    fstp fstp dword ptr [eax + 16]
    fst fst dword ptr [eax + 20]
    fld fld st(2)
    fstp fstp dword ptr [eax + 48]
    fld fld st(1)
    fstp fstp dword ptr [eax + 52]
    fst fst dword ptr [eax + 56]
    fld fld st(2)
    fstp fstp dword ptr [eax + 84]
    fld fld st(1)
    fstp fstp dword ptr [eax + 88]
    fstp fstp dword ptr [eax + 92]
    mov mov dword ptr [eax + 080h], ecx
    mov mov ecx, dword ptr [esp + 40]
    fxch fxch st(1)
    fstp fstp dword ptr [eax + 120]
    fstp fstp dword ptr [eax + 124]
    mov mov dword ptr [eax + 32], ecx
    mov mov dword ptr [eax + 28], edx
    mov mov edx, dword ptr [esp + 44]
    mov mov dword ptr [eax + 68], ecx
    mov mov ecx, dword ptr [esp + 48]
    mov mov dword ptr [eax + 64], edx
    mov mov dword ptr [eax + 104], ecx
    mov mov dword ptr [eax + 100], edx
    mov mov edx, dword ptr [esp + 36]
    mov mov dword ptr [eax + 08Ch], ecx
    mov mov ecx, dword ptr [esp + 32]
    mov mov dword ptr [eax + 088h], edx
    mov mov dword ptr [eax + 24], ecx
    mov mov dword ptr [eax + 60], ecx
    mov mov dword ptr [eax + 96], ecx
    mov mov dword ptr [eax + 084h], ecx
    mov mov ecx, dword ptr [g_1072D9D4]
    mov mov eax, dword ptr [g_1072D9D0]
    add add ecx, 4
    add add eax, 6
    mov mov dword ptr [g_1072D9D4], ecx
    mov mov dword ptr [g_1072D9D0], eax
    add add esp, 28
    ret ret
FUN_1003f410 ENDP
END
