.686
.MODEL FLAT, C
EXTRN sub_100210AF:PROC
EXTRN sub_10033B8A:PROC
EXTRN sub_10033D82:PROC
EXTRN g_101DA9C8:DWORD
EXTRN g_1042E778:DWORD
.CODE
FUN_10020d50 PROC
    mov eax, dword ptr [g_1042E778]
    mov edx, dword ptr [eax + 000030000h]
    mov ecx, 000030000h
    sub ecx, edx
    cmp ecx, 4
    jge L0
    xor edx, edx
    mov dword ptr [eax + 000030008h], edx
    jmp L1
L0:
    lea ecx, [edx + eax]
    add edx, 4
    mov dword ptr [eax + 000030000h], edx
    add dword ptr [eax + 000030004h], 4
    mov dword ptr [eax + 000030008h], ecx
    xor edx, edx
    mov word ptr [ecx], dx
    mov word ptr [ecx + 2], 4
L1:
    mov eax, dword ptr [g_101DA9C8]
    push eax
    mov dword ptr [eax + 000249D0Ch], edx
    mov dword ptr [eax + 000249D10h], edx
    mov dword ptr [eax + 000249D14h], edx
    call sub_10033D82
    add esp, 4
    call sub_10033B8A
    jmp sub_100210AF
FUN_10020d50 ENDP
END
