.686
.MODEL FLAT, C
EXTRN EXTRN g_101CE644:DWORD:DWORD
EXTRN EXTRN g_101D4C6C:DWORD:DWORD
EXTRN EXTRN g_101D4C70:DWORD:DWORD
EXTRN EXTRN g_1072DDE8:DWORD:DWORD
EXTRN EXTRN g_1072DDEC:DWORD:DWORD
EXTRN EXTRN g_1072DE48:DWORD:DWORD
EXTRN EXTRN g_1072DEBE:DWORD:DWORD
EXTRN EXTRN g_10730554:DWORD:DWORD
EXTRN EXTRN g_10730558:DWORD:DWORD
.CODE
FUN_10012e70 PROC
    mov mov edx, dword ptr [g_101CE644]
    push push edi
    xor xor eax, eax
    mov mov ecx, 0C68h
    mov mov edi, 0101D4D00h
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov ecx, 043Ch
    mov mov edi, 0101D0B00h
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov ecx, 0DAD8h
    mov mov edi, 01072DA00h
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov ecx, dword ptr [g_101D4C70]
    mov mov eax, 14
    mov mov dword ptr [g_10730554], eax
    mov mov dword ptr [g_10730558], eax
    mov mov eax, dword ptr [g_101D4C6C]
    mov mov dword ptr [g_1072DDEC], ecx
    mov mov dword ptr [g_1072DE48], 3
    mov mov dword ptr [g_1072DDE8], eax
    mov mov eax, dword ptr [edx + 8]
    mov mov cl, byte ptr [eax + 0101906B0h]
    mov mov byte ptr [g_1072DEBE], cl
    pop pop edi
    ret ret
FUN_10012e70 ENDP
END
