.686
.MODEL FLAT, C
EXTRN sub_1002E089:PROC
EXTRN sub_10059144:PROC
EXTRN sub_1005918F:PROC
EXTRN g_1072D9B0:DWORD
EXTRN g_1072D9D0:DWORD
EXTRN g_1072D9D4:DWORD
EXTRN g_1072DDC8:DWORD
.CODE
FUN_10040580 PROC
    sub esp, 48
    fld dword ptr [ebx]
    push ebp
    push esi
    push edi
    mov edi, eax
    mov eax, dword ptr [g_1072DDC8]
    fsub dword ptr [eax]
    mov ebp, dword ptr [esp + 68]
    lea esi, [esp + 12]
    fstp dword ptr [esp + 36]
    fld dword ptr [ebx + 4]
    fsub dword ptr [eax + 4]
    fstp dword ptr [esp + 40]
    fld dword ptr [ebx + 8]
    fsub dword ptr [eax + 8]
    fstp dword ptr [esp + 44]
    fld dword ptr [edi]
    fsub dword ptr [eax]
    fstp dword ptr [esp + 24]
    fld dword ptr [edi + 4]
    fsub dword ptr [eax + 4]
    fstp dword ptr [esp + 28]
    fld dword ptr [edi + 8]
    fsub dword ptr [eax + 8]
    fstp dword ptr [esp + 32]
    fld dword ptr [esp + 32]
    fmul dword ptr [esp + 40]
    fld dword ptr [esp + 28]
    fmul dword ptr [esp + 44]
    fsubp st(1)
    fstp dword ptr [esp + 12]
    fld dword ptr [esp + 44]
    fmul dword ptr [esp + 24]
    fld dword ptr [esp + 32]
    fmul dword ptr [esp + 36]
    fsubp st(1)
    fstp dword ptr [esp + 16]
    fld dword ptr [esp + 28]
    fmul dword ptr [esp + 36]
    fld dword ptr [esp + 40]
    fmul dword ptr [esp + 24]
    fsubp st(1)
    fstp dword ptr [esp + 20]
    call sub_10059144
    fstp st(0)
    lea esi, [esp + 36]
    fld dword ptr [esp + 12]
    fmul dword ptr [esp + 64]
    fstp dword ptr [esp + 24]
    fld dword ptr [esp + 16]
    fmul dword ptr [esp + 64]
    fstp dword ptr [esp + 28]
    fld dword ptr [esp + 20]
    fmul dword ptr [esp + 64]
    fstp dword ptr [esp + 32]
    fld dword ptr [edi]
    fsub dword ptr [ebx]
    fstp dword ptr [esp + 36]
    fld dword ptr [edi + 4]
    fsub dword ptr [ebx + 4]
    fstp dword ptr [esp + 40]
    fld dword ptr [edi + 8]
    fsub dword ptr [ebx + 8]
    fstp dword ptr [esp + 44]
    call sub_1005918F
    fstp st(0)
    fld dword ptr [esp + 44]
    fmul dword ptr [esp + 16]
    fld dword ptr [esp + 40]
    fmul dword ptr [esp + 20]
    fsubp st(1)
    fstp dword ptr [esp + 48]
    fld dword ptr [esp + 20]
    fmul dword ptr [esp + 36]
    fld dword ptr [esp + 44]
    fmul dword ptr [esp + 12]
    fsubp st(1)
    fstp dword ptr [esp + 52]
    fld dword ptr [esp + 40]
    fmul dword ptr [esp + 12]
    fld dword ptr [esp + 16]
    fmul dword ptr [esp + 36]
    mov eax, dword ptr [g_1072D9D4]
    lea ecx, [eax + 4]
    cmp ecx, 00000154Ah
    fsubp st(1)
    fstp dword ptr [esp + 56]
    jg L0
    mov edx, dword ptr [g_1072D9D0]
    add edx, 6
    cmp edx, 000100000h
    jle L1
L0:
    call sub_1002E089
    mov eax, dword ptr [g_1072D9D4]
L1:
    fld dword ptr [esp + 24]
    shl eax, 6
    fadd dword ptr [ebx]
    add eax, 0106D3200h
    mov edx, dword ptr [esp + 52]
    mov esi, dword ptr [esp + 56]
    fstp dword ptr [eax]
    mov ecx, 03F800000h
    fld dword ptr [esp + 28]
    fadd dword ptr [ebx + 4]
    fstp dword ptr [eax + 4]
    fld dword ptr [esp + 32]
    fadd dword ptr [ebx + 8]
    fstp dword ptr [eax + 8]
    fld dword ptr [ebx]
    fsub dword ptr [esp + 24]
    fstp dword ptr [eax + 64]
    fld dword ptr [ebx + 4]
    fsub dword ptr [esp + 28]
    fstp dword ptr [eax + 68]
    fld dword ptr [ebx + 8]
    fsub dword ptr [esp + 32]
    fstp dword ptr [eax + 72]
    fld dword ptr [esp + 24]
    fadd dword ptr [edi]
    fstp dword ptr [eax + 000000080h]
    fld dword ptr [esp + 28]
    fadd dword ptr [edi + 4]
    fstp dword ptr [eax + 000000084h]
    fld dword ptr [esp + 32]
    fadd dword ptr [edi + 8]
    fstp dword ptr [eax + 000000088h]
    fld dword ptr [edi]
    fsub dword ptr [esp + 24]
    fstp dword ptr [eax + 0000000C0h]
    fld dword ptr [edi + 4]
    fsub dword ptr [esp + 28]
    fstp dword ptr [eax + 0000000C4h]
    fld dword ptr [edi + 8]
    fsub dword ptr [esp + 32]
    fstp dword ptr [eax + 0000000C8h]
    mov dword ptr [eax + 12], ecx
    mov dword ptr [eax + 76], ecx
    mov dword ptr [eax + 00000008Ch], ecx
    mov dword ptr [eax + 0000000CCh], ecx
    mov ecx, dword ptr [esp + 48]
    mov dword ptr [eax + 16], ecx
    mov dword ptr [eax + 20], edx
    mov dword ptr [eax + 24], esi
    mov dword ptr [eax + 80], ecx
    mov dword ptr [eax + 84], edx
    mov dword ptr [eax + 88], esi
    mov dword ptr [eax + 000000090h], ecx
    mov dword ptr [eax + 000000094h], edx
    mov dword ptr [eax + 000000098h], esi
    mov dword ptr [eax + 0000000D0h], ecx
    mov ecx, dword ptr [esp + 36]
    mov dword ptr [eax + 0000000D4h], edx
    mov edx, dword ptr [esp + 40]
    mov dword ptr [eax + 0000000D8h], esi
    mov esi, dword ptr [esp + 44]
    mov dword ptr [eax + 40], ecx
    mov dword ptr [eax + 44], edx
    mov dword ptr [eax + 48], esi
    mov dword ptr [eax + 104], ecx
    mov dword ptr [eax + 108], edx
    mov dword ptr [eax + 112], esi
    mov dword ptr [eax + 0000000A8h], ecx
    mov dword ptr [eax + 0000000ACh], edx
    mov dword ptr [eax + 0000000B0h], esi
    mov dword ptr [eax + 0000000E8h], ecx
    mov ecx, dword ptr [esp + 12]
    mov dword ptr [eax + 0000000ECh], edx
    mov edx, dword ptr [esp + 16]
    mov dword ptr [eax + 0000000F0h], esi
    mov esi, dword ptr [esp + 20]
    mov dword ptr [eax + 52], ecx
    mov dword ptr [eax + 56], edx
    mov dword ptr [eax + 60], esi
    mov dword ptr [eax + 116], ecx
    mov dword ptr [eax + 120], edx
    mov dword ptr [eax + 124], esi
    mov dword ptr [eax + 0000000B4h], ecx
    mov dword ptr [eax + 0000000B8h], edx
    mov dword ptr [eax + 0000000BCh], esi
    mov dword ptr [eax + 0000000F4h], ecx
    mov dword ptr [eax + 0000000F8h], edx
    mov dword ptr [eax + 0000000FCh], esi
    mov ecx, dword ptr [esp + 72]
    mov dword ptr [eax + 32], ecx
    mov edx, dword ptr [esp + 76]
    mov dword ptr [eax + 36], edx
    mov esi, dword ptr [esp + 80]
    mov dword ptr [eax + 96], esi
    mov dword ptr [eax + 100], edx
    mov dword ptr [eax + 0000000A0h], ecx
    mov ecx, dword ptr [esp + 84]
    mov dword ptr [eax + 0000000A4h], ecx
    mov dword ptr [eax + 0000000E4h], ecx
    mov dword ptr [eax + 0000000E0h], esi
    mov dword ptr [eax + 28], ebp
    mov dword ptr [eax + 92], ebp
    mov dword ptr [eax + 00000009Ch], ebp
    mov dword ptr [eax + 0000000DCh], ebp
    mov eax, dword ptr [g_1072D9D4]
    mov edx, dword ptr [g_1072D9D0]
    mov ecx, dword ptr [g_1072D9B0]
    mov word ptr [ecx + edx*2], ax
    mov esi, dword ptr [g_1072D9D0]
    mov edx, dword ptr [g_1072D9B0]
    lea ecx, [eax + 1]
    mov word ptr [edx + esi*2 + 2], cx
    mov edi, dword ptr [g_1072D9D0]
    mov esi, dword ptr [g_1072D9B0]
    lea edx, [eax + 2]
    mov word ptr [esi + edi*2 + 4], dx
    mov edi, dword ptr [g_1072D9D0]
    mov esi, dword ptr [g_1072D9B0]
    mov word ptr [esi + edi*2 + 6], dx
    mov esi, dword ptr [g_1072D9D0]
    mov edx, dword ptr [g_1072D9B0]
    mov word ptr [edx + esi*2 + 8], cx
    mov ecx, dword ptr [g_1072D9D0]
    mov edx, dword ptr [g_1072D9B0]
    add eax, 3
    mov word ptr [edx + ecx*2 + 10], ax
    mov ecx, dword ptr [g_1072D9D4]
    mov eax, dword ptr [g_1072D9D0]
    pop edi
    add ecx, 4
    add eax, 6
    pop esi
    mov dword ptr [g_1072D9D4], ecx
    mov dword ptr [g_1072D9D0], eax
    pop ebp
    add esp, 48
    ret
FUN_10040580 ENDP
END
