.686
.MODEL FLAT, C
EXTRN g_1019BC78:DWORD
.CODE
FUN_1005ad00 PROC
    sub esp, 116
    mov edx, dword ptr [eax]
    mov dword ptr [esp + 52], edx
    mov edx, dword ptr [eax + 4]
    mov dword ptr [esp + 68], edx
    mov edx, dword ptr [eax + 8]
    mov dword ptr [esp + 84], edx
    mov edx, dword ptr [eax + 12]
    mov dword ptr [esp + 100], edx
    mov edx, dword ptr [eax + 16]
    mov dword ptr [esp + 56], edx
    mov edx, dword ptr [eax + 20]
    mov dword ptr [esp + 72], edx
    mov edx, dword ptr [eax + 24]
    mov dword ptr [esp + 88], edx
    mov edx, dword ptr [eax + 28]
    mov dword ptr [esp + 104], edx
    mov edx, dword ptr [eax + 32]
    mov dword ptr [esp + 60], edx
    mov edx, dword ptr [eax + 36]
    mov dword ptr [esp + 76], edx
    mov edx, dword ptr [eax + 40]
    mov dword ptr [esp + 92], edx
    mov edx, dword ptr [eax + 44]
    mov dword ptr [esp + 108], edx
    mov edx, dword ptr [eax + 48]
    mov dword ptr [esp + 64], edx
    mov edx, dword ptr [eax + 52]
    mov dword ptr [esp + 80], edx
    mov edx, dword ptr [eax + 56]
    mov eax, dword ptr [eax + 60]
    mov dword ptr [esp + 112], eax
    fld dword ptr [esp + 112]
    fmul dword ptr [esp + 92]
    mov dword ptr [esp + 96], edx
    fstp dword ptr [esp + 4]
    fld dword ptr [esp + 108]
    fmul dword ptr [esp + 96]
    fstp dword ptr [esp + 8]
    fld dword ptr [esp + 88]
    fmul dword ptr [esp + 112]
    fstp dword ptr [esp + 12]
    fld dword ptr [esp + 104]
    fmul dword ptr [esp + 96]
    fstp dword ptr [esp + 16]
    fld dword ptr [esp + 88]
    fmul dword ptr [esp + 108]
    fstp dword ptr [esp + 20]
    fld dword ptr [esp + 104]
    fmul dword ptr [esp + 92]
    fstp dword ptr [esp + 24]
    fld dword ptr [esp + 84]
    fmul dword ptr [esp + 112]
    fstp dword ptr [esp + 28]
    fld dword ptr [esp + 100]
    fmul dword ptr [esp + 96]
    fstp dword ptr [esp + 32]
    fld dword ptr [esp + 84]
    fmul dword ptr [esp + 108]
    fstp dword ptr [esp + 36]
    fld dword ptr [esp + 100]
    fmul dword ptr [esp + 92]
    fstp dword ptr [esp + 40]
    fld dword ptr [esp + 84]
    fmul dword ptr [esp + 104]
    fstp dword ptr [esp + 44]
    fld dword ptr [esp + 100]
    fmul dword ptr [esp + 88]
    fstp dword ptr [esp + 48]
    fld dword ptr [esp + 80]
    fmul dword ptr [esp + 20]
    fld dword ptr [esp + 76]
    fmul dword ptr [esp + 16]
    faddp st(1)
    fld dword ptr [esp + 72]
    fmul dword ptr [esp + 4]
    faddp st(1)
    fld dword ptr [esp + 80]
    fmul dword ptr [esp + 24]
    fld dword ptr [esp + 76]
    fmul dword ptr [esp + 12]
    faddp st(1)
    fld dword ptr [esp + 72]
    lea eax, [ecx + 8]
    fmul dword ptr [esp + 8]
    faddp st(1)
    fsubp st(1)
    fstp dword ptr [ecx]
    fld dword ptr [esp + 80]
    fmul dword ptr [esp + 40]
    fld dword ptr [esp + 76]
    fmul dword ptr [esp + 28]
    faddp st(1)
    fld dword ptr [esp + 68]
    fmul dword ptr [esp + 8]
    faddp st(1)
    fld dword ptr [esp + 80]
    fmul dword ptr [esp + 36]
    fld dword ptr [esp + 76]
    fmul dword ptr [esp + 32]
    faddp st(1)
    fld dword ptr [esp + 68]
    fmul dword ptr [esp + 4]
    faddp st(1)
    fsubp st(1)
    fstp dword ptr [ecx + 4]
    fld dword ptr [esp + 80]
    fmul dword ptr [esp + 44]
    fld dword ptr [esp + 72]
    fmul dword ptr [esp + 32]
    faddp st(1)
    fld dword ptr [esp + 68]
    fmul dword ptr [esp + 12]
    faddp st(1)
    fld dword ptr [esp + 80]
    fmul dword ptr [esp + 48]
    fld dword ptr [esp + 72]
    fmul dword ptr [esp + 28]
    faddp st(1)
    fld dword ptr [esp + 68]
    fmul dword ptr [esp + 16]
    faddp st(1)
    fsubp st(1)
    fstp dword ptr [eax]
    fld dword ptr [esp + 76]
    fmul dword ptr [esp + 48]
    fld dword ptr [esp + 72]
    fmul dword ptr [esp + 36]
    faddp st(1)
    fld dword ptr [esp + 68]
    fmul dword ptr [esp + 24]
    faddp st(1)
    fld dword ptr [esp + 76]
    fmul dword ptr [esp + 44]
    fld dword ptr [esp + 72]
    fmul dword ptr [esp + 40]
    faddp st(1)
    fld dword ptr [esp + 68]
    fmul dword ptr [esp + 20]
    faddp st(1)
    fsubp st(1)
    fstp dword ptr [ecx + 12]
    fld dword ptr [esp + 64]
    fmul dword ptr [esp + 24]
    fld dword ptr [esp + 60]
    fmul dword ptr [esp + 12]
    faddp st(1)
    fld dword ptr [esp + 56]
    fmul dword ptr [esp + 8]
    faddp st(1)
    fld dword ptr [esp + 64]
    fmul dword ptr [esp + 20]
    fld dword ptr [esp + 60]
    fmul dword ptr [esp + 16]
    faddp st(1)
    fld dword ptr [esp + 56]
    fmul dword ptr [esp + 4]
    faddp st(1)
    fsubp st(1)
    fstp dword ptr [ecx + 16]
    fld dword ptr [esp + 64]
    fmul dword ptr [esp + 36]
    fld dword ptr [esp + 52]
    fmul dword ptr [esp + 4]
    faddp st(1)
    fld dword ptr [esp + 60]
    fmul dword ptr [esp + 32]
    faddp st(1)
    fld dword ptr [esp + 64]
    fmul dword ptr [esp + 40]
    fld dword ptr [esp + 52]
    fmul dword ptr [esp + 8]
    faddp st(1)
    fld dword ptr [esp + 60]
    fmul dword ptr [esp + 28]
    faddp st(1)
    fsubp st(1)
    fstp dword ptr [ecx + 20]
    fld dword ptr [esp + 64]
    fmul dword ptr [esp + 48]
    fld dword ptr [esp + 52]
    fmul dword ptr [esp + 16]
    faddp st(1)
    fld dword ptr [esp + 56]
    fmul dword ptr [esp + 28]
    faddp st(1)
    fld dword ptr [esp + 64]
    fmul dword ptr [esp + 44]
    fld dword ptr [esp + 52]
    fmul dword ptr [esp + 12]
    faddp st(1)
    fld dword ptr [esp + 56]
    fmul dword ptr [esp + 32]
    faddp st(1)
    fsubp st(1)
    fstp dword ptr [ecx + 24]
    fld dword ptr [esp + 52]
    fmul dword ptr [esp + 20]
    fld dword ptr [esp + 60]
    fmul dword ptr [esp + 44]
    faddp st(1)
    fld dword ptr [esp + 56]
    fmul dword ptr [esp + 40]
    faddp st(1)
    fld dword ptr [esp + 52]
    fmul dword ptr [esp + 24]
    fld dword ptr [esp + 60]
    fmul dword ptr [esp + 48]
    faddp st(1)
    fld dword ptr [esp + 56]
    fmul dword ptr [esp + 36]
    faddp st(1)
    fsubp st(1)
    fstp dword ptr [ecx + 28]
    fld dword ptr [esp + 60]
    fmul dword ptr [esp + 80]
    fstp dword ptr [esp + 4]
    fld dword ptr [esp + 64]
    fmul dword ptr [esp + 76]
    fstp dword ptr [esp + 8]
    fld dword ptr [esp + 56]
    fmul dword ptr [esp + 80]
    fstp dword ptr [esp + 12]
    fld dword ptr [esp + 64]
    fmul dword ptr [esp + 72]
    fstp dword ptr [esp + 16]
    fld dword ptr [esp + 56]
    fmul dword ptr [esp + 76]
    fstp dword ptr [esp + 20]
    fld dword ptr [esp + 60]
    fmul dword ptr [esp + 72]
    fstp dword ptr [esp + 24]
    fld dword ptr [esp + 52]
    fmul dword ptr [esp + 80]
    fstp dword ptr [esp + 28]
    fld dword ptr [esp + 64]
    fmul dword ptr [esp + 68]
    fstp dword ptr [esp + 32]
    fld dword ptr [esp + 52]
    fmul dword ptr [esp + 76]
    fstp dword ptr [esp + 36]
    fld dword ptr [esp + 60]
    fmul dword ptr [esp + 68]
    fstp dword ptr [esp + 40]
    fld dword ptr [esp + 52]
    fmul dword ptr [esp + 72]
    fstp dword ptr [esp + 44]
    fld dword ptr [esp + 56]
    fmul dword ptr [esp + 68]
    fstp dword ptr [esp + 48]
    fld dword ptr [esp + 16]
    fmul dword ptr [esp + 108]
    fld dword ptr [esp + 104]
    fmul dword ptr [esp + 4]
    faddp st(1)
    fld dword ptr [esp + 20]
    fmul dword ptr [esp + 112]
    faddp st(1)
    fld dword ptr [esp + 104]
    fmul dword ptr [esp + 8]
    fld dword ptr [esp + 12]
    fmul dword ptr [esp + 108]
    faddp st(1)
    fld dword ptr [esp + 24]
    fmul dword ptr [esp + 112]
    faddp st(1)
    fsubp st(1)
    fstp dword ptr [ecx + 32]
    fld dword ptr [esp + 100]
    fmul dword ptr [esp + 8]
    fld dword ptr [esp + 28]
    fmul dword ptr [esp + 108]
    faddp st(1)
    fld dword ptr [esp + 40]
    fmul dword ptr [esp + 112]
    faddp st(1)
    fld dword ptr [esp + 32]
    fmul dword ptr [esp + 108]
    fld dword ptr [esp + 100]
    fmul dword ptr [esp + 4]
    faddp st(1)
    fld dword ptr [esp + 36]
    fmul dword ptr [esp + 112]
    faddp st(1)
    fsubp st(1)
    fstp dword ptr [ecx + 36]
    fld dword ptr [esp + 32]
    fmul dword ptr [esp + 104]
    fld dword ptr [esp + 100]
    fmul dword ptr [esp + 12]
    faddp st(1)
    fld dword ptr [esp + 44]
    fmul dword ptr [esp + 112]
    faddp st(1)
    fld dword ptr [esp + 100]
    fmul dword ptr [esp + 16]
    fld dword ptr [esp + 28]
    fmul dword ptr [esp + 104]
    faddp st(1)
    fld dword ptr [esp + 48]
    fmul dword ptr [esp + 112]
    faddp st(1)
    fsubp st(1)
    fstp dword ptr [ecx + 40]
    fld dword ptr [esp + 100]
    fmul dword ptr [esp + 24]
    fld dword ptr [esp + 36]
    fmul dword ptr [esp + 104]
    faddp st(1)
    fld dword ptr [esp + 48]
    fmul dword ptr [esp + 108]
    faddp st(1)
    fld dword ptr [esp + 100]
    fmul dword ptr [esp + 20]
    fld dword ptr [esp + 40]
    fmul dword ptr [esp + 104]
    faddp st(1)
    fld dword ptr [esp + 44]
    fmul dword ptr [esp + 108]
    faddp st(1)
    fsubp st(1)
    fstp dword ptr [ecx + 44]
    fld dword ptr [esp + 24]
    fmul dword ptr [esp + 96]
    fld dword ptr [esp + 88]
    fmul dword ptr [esp + 8]
    faddp st(1)
    fld dword ptr [esp + 12]
    fmul dword ptr [esp + 92]
    faddp st(1)
    fld dword ptr [esp + 20]
    fmul dword ptr [esp + 96]
    fld dword ptr [esp + 88]
    fmul dword ptr [esp + 4]
    faddp st(1)
    fld dword ptr [esp + 16]
    fmul dword ptr [esp + 92]
    faddp st(1)
    fsubp st(1)
    fstp dword ptr [ecx + 48]
    fld dword ptr [esp + 36]
    fmul dword ptr [esp + 96]
    fld dword ptr [esp + 84]
    fmul dword ptr [esp + 4]
    faddp st(1)
    fld dword ptr [esp + 32]
    fmul dword ptr [esp + 92]
    faddp st(1)
    fld dword ptr [esp + 40]
    fmul dword ptr [esp + 96]
    fld dword ptr [esp + 84]
    fmul dword ptr [esp + 8]
    faddp st(1)
    fld dword ptr [esp + 28]
    fmul dword ptr [esp + 92]
    faddp st(1)
    fsubp st(1)
    fstp dword ptr [ecx + 52]
    fld dword ptr [esp + 84]
    fmul dword ptr [esp + 16]
    fld dword ptr [esp + 28]
    fmul dword ptr [esp + 88]
    faddp st(1)
    fld dword ptr [esp + 48]
    fmul dword ptr [esp + 96]
    faddp st(1)
    fld dword ptr [esp + 32]
    fmul dword ptr [esp + 88]
    fld dword ptr [esp + 84]
    fmul dword ptr [esp + 12]
    faddp st(1)
    fld dword ptr [esp + 44]
    fmul dword ptr [esp + 96]
    faddp st(1)
    fsubp st(1)
    fstp dword ptr [ecx + 56]
    fld dword ptr [esp + 84]
    fmul dword ptr [esp + 20]
    fld dword ptr [esp + 40]
    fmul dword ptr [esp + 88]
    faddp st(1)
    fld dword ptr [esp + 44]
    fmul dword ptr [esp + 92]
    faddp st(1)
    fld dword ptr [esp + 84]
    fmul dword ptr [esp + 24]
    fld dword ptr [esp + 36]
    fmul dword ptr [esp + 88]
    faddp st(1)
    fld dword ptr [esp + 48]
    fmul dword ptr [esp + 92]
    faddp st(1)
    fsubp st(1)
    fstp dword ptr [ecx + 60]
    fld dword ptr [esp + 60]
    fmul dword ptr [eax]
    fld dword ptr [esp + 64]
    fmul dword ptr [ecx + 12]
    faddp st(1)
    fld dword ptr [esp + 52]
    fmul dword ptr [ecx]
    faddp st(1)
    fld dword ptr [esp + 56]
    fmul dword ptr [ecx + 4]
    faddp st(1)
    fstp dword ptr [esp]
    fld dword ptr [g_1019BC78]
    mov ecx, 2
    fdiv dword ptr [esp]
    fstp dword ptr [esp]
L0:
    fld dword ptr [esp]
    add eax, 32
    dec ecx
    fmul dword ptr [eax - 40]
    fstp dword ptr [eax - 40]
    fld dword ptr [esp]
    fmul dword ptr [eax - 36]
    fstp dword ptr [eax - 36]
    fld dword ptr [esp]
    fmul dword ptr [eax - 32]
    fstp dword ptr [eax - 32]
    fld dword ptr [esp]
    fmul dword ptr [eax - 28]
    fstp dword ptr [eax - 28]
    fld dword ptr [esp]
    fmul dword ptr [eax - 24]
    fstp dword ptr [eax - 24]
    fld dword ptr [esp]
    fmul dword ptr [eax - 20]
    fstp dword ptr [eax - 20]
    fld dword ptr [esp]
    fmul dword ptr [eax - 16]
    fstp dword ptr [eax - 16]
    fld dword ptr [esp]
    fmul dword ptr [eax - 12]
    fstp dword ptr [eax - 12]
    jne L0
    add esp, 116
    ret
FUN_1005ad00 ENDP
END
