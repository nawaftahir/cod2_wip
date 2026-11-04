.686
.MODEL FLAT, C
EXTRN fp_101D49D4:DWORD
EXTRN fp_101D49D8:DWORD
EXTRN g_1019BC78:DWORD
EXTRN g_101CE708:DWORD
EXTRN g_10696CD0:DWORD
EXTRN g_10696CD4:DWORD
EXTRN g_10696CD8:DWORD
EXTRN g_10696CDC:DWORD
EXTRN g_10696CE0:DWORD
.CODE
FUN_1002a780 PROC
    push ecx
    push esi
    mov esi, eax
    mov eax, dword ptr [g_101CE708]
    push edi
    mov edi, ecx
    cmp dword ptr [eax + 8], 2
    jne L0
    lea ecx, [esi + esi*2]
    shl ecx, 5
    push ecx
    call dword ptr [fp_101D49D4]
    lea edx, [esi*4]
    push edx
    mov dword ptr [edi + 00000012Ch], eax
    call dword ptr [fp_101D49D4]
    add esp, 8
    mov dword ptr [edi + 000000130h], eax
    pop edi
    pop esi
    pop ecx
    ret
L0:
    mov eax, 1
    cmp esi, eax
    mov dword ptr [g_10696CD0], eax
    jle L2
    mov edi, edi
L1:
    add eax, eax
    mov ecx, eax
    imul ecx, eax
    cmp ecx, esi
    jl L1
    mov dword ptr [g_10696CD0], eax
L2:
    mov edx, eax
    imul edx, eax
    add esi, esi
    cmp edx, esi
    mov ecx, eax
    mov dword ptr [g_10696CD4], ecx
    jl L3
    lea ecx, [eax + 1]
    sar ecx, 1
    mov dword ptr [g_10696CD4], ecx
L3:
    lea edx, [eax + eax]
    mov dword ptr [esp + 8], edx
    fild dword ptr [esp + 8]
    lea edx, [ecx + ecx]
    imul ecx, eax
    fdivr dword ptr [g_1019BC78]
    mov dword ptr [esp + 8], edx
    shl ecx, 5
    mov esi, ecx
    push esi
    fstp dword ptr [g_10696CD8]
    fild dword ptr [esp + 12]
    fdivr dword ptr [g_1019BC78]
    fstp dword ptr [g_10696CDC]
    call dword ptr [fp_101D49D8]
    mov ecx, esi
    mov edx, ecx
    mov edi, eax
    shr ecx, 2
    mov dword ptr [g_10696CE0], edi
    mov eax, 080808080h
    rep stosd dword ptr es:[edi], eax
    add esp, 4
    mov ecx, edx
    and ecx, 3
    rep stosb byte ptr es:[edi], al
    pop edi
    pop esi
    pop ecx
    ret
FUN_1002a780 ENDP
END
