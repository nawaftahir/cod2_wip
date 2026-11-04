.686
.MODEL FLAT, C
EXTRN EXTRN g_101CE638:DWORD:DWORD
EXTRN EXTRN g_1042E778:DWORD:DWORD
.CODE
FUN_10021770 PROC
    mov mov edx, dword ptr [g_1042E778]
    push push esi
    mov mov esi, dword ptr [edx + 030000h]
    mov mov eax, 030000h
    sub sub eax, esi
    cmp cmp eax, 76
    jge L0
    xor xor eax, eax
    mov mov dword ptr [edx + 030008h], eax
    jmp L1
    lea lea eax, [esi + edx]
    add add esi, 76
    mov mov dword ptr [edx + 030000h], esi
    add add dword ptr [edx + 030004h], 76
    mov mov dword ptr [edx + 030008h], eax
L0:
    mov mov word ptr [eax], 5
    mov mov word ptr [eax + 2], 76
    mov mov edx, dword ptr [esp + 8]
    mov mov dword ptr [eax + 4], edx
    mov mov edx, dword ptr [ecx + 4]
    mov mov dword ptr [eax + 8], edx
    mov mov edx, dword ptr [ecx + 8]
    mov mov dword ptr [eax + 12], edx
    mov mov edx, dword ptr [ecx + 12]
    mov mov dword ptr [eax + 16], edx
    mov mov edx, dword ptr [ecx + 16]
    mov mov dword ptr [eax + 20], edx
    fld fld dword ptr [ecx + 28]
    mov mov edx, dword ptr [ecx + 20]
    fld fld dword ptr [ecx + 24]
    fstp fstp dword ptr [eax + 44]
    mov mov dword ptr [eax + 40], edx
    mov mov edx, 03F800000h
    fstp fstp dword ptr [eax + 48]
    mov mov dword ptr [eax + 52], edx
    fld fld dword ptr [ecx + 40]
    mov mov esi, dword ptr [ecx + 32]
    fld fld dword ptr [ecx + 36]
    mov mov dword ptr [eax + 36], edx
    mov mov edx, dword ptr [g_101CE638]
    fstp fstp dword ptr [eax + 28]
    mov mov dword ptr [eax + 24], esi
    fstp fstp dword ptr [eax + 32]
    pop pop esi
    fld fld dword ptr [edx + 8]
    fld fld st(0)
    fmul fmul dword ptr [eax + 40]
    fstp fstp dword ptr [eax + 56]
    fld fld st(0)
    fmul fmul dword ptr [eax + 44]
    fstp fstp dword ptr [eax + 60]
    fld fld st(0)
    fmul fmul dword ptr [eax + 48]
    fstp fstp dword ptr [eax + 64]
    fmul fmul dword ptr [eax + 52]
    fstp fstp dword ptr [eax + 68]
    mov mov ecx, dword ptr [ecx]
    mov mov dword ptr [eax + 72], ecx
    ret ret
FUN_10021770 ENDP
END
