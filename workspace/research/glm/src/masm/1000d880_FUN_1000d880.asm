.686
.MODEL FLAT, C
EXTRN sub_1000CB92:PROC
EXTRN sub_1000D56D:PROC
EXTRN sub_1000D688:PROC
EXTRN sub_1003D973:PROC
EXTRN g_101A59F8:DWORD
EXTRN g_101CEA4A:DWORD
EXTRN g_101CEA4C:DWORD
EXTRN g_101CEA5E:DWORD
EXTRN g_101CEA60:DWORD
EXTRN g_101D1B08:DWORD
EXTRN g_101D1B98:DWORD
EXTRN g_101D1BE8:DWORD
EXTRN g_101D1BE9:DWORD
EXTRN g_101D1BEC:DWORD
.CODE
FUN_1000d880 PROC
    push ecx
    push esi
    push edi
    call sub_1000D688
    call sub_1000D56D
    xor edi, edi
    nop
L0:
    xor eax, eax
    mov al, byte ptr [edi + 010766764h]
    push eax
    mov eax, dword ptr [g_101D1B08]
    call sub_1003D973
    add esp, 4
    inc edi
    cmp edi, 16
    jl L0
    mov esi, dword ptr [g_101A59F8]
    mov dword ptr [g_101CEA60], esi
    mov byte ptr [g_101CEA5E], 4
    mov byte ptr [g_101CEA4A], 0
    mov byte ptr [g_101CEA4C], 0
    call sub_1000CB92
    mov ecx, 0101CEA40h
    pop edi
    mov dword ptr [eax*4 + 0101CEA68h], ecx
    mov dword ptr [g_101D1B98], ecx
    mov byte ptr [g_101D1BE8], 50
    mov byte ptr [g_101D1BE9], 0
    mov dword ptr [g_101D1BEC], ecx
    pop esi
    pop ecx
    ret
FUN_1000d880 ENDP
END
