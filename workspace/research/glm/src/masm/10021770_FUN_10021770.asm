.686
.MODEL FLAT, C
EXTRN g_101CE638:DWORD
EXTRN g_1042E778:DWORD
.CODE
FUN_10021770 PROC
    mov edx, dword ptr [g_1042E778]
    push esi
    mov esi, dword ptr [edx + 000030000h]
    mov eax, 000030000h
    sub eax, esi
    cmp eax, 76
    jge L0
    xor eax, eax
    mov dword ptr [edx + 000030008h], eax
    jmp L1
L0:
    lea eax, [esi + edx]
    add esi, 76
    mov dword ptr [edx + 000030000h], esi
    add dword ptr [edx + 000030004h], 76
    mov dword ptr [edx + 000030008h], eax
    mov word ptr [eax], 5
    mov word ptr [eax + 2], 76
L1:
    mov edx, dword ptr [esp + 8]
    mov dword ptr [eax + 4], edx
    mov edx, dword ptr [ecx + 4]
    mov dword ptr [eax + 8], edx
    mov edx, dword ptr [ecx + 8]
    mov dword ptr [eax + 12], edx
    mov edx, dword ptr [ecx + 12]
    mov dword ptr [eax + 16], edx
    mov edx, dword ptr [ecx + 16]
    mov dword ptr [eax + 20], edx
    fld dword ptr [ecx + 28]
    mov edx, dword ptr [ecx + 20]
    fld dword ptr [ecx + 24]
    fstp dword ptr [eax + 44]
    mov dword ptr [eax + 40], edx
    mov edx, 03F800000h
    fstp dword ptr [eax + 48]
    mov dword ptr [eax + 52], edx
    fld dword ptr [ecx + 40]
    mov esi, dword ptr [ecx + 32]
    fld dword ptr [ecx + 36]
    mov dword ptr [eax + 36], edx
    mov edx, dword ptr [g_101CE638]
    fstp dword ptr [eax + 28]
    mov dword ptr [eax + 24], esi
    fstp dword ptr [eax + 32]
    pop esi
    fld dword ptr [edx + 8]
    fld st(0)
    fmul dword ptr [eax + 40]
    fstp dword ptr [eax + 56]
    fld st(0)
    fmul dword ptr [eax + 44]
    fstp dword ptr [eax + 60]
    fld st(0)
    fmul dword ptr [eax + 48]
    fstp dword ptr [eax + 64]
    fmul dword ptr [eax + 52]
    fstp dword ptr [eax + 68]
    mov ecx, dword ptr [ecx]
    mov dword ptr [eax + 72], ecx
    ret
FUN_10021770 ENDP
END
