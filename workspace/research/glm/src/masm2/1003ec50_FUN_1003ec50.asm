.686
.MODEL FLAT, C
EXTRN sub_1003D966:PROC
EXTRN sub_1003EC72:PROC
EXTRN EXTRN g_101D1B08:DWORD:DWORD
.CODE
FUN_1003ec50 PROC
    push push edi
    xor xor edi, edi
    xor xor eax, eax
    mov mov al, byte ptr [edi + 010766764h]
    push push eax
    mov mov eax, dword ptr [g_101D1B08]
    call sub_1003D966
    add add esp, 4
    inc inc edi
    cmp cmp edi, 16
    jl sub_1003EC72
    pop pop edi
    ret ret
FUN_1003ec50 ENDP
END
