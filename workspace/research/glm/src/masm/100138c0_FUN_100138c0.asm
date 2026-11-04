.686
.MODEL FLAT, C
EXTRN sub_100F6202:PROC
EXTRN fp_101D49CC:DWORD
EXTRN fp_101D4B88:DWORD
EXTRN g_101D1BF8:DWORD
EXTRN g_101D492D:DWORD
.CODE
FUN_100138c0 PROC
    sub esp, 000000400h
    call dword ptr [fp_101D4B88]
    mov al, byte ptr [g_101D492D]
    test al, al
    je L0
    mov eax, dword ptr [g_101D1BF8]
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx + 0xa8]
    mov byte ptr [g_101D492D], 0
L0:
    mov eax, dword ptr [esp + 000000408h]
    lea edx, [esp + 00000040Ch]
    push edx
    push eax
    lea ecx, [esp + 8]
    push 0000003FFh
    push ecx
    call sub_100F6202
    mov eax, dword ptr [esp + 000000414h]
    lea edx, [esp + 16]
    push edx
    push 010193358h
    push eax
    mov byte ptr [esp + 00000041Bh], 0
    call dword ptr [fp_101D49CC]
    add esp, 00000041Ch
    ret
FUN_100138c0 ENDP
END
