.686
.MODEL FLAT, C
EXTRN sub_10016EE9:PROC
EXTRN sub_10016EFD:PROC
EXTRN sub_100179C8:PROC
EXTRN EXTRN g_101D0B04:DWORD:DWORD
.CODE
FUN_10016e70 PROC
    mov mov eax, dword ptr [g_101D0B04]
    lea lea eax, [eax*4 + 0101D0B08h]
    mov mov ecx, eax
    sub sub ecx, 0101D0B08h
    push push 010016890h
    sar sar ecx, 2
    push push ecx
    push push eax
    push push 0101D0B08h
    call sub_100179C8
    mov mov ecx, dword ptr [g_101D0B04]
    add add esp, 16
    xor xor eax, eax
    test test ecx, ecx
    jle sub_10016EFD
    jmp sub_10016EE9
    lea lea esp, [esp]
    mov mov edx, dword ptr [eax*4 + 0101D0B08h]
    mov mov word ptr [edx + 10], ax
FUN_10016e70 ENDP
END
