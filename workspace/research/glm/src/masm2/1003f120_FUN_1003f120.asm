.686
.MODEL FLAT, C
EXTRN sub_1002DF69:PROC
EXTRN EXTRN g_1072D9B0:DWORD:DWORD
EXTRN EXTRN g_1072D9D0:DWORD:DWORD
EXTRN EXTRN g_1072D9D4:DWORD:DWORD
EXTRN EXTRN g_1072DDC8:DWORD:DWORD
.CODE
FUN_1003f120 PROC
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
    shl shl eax, 6
    fadd fadd dword ptr [ebx + 4]
    add add eax, 0106D3200h
    fld fld dword ptr [ebx + 8]
    mov mov ecx, 03F800000h
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
    fstp fstp dword ptr [eax + 64]
    fld fld dword ptr [esi + 4]
    fsub fsub dword ptr [esp + 12]
    fstp fstp dword ptr [eax + 68]
    fld fld dword ptr [esi + 8]
    fsub fsub dword ptr [esp + 16]
    fstp fstp dword ptr [eax + 72]
    fld fld dword ptr [esi]
    fsub fsub st(2)
    fstp fstp dword ptr [eax + 080h]
    fld fld dword ptr [esi + 4]
    fsub fsub st(1)
    fstp fstp dword ptr [eax + 084h]
    fstp fstp st(0)
    fstp fstp st(0)
    fld fld dword ptr [esi + 8]
    fsub fsub dword ptr [esp + 28]
    fstp fstp dword ptr [eax + 088h]
    fld fld dword ptr [esp + 8]
    fadd fadd dword ptr [esi]
    fstp fstp dword ptr [eax + 0C0h]
    fld fld dword ptr [esp + 12]
    fadd fadd dword ptr [esi + 4]
    fstp fstp dword ptr [eax + 0C4h]
    fld fld dword ptr [esp + 16]
    fadd fadd dword ptr [esi + 8]
    fstp fstp dword ptr [eax + 0C8h]
    mov mov dword ptr [eax + 12], ecx
    mov mov dword ptr [eax + 76], ecx
    mov mov dword ptr [eax + 08Ch], ecx
    mov mov dword ptr [eax + 0CCh], ecx
    mov mov ecx, dword ptr [g_1072DDC8]
    fld fld dword ptr [ecx + 12]
    fchs fchs
    fld fld dword ptr [ecx + 16]
    fchs fchs
    fld fld dword ptr [ecx + 20]
    fchs fchs
    fst fst dword ptr [esp + 28]
    mov mov ecx, dword ptr [esp + 28]
    fld fld st(2)
    fstp fstp dword ptr [eax + 16]
    fld fld st(1)
    fstp fstp dword ptr [eax + 20]
    fst fst dword ptr [eax + 24]
    fld fld st(2)
    fstp fstp dword ptr [eax + 80]
    fld fld st(1)
    fstp fstp dword ptr [eax + 84]
    fst fst dword ptr [eax + 88]
    fld fld st(2)
    fstp fstp dword ptr [eax + 090h]
    fld fld st(1)
    fstp fstp dword ptr [eax + 094h]
    fstp fstp dword ptr [eax + 098h]
    mov mov dword ptr [eax + 0D8h], ecx
    fxch fxch st(1)
    fstp fstp dword ptr [eax + 0D0h]
    fstp fstp dword ptr [eax + 0D4h]
    fld fld dword ptr [edi]
    fld fld dword ptr [edi + 4]
    fld fld dword ptr [edi + 8]
    fst fst dword ptr [esp + 28]
    mov mov edx, dword ptr [esp + 28]
    fld fld st(2)
    fstp fstp dword ptr [eax + 40]
    fld fld st(1)
    fstp fstp dword ptr [eax + 44]
    fst fst dword ptr [eax + 48]
    fld fld st(2)
    fstp fstp dword ptr [eax + 104]
    fld fld st(1)
    fstp fstp dword ptr [eax + 108]
    fst fst dword ptr [eax + 112]
    fld fld st(2)
    fstp fstp dword ptr [eax + 0A8h]
    fld fld st(1)
    fstp fstp dword ptr [eax + 0ACh]
    fstp fstp dword ptr [eax + 0B0h]
    mov mov dword ptr [eax + 0F0h], edx
    fxch fxch st(1)
    fstp fstp dword ptr [eax + 0E8h]
    fstp fstp dword ptr [eax + 0ECh]
    fld fld dword ptr [ebx]
    fchs fchs
    fld fld dword ptr [ebx + 4]
    fchs fchs
    fld fld dword ptr [ebx + 8]
    fchs fchs
    fst fst dword ptr [esp + 28]
    fld fld st(2)
    fstp fstp dword ptr [eax + 52]
    fld fld st(1)
    fstp fstp dword ptr [eax + 56]
    fst fst dword ptr [eax + 60]
    fld fld st(2)
    fstp fstp dword ptr [eax + 116]
    fld fld st(1)
    fstp fstp dword ptr [eax + 120]
    fst fst dword ptr [eax + 124]
    fld fld st(2)
    fstp fstp dword ptr [eax + 0B4h]
    fld fld st(1)
    fstp fstp dword ptr [eax + 0B8h]
    fstp fstp dword ptr [eax + 0BCh]
    fxch fxch st(1)
    fstp fstp dword ptr [eax + 0F4h]
    fstp fstp dword ptr [eax + 0F8h]
    mov mov ecx, dword ptr [esp + 28]
    mov mov edx, dword ptr [esp + 40]
    mov mov dword ptr [eax + 0FCh], ecx
    mov mov ecx, dword ptr [esp + 44]
    mov mov dword ptr [eax + 36], ecx
    mov mov dword ptr [eax + 32], edx
    mov mov edx, dword ptr [esp + 48]
    mov mov dword ptr [eax + 100], ecx
    mov mov ecx, dword ptr [esp + 52]
    mov mov dword ptr [eax + 96], edx
    mov mov dword ptr [eax + 0A4h], ecx
    mov mov dword ptr [eax + 0A0h], edx
    mov mov edx, dword ptr [esp + 40]
    mov mov dword ptr [eax + 0E4h], ecx
    mov mov ecx, dword ptr [esp + 36]
    mov mov dword ptr [eax + 0E0h], edx
    mov mov dword ptr [eax + 28], ecx
    mov mov dword ptr [eax + 92], ecx
    mov mov dword ptr [eax + 09Ch], ecx
    mov mov dword ptr [eax + 0DCh], ecx
    mov mov ecx, dword ptr [g_1072D9D4]
    mov mov eax, dword ptr [g_1072D9D0]
    add add ecx, 4
    add add eax, 6
    mov mov dword ptr [g_1072D9D4], ecx
    mov mov dword ptr [g_1072D9D0], eax
    pop pop ebp
    add add esp, 28
    ret ret
FUN_1003f120 ENDP
END
