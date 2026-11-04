.686
.MODEL FLAT, C
EXTRN sub_10003889:PROC
EXTRN sub_100038AA:PROC
EXTRN sub_100298BF:PROC
EXTRN sub_10029C45:PROC
EXTRN EXTRN g_101AE384:DWORD:DWORD
EXTRN EXTRN g_101AE388:DWORD:DWORD
.CODE
FUN_10003810 PROC
    mov mov eax, dword ptr [g_101AE384]
    push push esi
    xor xor esi, esi
    test test eax, eax
    push push edi
    jle L0
    xor xor edi, edi
    nop nop
    mov mov eax, dword ptr [g_101AE388]
    mov mov ecx, dword ptr [edi + eax + 28]
    push push ecx
    call sub_100298BF
    mov mov eax, dword ptr [g_101AE384]
    add add esp, 4
    inc inc esi
    add add edi, 60
    cmp cmp esi, eax
    jl L1
    xor xor esi, esi
    test test eax, eax
    jle sub_100038AA
    xor xor edi, edi
    jmp sub_10003889
    lea lea esp, [esp]
    mov mov edx, dword ptr [g_101AE388]
    mov mov eax, dword ptr [edi + edx + 28]
    push push eax
    push push 0101AE288h
    call sub_10029C45
    mov mov eax, dword ptr [g_101AE384]
    add add esp, 8
    inc inc esi
    add add edi, 60
FUN_10003810 ENDP
END
