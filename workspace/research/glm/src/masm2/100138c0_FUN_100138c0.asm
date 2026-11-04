.686
.MODEL FLAT, C
EXTRN sub_100F6202:PROC
EXTRN EXTRN fp_101D49CC:DWORD:DWORD
EXTRN EXTRN fp_101D4B88:DWORD:DWORD
EXTRN EXTRN g_101D1BF8:DWORD:DWORD
EXTRN EXTRN g_101D492D:DWORD:DWORD
.CODE
FUN_100138c0 PROC
    sub sub esp, 0400h
    call dword ptr [fp_101D4B88]
    mov mov al, byte ptr [g_101D492D]
    test test al, al
    je L0
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov ecx, dword ptr [eax]
    push push eax
    call call dword ptr [ecx + 0A8h]
    mov mov byte ptr [g_101D492D], 0
    mov mov eax, dword ptr [esp + 0408h]
    lea lea edx, [esp + 040Ch]
    push push edx
    push push eax
    lea lea ecx, [esp + 8]
    push push 03FFh
    push push ecx
    call sub_100F6202
    mov mov eax, dword ptr [esp + 0414h]
    lea lea edx, [esp + 16]
    push push edx
    push push 010193358h
    push push eax
    mov mov byte ptr [esp + 041Bh], 0
    call dword ptr [fp_101D49CC]
    add add esp, 041Ch
    ret ret
FUN_100138c0 ENDP
END
