.686
.MODEL FLAT, C
EXTRN sub_1002A871:PROC
EXTRN EXTRN fp_101D49D4:DWORD:DWORD
EXTRN EXTRN fp_101D49D8:DWORD:DWORD
EXTRN EXTRN g_1019BC78:DWORD:DWORD
EXTRN EXTRN g_101CE708:DWORD:DWORD
EXTRN EXTRN g_10696CD0:DWORD:DWORD
EXTRN EXTRN g_10696CD4:DWORD:DWORD
EXTRN EXTRN g_10696CD8:DWORD:DWORD
EXTRN EXTRN g_10696CDC:DWORD:DWORD
EXTRN EXTRN g_10696CE0:DWORD:DWORD
.CODE
FUN_1002a780 PROC
    push push ecx
    push push esi
    mov mov esi, eax
    mov mov eax, dword ptr [g_101CE708]
    push push edi
    mov mov edi, ecx
    cmp cmp dword ptr [eax + 8], 2
    jne L0
    lea lea ecx, [esi + esi*2]
    shl shl ecx, 5
    push push ecx
    call dword ptr [fp_101D49D4]
    lea lea edx, [esi*4]
    push push edx
    mov mov dword ptr [edi + 012Ch], eax
    call dword ptr [fp_101D49D4]
    add add esp, 8
    mov mov dword ptr [edi + 0130h], eax
    pop pop edi
    pop pop esi
    pop pop ecx
    ret ret
    mov mov eax, 1
    cmp cmp esi, eax
    mov mov dword ptr [g_10696CD0], eax
    jle L2
    mov mov edi, edi
    add add eax, eax
L0:
    mov mov ecx, eax
    imul imul ecx, eax
    cmp cmp ecx, esi
    jl L1
    mov mov dword ptr [g_10696CD0], eax
    mov mov edx, eax
    imul imul edx, eax
    add add esi, esi
    cmp cmp edx, esi
    mov mov ecx, eax
    mov mov dword ptr [g_10696CD4], ecx
    jl sub_1002A871
    lea lea ecx, [eax + 1]
    sar sar ecx, 1
    mov mov dword ptr [g_10696CD4], ecx
    lea lea edx, [eax + eax]
    mov mov dword ptr [esp + 8], edx
    fild fild dword ptr [esp + 8]
    lea lea edx, [ecx + ecx]
    imul imul ecx, eax
    fdivr fdivr dword ptr [g_1019BC78]
    mov mov dword ptr [esp + 8], edx
    shl shl ecx, 5
    mov mov esi, ecx
    push push esi
    fstp fstp dword ptr [g_10696CD8]
    fild fild dword ptr [esp + 12]
    fdivr fdivr dword ptr [g_1019BC78]
    fstp fstp dword ptr [g_10696CDC]
    call dword ptr [fp_101D49D8]
    mov mov ecx, esi
    mov mov edx, ecx
    mov mov edi, eax
    shr shr ecx, 2
    mov mov dword ptr [g_10696CE0], edi
    mov mov eax, 080808080h
    rep stosd rep stosd dword ptr es:[edi], eax
    add add esp, 4
    mov mov ecx, edx
    and and ecx, 3
    rep stosb rep stosb byte ptr es:[edi], al
    pop pop edi
    pop pop esi
    pop pop ecx
    ret ret
FUN_1002a780 ENDP
END
