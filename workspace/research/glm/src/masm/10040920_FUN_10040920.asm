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
FUN_10040920 PROC
    sub esp, 48
    fld dword ptr [ebx]
    push ebp
    push esi
    push edi
    mov edi, eax
    mov eax, dword ptr [g_1072DDC8]
    fsub dword ptr [eax]
    mov ebp, dword ptr [esp + 68]
    lea esi, [esp + 24]
    fstp dword ptr [esp + 36]
    fld dword ptr [ebx + 4]
    fsub dword ptr [eax + 4]
    fstp dword ptr [esp + 40]
    fld dword ptr [ebx + 8]
    fsub dword ptr [eax + 8]
    fstp dword ptr [esp + 44]
    fld dword ptr [edi]
    fsub dword ptr [eax]
    fstp dword ptr [esp + 12]
    fld dword ptr [edi + 4]
    fsub dword ptr [eax + 4]
    fstp dword ptr [esp + 16]
    fld dword ptr [edi + 8]
    fsub dword ptr [eax + 8]
    fstp dword ptr [esp + 20]
    fld dword ptr [esp + 20]
    fmul dword ptr [esp + 40]
    fld dword ptr [esp + 16]
    fmul dword ptr [esp + 44]
    fsubp st(1)
    fstp dword ptr [esp + 24]
    fld dword ptr [esp + 44]
    fmul dword ptr [esp + 12]
    fld dword ptr [esp + 20]
    fmul dword ptr [esp + 36]
    fsubp st(1)
    fstp dword ptr [esp + 28]
    fld dword ptr [esp + 16]
    fmul dword ptr [esp + 36]
    fld dword ptr [esp + 40]
    fmul dword ptr [esp + 12]
    fsubp st(1)
    fstp dword ptr [esp + 32]
    call sub_10059144
    fstp st(0)
    lea esi, [esp + 36]
    fld dword ptr [esp + 24]
    fmul dword ptr [esp + 64]
    fstp dword ptr [esp + 12]
    fld dword ptr [esp + 28]
    fmul dword ptr [esp + 64]
    fstp dword ptr [esp + 16]
    fld dword ptr [esp + 32]
    fmul dword ptr [esp + 64]
    fstp dword ptr [esp + 20]
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
    fmul dword ptr [esp + 28]
    fld dword ptr [esp + 40]
    fmul dword ptr [esp + 32]
    fsubp st(1)
    fstp dword ptr [esp + 48]
    fld dword ptr [esp + 32]
    fmul dword ptr [esp + 36]
    fld dword ptr [esp + 44]
    fmul dword ptr [esp + 24]
    fsubp st(1)
    fstp dword ptr [esp + 52]
    fld dword ptr [esp + 40]
    fmul dword ptr [esp + 24]
    fld dword ptr [esp + 28]
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
    fld dword ptr [esp + 12]
    lea eax, [eax + eax*8]
    fadd dword ptr [ebx]
    lea eax, [eax*4 + 0106D3200h]
    mov ecx, dword ptr [esp + 48]
    mov edx, dword ptr [esp + 52]
    fstp dword ptr [eax]
    mov esi, dword ptr [esp + 56]
    fld dword ptr [esp + 16]
    fadd dword ptr [ebx + 4]
    fstp dword ptr [eax + 4]
    fld dword ptr [esp + 20]
    fadd dword ptr [ebx + 8]
    fstp dword ptr [eax + 8]
    fld dword ptr [ebx]
    fsub dword ptr [esp + 12]
    fstp dword ptr [eax + 36]
    fld dword ptr [ebx + 4]
    fsub dword ptr [esp + 16]
    fstp dword ptr [eax + 40]
    fld dword ptr [ebx + 8]
    fsub dword ptr [esp + 20]
    fstp dword ptr [eax + 44]
    fld dword ptr [esp + 12]
    fadd dword ptr [edi]
    fstp dword ptr [eax + 72]
    fld dword ptr [esp + 16]
    fadd dword ptr [edi + 4]
    fstp dword ptr [eax + 76]
    fld dword ptr [esp + 20]
    fadd dword ptr [edi + 8]
    fstp dword ptr [eax + 80]
    fld dword ptr [edi]
    fsub dword ptr [esp + 12]
    fstp dword ptr [eax + 108]
    fld dword ptr [edi + 4]
    fsub dword ptr [esp + 16]
    fstp dword ptr [eax + 112]
    fld dword ptr [edi + 8]
    fsub dword ptr [esp + 20]
    fstp dword ptr [eax + 116]
    mov dword ptr [eax + 12], ecx
    mov dword ptr [eax + 16], edx
    mov dword ptr [eax + 20], esi
    mov dword ptr [eax + 48], ecx
    mov dword ptr [eax + 52], edx
    mov dword ptr [eax + 56], esi
    mov dword ptr [eax + 84], ecx
    mov dword ptr [eax + 88], edx
    mov dword ptr [eax + 92], esi
    mov dword ptr [eax + 120], ecx
    mov ecx, dword ptr [esp + 72]
    mov dword ptr [eax + 124], edx
    mov edx, dword ptr [esp + 76]
    mov dword ptr [eax + 000000080h], esi
    mov esi, dword ptr [esp + 80]
    mov dword ptr [eax + 28], ecx
    mov dword ptr [eax + 32], edx
    mov dword ptr [eax + 68], edx
    mov dword ptr [eax + 64], esi
    mov dword ptr [eax + 100], ecx
    mov ecx, dword ptr [esp + 84]
    mov dword ptr [eax + 104], ecx
    mov dword ptr [eax + 00000008Ch], ecx
    mov dword ptr [eax + 000000088h], esi
    mov dword ptr [eax + 24], ebp
    mov dword ptr [eax + 60], ebp
    mov dword ptr [eax + 96], ebp
    mov dword ptr [eax + 000000084h], ebp
    mov eax, dword ptr [g_1072D9D4]
    mov ecx, dword ptr [g_1072D9B0]
    mov edx, dword ptr [g_1072D9D0]
    mov word ptr [ecx + edx*2], ax
    mov edx, dword ptr [g_1072D9B0]
    mov esi, dword ptr [g_1072D9D0]
    lea ecx, [eax + 1]
    mov word ptr [edx + esi*2 + 2], cx
    mov esi, dword ptr [g_1072D9B0]
    mov edi, dword ptr [g_1072D9D0]
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
FUN_10040920 ENDP
END
