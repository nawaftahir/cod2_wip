.686
.MODEL FLAT, C
EXTRN sub_100210AF:PROC
EXTRN sub_10033B8A:PROC
EXTRN sub_10033D82:PROC
EXTRN EXTRN g_101DA9C8:DWORD:DWORD
EXTRN EXTRN g_1042E778:DWORD:DWORD
.CODE
FUN_10020d50 PROC
    mov mov eax, dword ptr [g_1042E778]
    mov mov edx, dword ptr [eax + 030000h]
    mov mov ecx, 030000h
    sub sub ecx, edx
    cmp cmp ecx, 4
    jge L0
    xor xor edx, edx
    mov mov dword ptr [eax + 030008h], edx
    jmp L1
    lea lea ecx, [edx + eax]
    add add edx, 4
    mov mov dword ptr [eax + 030000h], edx
    add add dword ptr [eax + 030004h], 4
    mov mov dword ptr [eax + 030008h], ecx
    xor xor edx, edx
    mov mov word ptr [ecx], dx
    mov mov word ptr [ecx + 2], 4
    mov mov eax, dword ptr [g_101DA9C8]
    push push eax
    mov mov dword ptr [eax + 0249D0Ch], edx
    mov mov dword ptr [eax + 0249D10h], edx
    mov mov dword ptr [eax + 0249D14h], edx
    call sub_10033D82
    add add esp, 4
    call sub_10033B8A
    jmp sub_100210AF
FUN_10020d50 ENDP
END
