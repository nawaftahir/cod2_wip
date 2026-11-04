.686
.MODEL FLAT, C
EXTRN sub_1002DF69:PROC
EXTRN g_1072D9B0:DWORD
EXTRN g_1072D9D0:DWORD
EXTRN g_1072D9D4:DWORD
EXTRN g_1072DDC8:DWORD
.CODE
FUN_1003f120 PROC
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
    shl eax, 6
    fadd dword ptr [ebx + 4]
    add eax, 0106D3200h
    fld dword ptr [ebx + 8]
    mov ecx, 03F800000h
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
    fstp dword ptr [eax + 64]
    fld dword ptr [esi + 4]
    fsub dword ptr [esp + 12]
    fstp dword ptr [eax + 68]
    fld dword ptr [esi + 8]
    fsub dword ptr [esp + 16]
    fstp dword ptr [eax + 72]
    fld dword ptr [esi]
    fsub st(2)
    fstp dword ptr [eax + 000000080h]
    fld dword ptr [esi + 4]
    fsub st(1)
    fstp dword ptr [eax + 000000084h]
    fstp st(0)
    fstp st(0)
    fld dword ptr [esi + 8]
    fsub dword ptr [esp + 28]
    fstp dword ptr [eax + 000000088h]
    fld dword ptr [esp + 8]
    fadd dword ptr [esi]
    fstp dword ptr [eax + 0000000C0h]
    fld dword ptr [esp + 12]
    fadd dword ptr [esi + 4]
    fstp dword ptr [eax + 0000000C4h]
    fld dword ptr [esp + 16]
    fadd dword ptr [esi + 8]
    fstp dword ptr [eax + 0000000C8h]
    mov dword ptr [eax + 12], ecx
    mov dword ptr [eax + 76], ecx
    mov dword ptr [eax + 00000008Ch], ecx
    mov dword ptr [eax + 0000000CCh], ecx
    mov ecx, dword ptr [g_1072DDC8]
    fld dword ptr [ecx + 12]
    fchs
    fld dword ptr [ecx + 16]
    fchs
    fld dword ptr [ecx + 20]
    fchs
    fst dword ptr [esp + 28]
    mov ecx, dword ptr [esp + 28]
    fld st(2)
    fstp dword ptr [eax + 16]
    fld st(1)
    fstp dword ptr [eax + 20]
    fst dword ptr [eax + 24]
    fld st(2)
    fstp dword ptr [eax + 80]
    fld st(1)
    fstp dword ptr [eax + 84]
    fst dword ptr [eax + 88]
    fld st(2)
    fstp dword ptr [eax + 000000090h]
    fld st(1)
    fstp dword ptr [eax + 000000094h]
    fstp dword ptr [eax + 000000098h]
    mov dword ptr [eax + 0000000D8h], ecx
    fxch st(1)
    fstp dword ptr [eax + 0000000D0h]
    fstp dword ptr [eax + 0000000D4h]
    fld dword ptr [edi]
    fld dword ptr [edi + 4]
    fld dword ptr [edi + 8]
    fst dword ptr [esp + 28]
    mov edx, dword ptr [esp + 28]
    fld st(2)
    fstp dword ptr [eax + 40]
    fld st(1)
    fstp dword ptr [eax + 44]
    fst dword ptr [eax + 48]
    fld st(2)
    fstp dword ptr [eax + 104]
    fld st(1)
    fstp dword ptr [eax + 108]
    fst dword ptr [eax + 112]
    fld st(2)
    fstp dword ptr [eax + 0000000A8h]
    fld st(1)
    fstp dword ptr [eax + 0000000ACh]
    fstp dword ptr [eax + 0000000B0h]
    mov dword ptr [eax + 0000000F0h], edx
    fxch st(1)
    fstp dword ptr [eax + 0000000E8h]
    fstp dword ptr [eax + 0000000ECh]
    fld dword ptr [ebx]
    fchs
    fld dword ptr [ebx + 4]
    fchs
    fld dword ptr [ebx + 8]
    fchs
    fst dword ptr [esp + 28]
    fld st(2)
    fstp dword ptr [eax + 52]
    fld st(1)
    fstp dword ptr [eax + 56]
    fst dword ptr [eax + 60]
    fld st(2)
    fstp dword ptr [eax + 116]
    fld st(1)
    fstp dword ptr [eax + 120]
    fst dword ptr [eax + 124]
    fld st(2)
    fstp dword ptr [eax + 0000000B4h]
    fld st(1)
    fstp dword ptr [eax + 0000000B8h]
    fstp dword ptr [eax + 0000000BCh]
    fxch st(1)
    fstp dword ptr [eax + 0000000F4h]
    fstp dword ptr [eax + 0000000F8h]
    mov ecx, dword ptr [esp + 28]
    mov edx, dword ptr [esp + 40]
    mov dword ptr [eax + 0000000FCh], ecx
    mov ecx, dword ptr [esp + 44]
    mov dword ptr [eax + 36], ecx
    mov dword ptr [eax + 32], edx
    mov edx, dword ptr [esp + 48]
    mov dword ptr [eax + 100], ecx
    mov ecx, dword ptr [esp + 52]
    mov dword ptr [eax + 96], edx
    mov dword ptr [eax + 0000000A4h], ecx
    mov dword ptr [eax + 0000000A0h], edx
    mov edx, dword ptr [esp + 40]
    mov dword ptr [eax + 0000000E4h], ecx
    mov ecx, dword ptr [esp + 36]
    mov dword ptr [eax + 0000000E0h], edx
    mov dword ptr [eax + 28], ecx
    mov dword ptr [eax + 92], ecx
    mov dword ptr [eax + 00000009Ch], ecx
    mov dword ptr [eax + 0000000DCh], ecx
    mov ecx, dword ptr [g_1072D9D4]
    mov eax, dword ptr [g_1072D9D0]
    add ecx, 4
    add eax, 6
    mov dword ptr [g_1072D9D4], ecx
    mov dword ptr [g_1072D9D0], eax
    pop ebp
    add esp, 28
    ret
FUN_1003f120 ENDP
END
