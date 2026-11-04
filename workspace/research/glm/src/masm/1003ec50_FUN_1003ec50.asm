.686
.MODEL FLAT, C
EXTRN sub_1003D966:PROC
EXTRN g_101D1B08:DWORD
.CODE
FUN_1003ec50 PROC
    push edi
    xor edi, edi
L0:
    xor eax, eax
    mov al, byte ptr [edi + 010766764h]
    push eax
    mov eax, dword ptr [g_101D1B08]
    call sub_1003D966
    add esp, 4
    inc edi
    cmp edi, 16
    jl L0
    pop edi
    ret
FUN_1003ec50 ENDP
END
