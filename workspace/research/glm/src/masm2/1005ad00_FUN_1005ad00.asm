.686
.MODEL FLAT, C
EXTRN sub_1005B87C:PROC
EXTRN EXTRN g_1019BC78:DWORD:DWORD
.CODE
FUN_1005ad00 PROC
    sub sub esp, 116
    mov mov edx, dword ptr [eax]
    mov mov dword ptr [esp + 52], edx
    mov mov edx, dword ptr [eax + 4]
    mov mov dword ptr [esp + 68], edx
    mov mov edx, dword ptr [eax + 8]
    mov mov dword ptr [esp + 84], edx
    mov mov edx, dword ptr [eax + 12]
    mov mov dword ptr [esp + 100], edx
    mov mov edx, dword ptr [eax + 16]
    mov mov dword ptr [esp + 56], edx
    mov mov edx, dword ptr [eax + 20]
    mov mov dword ptr [esp + 72], edx
    mov mov edx, dword ptr [eax + 24]
    mov mov dword ptr [esp + 88], edx
    mov mov edx, dword ptr [eax + 28]
    mov mov dword ptr [esp + 104], edx
    mov mov edx, dword ptr [eax + 32]
    mov mov dword ptr [esp + 60], edx
    mov mov edx, dword ptr [eax + 36]
    mov mov dword ptr [esp + 76], edx
    mov mov edx, dword ptr [eax + 40]
    mov mov dword ptr [esp + 92], edx
    mov mov edx, dword ptr [eax + 44]
    mov mov dword ptr [esp + 108], edx
    mov mov edx, dword ptr [eax + 48]
    mov mov dword ptr [esp + 64], edx
    mov mov edx, dword ptr [eax + 52]
    mov mov dword ptr [esp + 80], edx
    mov mov edx, dword ptr [eax + 56]
    mov mov eax, dword ptr [eax + 60]
    mov mov dword ptr [esp + 112], eax
    fld fld dword ptr [esp + 112]
    fmul fmul dword ptr [esp + 92]
    mov mov dword ptr [esp + 96], edx
    fstp fstp dword ptr [esp + 4]
    fld fld dword ptr [esp + 108]
    fmul fmul dword ptr [esp + 96]
    fstp fstp dword ptr [esp + 8]
    fld fld dword ptr [esp + 88]
    fmul fmul dword ptr [esp + 112]
    fstp fstp dword ptr [esp + 12]
    fld fld dword ptr [esp + 104]
    fmul fmul dword ptr [esp + 96]
    fstp fstp dword ptr [esp + 16]
    fld fld dword ptr [esp + 88]
    fmul fmul dword ptr [esp + 108]
    fstp fstp dword ptr [esp + 20]
    fld fld dword ptr [esp + 104]
    fmul fmul dword ptr [esp + 92]
    fstp fstp dword ptr [esp + 24]
    fld fld dword ptr [esp + 84]
    fmul fmul dword ptr [esp + 112]
    fstp fstp dword ptr [esp + 28]
    fld fld dword ptr [esp + 100]
    fmul fmul dword ptr [esp + 96]
    fstp fstp dword ptr [esp + 32]
    fld fld dword ptr [esp + 84]
    fmul fmul dword ptr [esp + 108]
    fstp fstp dword ptr [esp + 36]
    fld fld dword ptr [esp + 100]
    fmul fmul dword ptr [esp + 92]
    fstp fstp dword ptr [esp + 40]
    fld fld dword ptr [esp + 84]
    fmul fmul dword ptr [esp + 104]
    fstp fstp dword ptr [esp + 44]
    fld fld dword ptr [esp + 100]
    fmul fmul dword ptr [esp + 88]
    fstp fstp dword ptr [esp + 48]
    fld fld dword ptr [esp + 80]
    fmul fmul dword ptr [esp + 20]
    fld fld dword ptr [esp + 76]
    fmul fmul dword ptr [esp + 16]
    faddp faddp st(1)
    fld fld dword ptr [esp + 72]
    fmul fmul dword ptr [esp + 4]
    faddp faddp st(1)
    fld fld dword ptr [esp + 80]
    fmul fmul dword ptr [esp + 24]
    fld fld dword ptr [esp + 76]
    fmul fmul dword ptr [esp + 12]
    faddp faddp st(1)
    fld fld dword ptr [esp + 72]
    lea lea eax, [ecx + 8]
    fmul fmul dword ptr [esp + 8]
    faddp faddp st(1)
    fsubp fsubp st(1)
    fstp fstp dword ptr [ecx]
    fld fld dword ptr [esp + 80]
    fmul fmul dword ptr [esp + 40]
    fld fld dword ptr [esp + 76]
    fmul fmul dword ptr [esp + 28]
    faddp faddp st(1)
    fld fld dword ptr [esp + 68]
    fmul fmul dword ptr [esp + 8]
    faddp faddp st(1)
    fld fld dword ptr [esp + 80]
    fmul fmul dword ptr [esp + 36]
    fld fld dword ptr [esp + 76]
    fmul fmul dword ptr [esp + 32]
    faddp faddp st(1)
    fld fld dword ptr [esp + 68]
    fmul fmul dword ptr [esp + 4]
    faddp faddp st(1)
    fsubp fsubp st(1)
    fstp fstp dword ptr [ecx + 4]
    fld fld dword ptr [esp + 80]
    fmul fmul dword ptr [esp + 44]
    fld fld dword ptr [esp + 72]
    fmul fmul dword ptr [esp + 32]
    faddp faddp st(1)
    fld fld dword ptr [esp + 68]
    fmul fmul dword ptr [esp + 12]
    faddp faddp st(1)
    fld fld dword ptr [esp + 80]
    fmul fmul dword ptr [esp + 48]
    fld fld dword ptr [esp + 72]
    fmul fmul dword ptr [esp + 28]
    faddp faddp st(1)
    fld fld dword ptr [esp + 68]
    fmul fmul dword ptr [esp + 16]
    faddp faddp st(1)
    fsubp fsubp st(1)
    fstp fstp dword ptr [eax]
    fld fld dword ptr [esp + 76]
    fmul fmul dword ptr [esp + 48]
    fld fld dword ptr [esp + 72]
    fmul fmul dword ptr [esp + 36]
    faddp faddp st(1)
    fld fld dword ptr [esp + 68]
    fmul fmul dword ptr [esp + 24]
    faddp faddp st(1)
    fld fld dword ptr [esp + 76]
    fmul fmul dword ptr [esp + 44]
    fld fld dword ptr [esp + 72]
    fmul fmul dword ptr [esp + 40]
    faddp faddp st(1)
    fld fld dword ptr [esp + 68]
    fmul fmul dword ptr [esp + 20]
    faddp faddp st(1)
    fsubp fsubp st(1)
    fstp fstp dword ptr [ecx + 12]
    fld fld dword ptr [esp + 64]
    fmul fmul dword ptr [esp + 24]
    fld fld dword ptr [esp + 60]
    fmul fmul dword ptr [esp + 12]
    faddp faddp st(1)
    fld fld dword ptr [esp + 56]
    fmul fmul dword ptr [esp + 8]
    faddp faddp st(1)
    fld fld dword ptr [esp + 64]
    fmul fmul dword ptr [esp + 20]
    fld fld dword ptr [esp + 60]
    fmul fmul dword ptr [esp + 16]
    faddp faddp st(1)
    fld fld dword ptr [esp + 56]
    fmul fmul dword ptr [esp + 4]
    faddp faddp st(1)
    fsubp fsubp st(1)
    fstp fstp dword ptr [ecx + 16]
    fld fld dword ptr [esp + 64]
    fmul fmul dword ptr [esp + 36]
    fld fld dword ptr [esp + 52]
    fmul fmul dword ptr [esp + 4]
    faddp faddp st(1)
    fld fld dword ptr [esp + 60]
    fmul fmul dword ptr [esp + 32]
    faddp faddp st(1)
    fld fld dword ptr [esp + 64]
    fmul fmul dword ptr [esp + 40]
    fld fld dword ptr [esp + 52]
    fmul fmul dword ptr [esp + 8]
    faddp faddp st(1)
    fld fld dword ptr [esp + 60]
    fmul fmul dword ptr [esp + 28]
    faddp faddp st(1)
    fsubp fsubp st(1)
    fstp fstp dword ptr [ecx + 20]
    fld fld dword ptr [esp + 64]
    fmul fmul dword ptr [esp + 48]
    fld fld dword ptr [esp + 52]
    fmul fmul dword ptr [esp + 16]
    faddp faddp st(1)
    fld fld dword ptr [esp + 56]
    fmul fmul dword ptr [esp + 28]
    faddp faddp st(1)
    fld fld dword ptr [esp + 64]
    fmul fmul dword ptr [esp + 44]
    fld fld dword ptr [esp + 52]
    fmul fmul dword ptr [esp + 12]
    faddp faddp st(1)
    fld fld dword ptr [esp + 56]
    fmul fmul dword ptr [esp + 32]
    faddp faddp st(1)
    fsubp fsubp st(1)
    fstp fstp dword ptr [ecx + 24]
    fld fld dword ptr [esp + 52]
    fmul fmul dword ptr [esp + 20]
    fld fld dword ptr [esp + 60]
    fmul fmul dword ptr [esp + 44]
    faddp faddp st(1)
    fld fld dword ptr [esp + 56]
    fmul fmul dword ptr [esp + 40]
    faddp faddp st(1)
    fld fld dword ptr [esp + 52]
    fmul fmul dword ptr [esp + 24]
    fld fld dword ptr [esp + 60]
    fmul fmul dword ptr [esp + 48]
    faddp faddp st(1)
    fld fld dword ptr [esp + 56]
    fmul fmul dword ptr [esp + 36]
    faddp faddp st(1)
    fsubp fsubp st(1)
    fstp fstp dword ptr [ecx + 28]
    fld fld dword ptr [esp + 60]
    fmul fmul dword ptr [esp + 80]
    fstp fstp dword ptr [esp + 4]
    fld fld dword ptr [esp + 64]
    fmul fmul dword ptr [esp + 76]
    fstp fstp dword ptr [esp + 8]
    fld fld dword ptr [esp + 56]
    fmul fmul dword ptr [esp + 80]
    fstp fstp dword ptr [esp + 12]
    fld fld dword ptr [esp + 64]
    fmul fmul dword ptr [esp + 72]
    fstp fstp dword ptr [esp + 16]
    fld fld dword ptr [esp + 56]
    fmul fmul dword ptr [esp + 76]
    fstp fstp dword ptr [esp + 20]
    fld fld dword ptr [esp + 60]
    fmul fmul dword ptr [esp + 72]
    fstp fstp dword ptr [esp + 24]
    fld fld dword ptr [esp + 52]
    fmul fmul dword ptr [esp + 80]
    fstp fstp dword ptr [esp + 28]
    fld fld dword ptr [esp + 64]
    fmul fmul dword ptr [esp + 68]
    fstp fstp dword ptr [esp + 32]
    fld fld dword ptr [esp + 52]
    fmul fmul dword ptr [esp + 76]
    fstp fstp dword ptr [esp + 36]
    fld fld dword ptr [esp + 60]
    fmul fmul dword ptr [esp + 68]
    fstp fstp dword ptr [esp + 40]
    fld fld dword ptr [esp + 52]
    fmul fmul dword ptr [esp + 72]
    fstp fstp dword ptr [esp + 44]
    fld fld dword ptr [esp + 56]
    fmul fmul dword ptr [esp + 68]
    fstp fstp dword ptr [esp + 48]
    fld fld dword ptr [esp + 16]
    fmul fmul dword ptr [esp + 108]
    fld fld dword ptr [esp + 104]
    fmul fmul dword ptr [esp + 4]
    faddp faddp st(1)
    fld fld dword ptr [esp + 20]
    fmul fmul dword ptr [esp + 112]
    faddp faddp st(1)
    fld fld dword ptr [esp + 104]
    fmul fmul dword ptr [esp + 8]
    fld fld dword ptr [esp + 12]
    fmul fmul dword ptr [esp + 108]
    faddp faddp st(1)
    fld fld dword ptr [esp + 24]
    fmul fmul dword ptr [esp + 112]
    faddp faddp st(1)
    fsubp fsubp st(1)
    fstp fstp dword ptr [ecx + 32]
    fld fld dword ptr [esp + 100]
    fmul fmul dword ptr [esp + 8]
    fld fld dword ptr [esp + 28]
    fmul fmul dword ptr [esp + 108]
    faddp faddp st(1)
    fld fld dword ptr [esp + 40]
    fmul fmul dword ptr [esp + 112]
    faddp faddp st(1)
    fld fld dword ptr [esp + 32]
    fmul fmul dword ptr [esp + 108]
    fld fld dword ptr [esp + 100]
    fmul fmul dword ptr [esp + 4]
    faddp faddp st(1)
    fld fld dword ptr [esp + 36]
    fmul fmul dword ptr [esp + 112]
    faddp faddp st(1)
    fsubp fsubp st(1)
    fstp fstp dword ptr [ecx + 36]
    fld fld dword ptr [esp + 32]
    fmul fmul dword ptr [esp + 104]
    fld fld dword ptr [esp + 100]
    fmul fmul dword ptr [esp + 12]
    faddp faddp st(1)
    fld fld dword ptr [esp + 44]
    fmul fmul dword ptr [esp + 112]
    faddp faddp st(1)
    fld fld dword ptr [esp + 100]
    fmul fmul dword ptr [esp + 16]
    fld fld dword ptr [esp + 28]
    fmul fmul dword ptr [esp + 104]
    faddp faddp st(1)
    fld fld dword ptr [esp + 48]
    fmul fmul dword ptr [esp + 112]
    faddp faddp st(1)
    fsubp fsubp st(1)
    fstp fstp dword ptr [ecx + 40]
    fld fld dword ptr [esp + 100]
    fmul fmul dword ptr [esp + 24]
    fld fld dword ptr [esp + 36]
    fmul fmul dword ptr [esp + 104]
    faddp faddp st(1)
    fld fld dword ptr [esp + 48]
    fmul fmul dword ptr [esp + 108]
    faddp faddp st(1)
    fld fld dword ptr [esp + 100]
    fmul fmul dword ptr [esp + 20]
    fld fld dword ptr [esp + 40]
    fmul fmul dword ptr [esp + 104]
    faddp faddp st(1)
    fld fld dword ptr [esp + 44]
    fmul fmul dword ptr [esp + 108]
    faddp faddp st(1)
    fsubp fsubp st(1)
    fstp fstp dword ptr [ecx + 44]
    fld fld dword ptr [esp + 24]
    fmul fmul dword ptr [esp + 96]
    fld fld dword ptr [esp + 88]
    fmul fmul dword ptr [esp + 8]
    faddp faddp st(1)
    fld fld dword ptr [esp + 12]
    fmul fmul dword ptr [esp + 92]
    faddp faddp st(1)
    fld fld dword ptr [esp + 20]
    fmul fmul dword ptr [esp + 96]
    fld fld dword ptr [esp + 88]
    fmul fmul dword ptr [esp + 4]
    faddp faddp st(1)
    fld fld dword ptr [esp + 16]
    fmul fmul dword ptr [esp + 92]
    faddp faddp st(1)
    fsubp fsubp st(1)
    fstp fstp dword ptr [ecx + 48]
    fld fld dword ptr [esp + 36]
    fmul fmul dword ptr [esp + 96]
    fld fld dword ptr [esp + 84]
    fmul fmul dword ptr [esp + 4]
    faddp faddp st(1)
    fld fld dword ptr [esp + 32]
    fmul fmul dword ptr [esp + 92]
    faddp faddp st(1)
    fld fld dword ptr [esp + 40]
    fmul fmul dword ptr [esp + 96]
    fld fld dword ptr [esp + 84]
    fmul fmul dword ptr [esp + 8]
    faddp faddp st(1)
    fld fld dword ptr [esp + 28]
    fmul fmul dword ptr [esp + 92]
    faddp faddp st(1)
    fsubp fsubp st(1)
    fstp fstp dword ptr [ecx + 52]
    fld fld dword ptr [esp + 84]
    fmul fmul dword ptr [esp + 16]
    fld fld dword ptr [esp + 28]
    fmul fmul dword ptr [esp + 88]
    faddp faddp st(1)
    fld fld dword ptr [esp + 48]
    fmul fmul dword ptr [esp + 96]
    faddp faddp st(1)
    fld fld dword ptr [esp + 32]
    fmul fmul dword ptr [esp + 88]
    fld fld dword ptr [esp + 84]
    fmul fmul dword ptr [esp + 12]
    faddp faddp st(1)
    fld fld dword ptr [esp + 44]
    fmul fmul dword ptr [esp + 96]
    faddp faddp st(1)
    fsubp fsubp st(1)
    fstp fstp dword ptr [ecx + 56]
    fld fld dword ptr [esp + 84]
    fmul fmul dword ptr [esp + 20]
    fld fld dword ptr [esp + 40]
    fmul fmul dword ptr [esp + 88]
    faddp faddp st(1)
    fld fld dword ptr [esp + 44]
    fmul fmul dword ptr [esp + 92]
    faddp faddp st(1)
    fld fld dword ptr [esp + 84]
    fmul fmul dword ptr [esp + 24]
    fld fld dword ptr [esp + 36]
    fmul fmul dword ptr [esp + 88]
    faddp faddp st(1)
    fld fld dword ptr [esp + 48]
    fmul fmul dword ptr [esp + 92]
    faddp faddp st(1)
    fsubp fsubp st(1)
    fstp fstp dword ptr [ecx + 60]
    fld fld dword ptr [esp + 60]
    fmul fmul dword ptr [eax]
    fld fld dword ptr [esp + 64]
    fmul fmul dword ptr [ecx + 12]
    faddp faddp st(1)
    fld fld dword ptr [esp + 52]
    fmul fmul dword ptr [ecx]
    faddp faddp st(1)
    fld fld dword ptr [esp + 56]
    fmul fmul dword ptr [ecx + 4]
    faddp faddp st(1)
    fstp fstp dword ptr [esp]
    fld fld dword ptr [g_1019BC78]
    mov mov ecx, 2
    fdiv fdiv dword ptr [esp]
    fstp fstp dword ptr [esp]
    fld fld dword ptr [esp]
    add add eax, 32
    dec dec ecx
    fmul fmul dword ptr [eax - 40]
    fstp fstp dword ptr [eax - 40]
    fld fld dword ptr [esp]
    fmul fmul dword ptr [eax - 36]
    fstp fstp dword ptr [eax - 36]
    fld fld dword ptr [esp]
    fmul fmul dword ptr [eax - 32]
    fstp fstp dword ptr [eax - 32]
    fld fld dword ptr [esp]
    fmul fmul dword ptr [eax - 28]
    fstp fstp dword ptr [eax - 28]
    fld fld dword ptr [esp]
    fmul fmul dword ptr [eax - 24]
    fstp fstp dword ptr [eax - 24]
    fld fld dword ptr [esp]
    fmul fmul dword ptr [eax - 20]
    fstp fstp dword ptr [eax - 20]
    fld fld dword ptr [esp]
    fmul fmul dword ptr [eax - 16]
    fstp fstp dword ptr [eax - 16]
    fld fld dword ptr [esp]
    fmul fmul dword ptr [eax - 12]
    fstp fstp dword ptr [eax - 12]
    jne sub_1005B87C
    add add esp, 116
    ret ret
FUN_1005ad00 ENDP
END
