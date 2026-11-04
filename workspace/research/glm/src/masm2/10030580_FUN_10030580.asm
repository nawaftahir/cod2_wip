.686
.MODEL FLAT, C
EXTRN sub_100304F3:PROC
EXTRN sub_100305CD:PROC
EXTRN EXTRN g_1072DECC:DWORD:DWORD
EXTRN EXTRN g_1072DED0:DWORD:DWORD
.CODE
FUN_10030580 PROC
    push push ecx
    mov mov eax, dword ptr [g_1072DED0]
    push push esi
    mov mov esi, dword ptr [g_1072DECC]
    push push edi
    xor xor edi, edi
    test test eax, eax
    jle sub_100305CD
    mov mov eax, dword ptr [edi*4 + 01072DED4h]
    push push eax
    mov mov eax, esi
    call sub_100304F3
    mov mov eax, dword ptr [g_1072DED0]
    mov mov ecx, 1
    sub sub ecx, esi
    add add esp, 4
    inc inc edi
    cmp cmp edi, eax
    mov mov esi, ecx
    jl sub_100305CD
    pop pop edi
    mov mov dword ptr [g_1072DED0], 0
    pop pop esi
    pop pop ecx
    ret ret
FUN_10030580 ENDP
END
