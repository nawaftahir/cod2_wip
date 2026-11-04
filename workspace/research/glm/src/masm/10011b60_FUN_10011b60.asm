.686
.MODEL FLAT, C
EXTRN sub_10011A65:PROC
EXTRN sub_10011A96:PROC
EXTRN sub_10011B40:PROC
EXTRN fp_101D49E8:DWORD
EXTRN g_101CE708:DWORD
EXTRN g_101D497C:DWORD
EXTRN g_101D49A4:DWORD
EXTRN g_101D49C0:DWORD
.CODE
FUN_10011b60 PROC
    mov eax, dword ptr [g_101CE708]
    mov edx, dword ptr [eax + 8]
    xor ecx, ecx
    cmp edx, 2
    setne cl
    push esi
    mov eax, 0101D4998h
    dec ecx
    and ecx, 0FFFFFFE4h
    add ecx, 64
    shl ecx, 15
    call sub_10011A65
    mov dword ptr [g_101D49A4], 0101D4998h
    mov esi, 0101D4980h
L0:
    mov edx, dword ptr [g_101CE708]
    mov eax, dword ptr [edx + 8]
    xor ecx, ecx
    cmp eax, 2
    setne cl
    mov eax, esi
    dec ecx
    and ecx, 0FFFFFFE4h
    add ecx, 64
    shl ecx, 17
    call sub_10011A96
    add esi, 12
    cmp esi, 0101D4998h
    jne L0
    mov ecx, 000200000h
    mov eax, 0101D4970h
    call sub_10011B40
    push 000A00000h
    mov dword ptr [g_101D497C], 0101D4970h
    call dword ptr [fp_101D49E8]
    add esp, 4
    mov dword ptr [g_101D49C0], eax
    pop esi
    ret
FUN_10011b60 ENDP
END
