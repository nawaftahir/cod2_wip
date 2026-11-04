.686
.MODEL FLAT, C
EXTRN sub_100038AA:PROC
EXTRN sub_100298BF:PROC
EXTRN sub_10029C45:PROC
EXTRN g_101AE384:DWORD
EXTRN g_101AE388:DWORD
.CODE
FUN_10003810 PROC
    mov eax, dword ptr [g_101AE384]
    push esi
    xor esi, esi
    test eax, eax
    push edi
    jle L1
    xor edi, edi
    nop
L0:
    mov eax, dword ptr [g_101AE388]
    mov ecx, dword ptr [edi + eax + 28]
    push ecx
    call sub_100298BF
    mov eax, dword ptr [g_101AE384]
    add esp, 4
    inc esi
    add edi, 60
    cmp esi, eax
    jl L0
L1:
    xor esi, esi
    test eax, eax
    jle sub_100038AA
    xor edi, edi
    jmp L2
    lea esp, [esp]
L2:
    mov edx, dword ptr [g_101AE388]
    mov eax, dword ptr [edi + edx + 28]
    push eax
    push 0101AE288h
    call sub_10029C45
    mov eax, dword ptr [g_101AE384]
    add esp, 8
    inc esi
    add edi, 60
FUN_10003810 ENDP
END
