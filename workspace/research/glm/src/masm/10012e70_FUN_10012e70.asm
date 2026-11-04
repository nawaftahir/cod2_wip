.686
.MODEL FLAT, C
EXTRN g_101CE644:DWORD
EXTRN g_101D4C6C:DWORD
EXTRN g_101D4C70:DWORD
EXTRN g_1072DDE8:DWORD
EXTRN g_1072DDEC:DWORD
EXTRN g_1072DE48:DWORD
EXTRN g_1072DEBE:DWORD
EXTRN g_10730554:DWORD
EXTRN g_10730558:DWORD
.CODE
FUN_10012e70 PROC
    mov edx, dword ptr [g_101CE644]
    push edi
    xor eax, eax
    mov ecx, 000000C68h
    mov edi, 0101D4D00h
    rep stosd dword ptr es:[edi], eax
    mov ecx, 00000043Ch
    mov edi, 0101D0B00h
    rep stosd dword ptr es:[edi], eax
    mov ecx, 00000DAD8h
    mov edi, 01072DA00h
    rep stosd dword ptr es:[edi], eax
    mov ecx, dword ptr [g_101D4C70]
    mov eax, 14
    mov dword ptr [g_10730554], eax
    mov dword ptr [g_10730558], eax
    mov eax, dword ptr [g_101D4C6C]
    mov dword ptr [g_1072DDEC], ecx
    mov dword ptr [g_1072DE48], 3
    mov dword ptr [g_1072DDE8], eax
    mov eax, dword ptr [edx + 8]
    mov cl, byte ptr [eax + 0101906B0h]
    mov byte ptr [g_1072DEBE], cl
    pop edi
    ret
FUN_10012e70 ENDP
END
