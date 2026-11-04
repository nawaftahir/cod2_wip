.686
.MODEL FLAT, C
EXTRN sub_10036750:PROC
EXTRN sub_100368E1:PROC
EXTRN g_1019BCB0:DWORD
EXTRN g_101D1B9C:DWORD
.CODE
FUN_10037500 PROC
    mov ecx, ebx
    imul ecx, ecx, 104
    sub esp, 96
    mov edx, ecx
    push ebp
    mov ebp, dword ptr [esp + 112]
    shr ecx, 2
    push esi
    push edi
    xor eax, eax
    mov edi, ebp
    rep stosd dword ptr es:[edi], eax
    mov ecx, edx
    and ecx, 3
    rep stosb byte ptr es:[edi], al
    mov ecx, dword ptr [esp + 112]
    lea eax, [esp + 12]
    xor esi, esi
    call sub_10036750
    cmp ebx, 1
    jle L1
L0:
    push ebp
    lea edi, [esp + 16]
    mov eax, esi
    call sub_100368E1
    add esp, 4
    test al, al
    je L1
    inc esi
    lea eax, [esi + 1]
    cmp eax, ebx
    jl L0
L1:
    mov ecx, esi
    imul ecx, ecx, 104
    mov dword ptr [ecx + ebp], 3
    mov edx, dword ptr [g_101D1B9C]
    lea eax, [ecx + ebp]
    pop edi
    fld dword ptr [edx + 0000000D4h]
    fmul dword ptr [g_1019BCB0]
    fstp dword ptr [eax + 36]
    mov ecx, dword ptr [g_101D1B9C]
    fld dword ptr [ecx + 0000000D8h]
    fmul dword ptr [g_1019BCB0]
    fstp dword ptr [eax + 40]
    mov edx, dword ptr [g_101D1B9C]
    fld dword ptr [edx + 0000000DCh]
    fmul dword ptr [g_1019BCB0]
    fstp dword ptr [eax + 44]
    mov ecx, dword ptr [g_101D1B9C]
    fld dword ptr [esp + 112]
    fmul dword ptr [ecx + 0000000C8h]
    fmul dword ptr [g_1019BCB0]
    fstp dword ptr [eax + 4]
    mov edx, dword ptr [g_101D1B9C]
    fld dword ptr [esp + 112]
    fmul dword ptr [edx + 0000000CCh]
    fmul dword ptr [g_1019BCB0]
    fstp dword ptr [eax + 8]
    mov ecx, dword ptr [g_101D1B9C]
    fld dword ptr [esp + 112]
    fmul dword ptr [ecx + 0000000D0h]
    fmul dword ptr [g_1019BCB0]
    fstp dword ptr [eax + 12]
    mov edx, dword ptr [g_101D1B9C]
    fld dword ptr [edx + 0000000B8h]
    fchs
    fstp dword ptr [eax + 64]
    mov ecx, dword ptr [g_101D1B9C]
    fld dword ptr [ecx + 0000000BCh]
    fchs
    fstp dword ptr [eax + 68]
    mov edx, dword ptr [g_101D1B9C]
    fld dword ptr [edx + 0000000C0h]
    fchs
    fstp dword ptr [eax + 72]
    lea eax, [esi + 1]
    pop esi
    pop ebp
    add esp, 96
    ret
FUN_10037500 ENDP
END
