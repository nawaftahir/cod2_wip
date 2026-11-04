.686
.MODEL FLAT, C
EXTRN sub_10011A65:PROC
EXTRN sub_10011A96:PROC
EXTRN sub_10011B40:PROC
EXTRN sub_10011BF5:PROC
EXTRN EXTRN fp_101D49E8:DWORD:DWORD
EXTRN EXTRN g_101CE708:DWORD:DWORD
EXTRN EXTRN g_101D497C:DWORD:DWORD
EXTRN EXTRN g_101D49A4:DWORD:DWORD
EXTRN EXTRN g_101D49C0:DWORD:DWORD
.CODE
FUN_10011b60 PROC
    mov mov eax, dword ptr [g_101CE708]
    mov mov edx, dword ptr [eax + 8]
    xor xor ecx, ecx
    cmp cmp edx, 2
    setne setne cl
    push push esi
    mov mov eax, 0101D4998h
    dec dec ecx
    and and ecx, -28
    add add ecx, 64
    shl shl ecx, 15
    call sub_10011A65
    mov mov dword ptr [g_101D49A4], 0101D4998h
    mov mov esi, 0101D4980h
    mov mov edx, dword ptr [g_101CE708]
    mov mov eax, dword ptr [edx + 8]
    xor xor ecx, ecx
    cmp cmp eax, 2
    setne setne cl
    mov mov eax, esi
    dec dec ecx
    and and ecx, -28
    add add ecx, 64
    shl shl ecx, 17
    call sub_10011A96
    add add esi, 12
    cmp cmp esi, 0101D4998h
    jne sub_10011BF5
    mov mov ecx, 0200000h
    mov mov eax, 0101D4970h
    call sub_10011B40
    push push 0A00000h
    mov mov dword ptr [g_101D497C], 0101D4970h
    call dword ptr [fp_101D49E8]
    add add esp, 4
    mov mov dword ptr [g_101D49C0], eax
    pop pop esi
    ret ret
FUN_10011b60 ENDP
END
