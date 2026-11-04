.686
.MODEL FLAT, C
EXTRN sub_10016EFD:PROC
EXTRN sub_100179C8:PROC
EXTRN g_101D0B04:DWORD
.CODE
FUN_10016e70 PROC
    mov eax, dword ptr [g_101D0B04]
    lea eax, [eax*4 + 0101D0B08h]
    mov ecx, eax
    sub ecx, 0101D0B08h
    push 010016890h
    sar ecx, 2
    push ecx
    push eax
    push 0101D0B08h
    call sub_100179C8
    mov ecx, dword ptr [g_101D0B04]
    add esp, 16
    xor eax, eax
    test ecx, ecx
    jle sub_10016EFD
    jmp L0
    lea esp, [esp]
L0:
    mov edx, dword ptr [eax*4 + 0101D0B08h]
    mov word ptr [edx + 10], ax
FUN_10016e70 ENDP
END
