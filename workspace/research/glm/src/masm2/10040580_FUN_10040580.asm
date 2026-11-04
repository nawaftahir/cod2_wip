.686
.MODEL FLAT, C
EXTRN sub_1002E089:PROC
EXTRN sub_10059144:PROC
EXTRN sub_1005918F:PROC
EXTRN EXTRN g_1072D9B0:DWORD:DWORD
EXTRN EXTRN g_1072D9D0:DWORD:DWORD
EXTRN EXTRN g_1072D9D4:DWORD:DWORD
EXTRN EXTRN g_1072DDC8:DWORD:DWORD
.CODE
FUN_10040580 PROC
    sub sub esp, 48
    fld fld dword ptr [ebx]
    push push ebp
    push push esi
    push push edi
    mov mov edi, eax
    mov mov eax, dword ptr [g_1072DDC8]
    fsub fsub dword ptr [eax]
    mov mov ebp, dword ptr [esp + 68]
    lea lea esi, [esp + 12]
    fstp fstp dword ptr [esp + 36]
    fld fld dword ptr [ebx + 4]
    fsub fsub dword ptr [eax + 4]
    fstp fstp dword ptr [esp + 40]
    fld fld dword ptr [ebx + 8]
    fsub fsub dword ptr [eax + 8]
    fstp fstp dword ptr [esp + 44]
    fld fld dword ptr [edi]
    fsub fsub dword ptr [eax]
    fstp fstp dword ptr [esp + 24]
    fld fld dword ptr [edi + 4]
    fsub fsub dword ptr [eax + 4]
    fstp fstp dword ptr [esp + 28]
    fld fld dword ptr [edi + 8]
    fsub fsub dword ptr [eax + 8]
    fstp fstp dword ptr [esp + 32]
    fld fld dword ptr [esp + 32]
    fmul fmul dword ptr [esp + 40]
    fld fld dword ptr [esp + 28]
    fmul fmul dword ptr [esp + 44]
    fsubp fsubp st(1)
    fstp fstp dword ptr [esp + 12]
    fld fld dword ptr [esp + 44]
    fmul fmul dword ptr [esp + 24]
    fld fld dword ptr [esp + 32]
    fmul fmul dword ptr [esp + 36]
    fsubp fsubp st(1)
    fstp fstp dword ptr [esp + 16]
    fld fld dword ptr [esp + 28]
    fmul fmul dword ptr [esp + 36]
    fld fld dword ptr [esp + 40]
    fmul fmul dword ptr [esp + 24]
    fsubp fsubp st(1)
    fstp fstp dword ptr [esp + 20]
    call sub_10059144
    fstp fstp st(0)
    lea lea esi, [esp + 36]
    fld fld dword ptr [esp + 12]
    fmul fmul dword ptr [esp + 64]
    fstp fstp dword ptr [esp + 24]
    fld fld dword ptr [esp + 16]
    fmul fmul dword ptr [esp + 64]
    fstp fstp dword ptr [esp + 28]
    fld fld dword ptr [esp + 20]
    fmul fmul dword ptr [esp + 64]
    fstp fstp dword ptr [esp + 32]
    fld fld dword ptr [edi]
    fsub fsub dword ptr [ebx]
    fstp fstp dword ptr [esp + 36]
    fld fld dword ptr [edi + 4]
    fsub fsub dword ptr [ebx + 4]
    fstp fstp dword ptr [esp + 40]
    fld fld dword ptr [edi + 8]
    fsub fsub dword ptr [ebx + 8]
    fstp fstp dword ptr [esp + 44]
    call sub_1005918F
    fstp fstp st(0)
    fld fld dword ptr [esp + 44]
    fmul fmul dword ptr [esp + 16]
    fld fld dword ptr [esp + 40]
    fmul fmul dword ptr [esp + 20]
    fsubp fsubp st(1)
    fstp fstp dword ptr [esp + 48]
    fld fld dword ptr [esp + 20]
    fmul fmul dword ptr [esp + 36]
    fld fld dword ptr [esp + 44]
    fmul fmul dword ptr [esp + 12]
    fsubp fsubp st(1)
    fstp fstp dword ptr [esp + 52]
    fld fld dword ptr [esp + 40]
    fmul fmul dword ptr [esp + 12]
    fld fld dword ptr [esp + 16]
    fmul fmul dword ptr [esp + 36]
    mov mov eax, dword ptr [g_1072D9D4]
    lea lea ecx, [eax + 4]
    cmp cmp ecx, 0154Ah
    fsubp fsubp st(1)
    fstp fstp dword ptr [esp + 56]
    jg L0
    mov mov edx, dword ptr [g_1072D9D0]
    add add edx, 6
    cmp cmp edx, 0100000h
    jle L1
    call sub_1002E089
    mov mov eax, dword ptr [g_1072D9D4]
    fld fld dword ptr [esp + 24]
    shl shl eax, 6
    fadd fadd dword ptr [ebx]
    add add eax, 0106D3200h
    mov mov edx, dword ptr [esp + 52]
    mov mov esi, dword ptr [esp + 56]
    fstp fstp dword ptr [eax]
    mov mov ecx, 03F800000h
    fld fld dword ptr [esp + 28]
    fadd fadd dword ptr [ebx + 4]
    fstp fstp dword ptr [eax + 4]
    fld fld dword ptr [esp + 32]
    fadd fadd dword ptr [ebx + 8]
    fstp fstp dword ptr [eax + 8]
    fld fld dword ptr [ebx]
    fsub fsub dword ptr [esp + 24]
    fstp fstp dword ptr [eax + 64]
    fld fld dword ptr [ebx + 4]
    fsub fsub dword ptr [esp + 28]
    fstp fstp dword ptr [eax + 68]
    fld fld dword ptr [ebx + 8]
    fsub fsub dword ptr [esp + 32]
    fstp fstp dword ptr [eax + 72]
    fld fld dword ptr [esp + 24]
    fadd fadd dword ptr [edi]
    fstp fstp dword ptr [eax + 080h]
    fld fld dword ptr [esp + 28]
    fadd fadd dword ptr [edi + 4]
    fstp fstp dword ptr [eax + 084h]
    fld fld dword ptr [esp + 32]
    fadd fadd dword ptr [edi + 8]
    fstp fstp dword ptr [eax + 088h]
    fld fld dword ptr [edi]
    fsub fsub dword ptr [esp + 24]
    fstp fstp dword ptr [eax + 0C0h]
    fld fld dword ptr [edi + 4]
    fsub fsub dword ptr [esp + 28]
    fstp fstp dword ptr [eax + 0C4h]
    fld fld dword ptr [edi + 8]
    fsub fsub dword ptr [esp + 32]
    fstp fstp dword ptr [eax + 0C8h]
    mov mov dword ptr [eax + 12], ecx
    mov mov dword ptr [eax + 76], ecx
    mov mov dword ptr [eax + 08Ch], ecx
    mov mov dword ptr [eax + 0CCh], ecx
    mov mov ecx, dword ptr [esp + 48]
    mov mov dword ptr [eax + 16], ecx
    mov mov dword ptr [eax + 20], edx
    mov mov dword ptr [eax + 24], esi
    mov mov dword ptr [eax + 80], ecx
    mov mov dword ptr [eax + 84], edx
    mov mov dword ptr [eax + 88], esi
    mov mov dword ptr [eax + 090h], ecx
    mov mov dword ptr [eax + 094h], edx
    mov mov dword ptr [eax + 098h], esi
    mov mov dword ptr [eax + 0D0h], ecx
    mov mov ecx, dword ptr [esp + 36]
    mov mov dword ptr [eax + 0D4h], edx
    mov mov edx, dword ptr [esp + 40]
    mov mov dword ptr [eax + 0D8h], esi
    mov mov esi, dword ptr [esp + 44]
    mov mov dword ptr [eax + 40], ecx
    mov mov dword ptr [eax + 44], edx
    mov mov dword ptr [eax + 48], esi
    mov mov dword ptr [eax + 104], ecx
    mov mov dword ptr [eax + 108], edx
    mov mov dword ptr [eax + 112], esi
    mov mov dword ptr [eax + 0A8h], ecx
    mov mov dword ptr [eax + 0ACh], edx
    mov mov dword ptr [eax + 0B0h], esi
    mov mov dword ptr [eax + 0E8h], ecx
    mov mov ecx, dword ptr [esp + 12]
    mov mov dword ptr [eax + 0ECh], edx
    mov mov edx, dword ptr [esp + 16]
    mov mov dword ptr [eax + 0F0h], esi
    mov mov esi, dword ptr [esp + 20]
    mov mov dword ptr [eax + 52], ecx
    mov mov dword ptr [eax + 56], edx
    mov mov dword ptr [eax + 60], esi
    mov mov dword ptr [eax + 116], ecx
    mov mov dword ptr [eax + 120], edx
    mov mov dword ptr [eax + 124], esi
    mov mov dword ptr [eax + 0B4h], ecx
    mov mov dword ptr [eax + 0B8h], edx
    mov mov dword ptr [eax + 0BCh], esi
    mov mov dword ptr [eax + 0F4h], ecx
    mov mov dword ptr [eax + 0F8h], edx
    mov mov dword ptr [eax + 0FCh], esi
    mov mov ecx, dword ptr [esp + 72]
    mov mov dword ptr [eax + 32], ecx
    mov mov edx, dword ptr [esp + 76]
    mov mov dword ptr [eax + 36], edx
    mov mov esi, dword ptr [esp + 80]
    mov mov dword ptr [eax + 96], esi
    mov mov dword ptr [eax + 100], edx
    mov mov dword ptr [eax + 0A0h], ecx
    mov mov ecx, dword ptr [esp + 84]
    mov mov dword ptr [eax + 0A4h], ecx
    mov mov dword ptr [eax + 0E4h], ecx
    mov mov dword ptr [eax + 0E0h], esi
    mov mov dword ptr [eax + 28], ebp
    mov mov dword ptr [eax + 92], ebp
    mov mov dword ptr [eax + 09Ch], ebp
    mov mov dword ptr [eax + 0DCh], ebp
    mov mov eax, dword ptr [g_1072D9D4]
    mov mov edx, dword ptr [g_1072D9D0]
    mov mov ecx, dword ptr [g_1072D9B0]
    mov mov word ptr [ecx + edx*2], ax
    mov mov esi, dword ptr [g_1072D9D0]
    mov mov edx, dword ptr [g_1072D9B0]
    lea lea ecx, [eax + 1]
    mov mov word ptr [edx + esi*2 + 2], cx
    mov mov edi, dword ptr [g_1072D9D0]
    mov mov esi, dword ptr [g_1072D9B0]
    lea lea edx, [eax + 2]
    mov mov word ptr [esi + edi*2 + 4], dx
    mov mov edi, dword ptr [g_1072D9D0]
    mov mov esi, dword ptr [g_1072D9B0]
    mov mov word ptr [esi + edi*2 + 6], dx
    mov mov esi, dword ptr [g_1072D9D0]
    mov mov edx, dword ptr [g_1072D9B0]
    mov mov word ptr [edx + esi*2 + 8], cx
    mov mov ecx, dword ptr [g_1072D9D0]
    mov mov edx, dword ptr [g_1072D9B0]
    add add eax, 3
    mov mov word ptr [edx + ecx*2 + 10], ax
    mov mov ecx, dword ptr [g_1072D9D4]
    mov mov eax, dword ptr [g_1072D9D0]
    pop pop edi
    add add ecx, 4
    add add eax, 6
    pop pop esi
    mov mov dword ptr [g_1072D9D4], ecx
    mov mov dword ptr [g_1072D9D0], eax
    pop pop ebp
    add add esp, 48
    ret ret
FUN_10040580 ENDP
END
