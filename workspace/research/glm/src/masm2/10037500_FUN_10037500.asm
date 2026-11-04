.686
.MODEL FLAT, C
EXTRN sub_10036750:PROC
EXTRN sub_100368E1:PROC
EXTRN EXTRN g_1019BCB0:DWORD:DWORD
EXTRN EXTRN g_101D1B9C:DWORD:DWORD
.CODE
FUN_10037500 PROC
    mov mov ecx, ebx
    imul imul ecx, ecx, 104
    sub sub esp, 96
    mov mov edx, ecx
    push push ebp
    mov mov ebp, dword ptr [esp + 112]
    shr shr ecx, 2
    push push esi
    push push edi
    xor xor eax, eax
    mov mov edi, ebp
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov ecx, edx
    and and ecx, 3
    rep stosb rep stosb byte ptr es:[edi], al
    mov mov ecx, dword ptr [esp + 112]
    lea lea eax, [esp + 12]
    xor xor esi, esi
    call sub_10036750
    cmp cmp ebx, 1
    jle L0
    push push ebp
    lea lea edi, [esp + 16]
    mov mov eax, esi
    call sub_100368E1
    add add esp, 4
    test test al, al
    je L1
    inc inc esi
    lea lea eax, [esi + 1]
    cmp cmp eax, ebx
    jl L0
    mov mov ecx, esi
    imul imul ecx, ecx, 104
    mov mov dword ptr [ecx + ebp], 3
    mov mov edx, dword ptr [g_101D1B9C]
    lea lea eax, [ecx + ebp]
    pop pop edi
    fld fld dword ptr [edx + 0D4h]
    fmul fmul dword ptr [g_1019BCB0]
    fstp fstp dword ptr [eax + 36]
    mov mov ecx, dword ptr [g_101D1B9C]
    fld fld dword ptr [ecx + 0D8h]
    fmul fmul dword ptr [g_1019BCB0]
    fstp fstp dword ptr [eax + 40]
    mov mov edx, dword ptr [g_101D1B9C]
    fld fld dword ptr [edx + 0DCh]
    fmul fmul dword ptr [g_1019BCB0]
    fstp fstp dword ptr [eax + 44]
    mov mov ecx, dword ptr [g_101D1B9C]
    fld fld dword ptr [esp + 112]
    fmul fmul dword ptr [ecx + 0C8h]
    fmul fmul dword ptr [g_1019BCB0]
    fstp fstp dword ptr [eax + 4]
    mov mov edx, dword ptr [g_101D1B9C]
    fld fld dword ptr [esp + 112]
    fmul fmul dword ptr [edx + 0CCh]
    fmul fmul dword ptr [g_1019BCB0]
    fstp fstp dword ptr [eax + 8]
    mov mov ecx, dword ptr [g_101D1B9C]
    fld fld dword ptr [esp + 112]
    fmul fmul dword ptr [ecx + 0D0h]
    fmul fmul dword ptr [g_1019BCB0]
    fstp fstp dword ptr [eax + 12]
    mov mov edx, dword ptr [g_101D1B9C]
    fld fld dword ptr [edx + 0B8h]
    fchs fchs
    fstp fstp dword ptr [eax + 64]
    mov mov ecx, dword ptr [g_101D1B9C]
    fld fld dword ptr [ecx + 0BCh]
    fchs fchs
    fstp fstp dword ptr [eax + 68]
    mov mov edx, dword ptr [g_101D1B9C]
    fld fld dword ptr [edx + 0C0h]
    fchs fchs
    fstp fstp dword ptr [eax + 72]
    lea lea eax, [esi + 1]
    pop pop esi
    pop pop ebp
    add add esp, 96
    ret ret
FUN_10037500 ENDP
END
