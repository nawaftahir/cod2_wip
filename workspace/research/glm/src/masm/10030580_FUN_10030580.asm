.686
.MODEL FLAT, C
EXTRN sub_100304F3:PROC
EXTRN g_1072DECC:DWORD
EXTRN g_1072DED0:DWORD
.CODE
FUN_10030580 PROC
    push ecx
    mov eax, dword ptr [g_1072DED0]
    push esi
    mov esi, dword ptr [g_1072DECC]
    push edi
    xor edi, edi
    test eax, eax
    jle L1
L0:
    mov eax, dword ptr [edi*4 + 01072DED4h]
    push eax
    mov eax, esi
    call sub_100304F3
    mov eax, dword ptr [g_1072DED0]
    mov ecx, 1
    sub ecx, esi
    add esp, 4
    inc edi
    cmp edi, eax
    mov esi, ecx
    jl L0
L1:
    pop edi
    mov dword ptr [g_1072DED0], 0
    pop esi
    pop ecx
    ret
FUN_10030580 ENDP
END
