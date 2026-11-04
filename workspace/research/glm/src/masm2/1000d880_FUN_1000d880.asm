.686
.MODEL FLAT, C
EXTRN sub_1000CB92:PROC
EXTRN sub_1000D56D:PROC
EXTRN sub_1000D688:PROC
EXTRN sub_1003D973:PROC
EXTRN EXTRN g_101A59F8:DWORD:DWORD
EXTRN EXTRN g_101CEA4A:DWORD:DWORD
EXTRN EXTRN g_101CEA4C:DWORD:DWORD
EXTRN EXTRN g_101CEA5E:DWORD:DWORD
EXTRN EXTRN g_101CEA60:DWORD:DWORD
EXTRN EXTRN g_101D1B08:DWORD:DWORD
EXTRN EXTRN g_101D1B98:DWORD:DWORD
EXTRN EXTRN g_101D1BE8:DWORD:DWORD
EXTRN EXTRN g_101D1BE9:DWORD:DWORD
EXTRN EXTRN g_101D1BEC:DWORD:DWORD
.CODE
FUN_1000d880 PROC
    push push ecx
    push push esi
    push push edi
    call sub_1000D688
    call sub_1000D56D
    xor xor edi, edi
    nop nop
    xor xor eax, eax
    mov mov al, byte ptr [edi + 010766764h]
    push push eax
    mov mov eax, dword ptr [g_101D1B08]
    call sub_1003D973
    add add esp, 4
    inc inc edi
    cmp cmp edi, 16
    jl L0
    mov mov esi, dword ptr [g_101A59F8]
    mov mov dword ptr [g_101CEA60], esi
    mov mov byte ptr [g_101CEA5E], 4
    mov mov byte ptr [g_101CEA4A], 0
    mov mov byte ptr [g_101CEA4C], 0
    call sub_1000CB92
    mov mov ecx, 0101CEA40h
    pop pop edi
    mov mov dword ptr [eax*4 + 0101CEA68h], ecx
    mov mov dword ptr [g_101D1B98], ecx
    mov mov byte ptr [g_101D1BE8], 50
    mov mov byte ptr [g_101D1BE9], 0
    mov mov dword ptr [g_101D1BEC], ecx
    pop pop esi
    pop pop ecx
    ret ret
FUN_1000d880 ENDP
END
