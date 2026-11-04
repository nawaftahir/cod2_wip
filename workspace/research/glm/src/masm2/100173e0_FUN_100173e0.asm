.686
.MODEL FLAT, C
EXTRN sub_100171D4:PROC
EXTRN sub_10017374:PROC
EXTRN sub_1001738F:PROC
EXTRN sub_1001749E:PROC
EXTRN sub_100174A6:PROC
EXTRN sub_100174C0:PROC
EXTRN sub_1001C945:PROC
EXTRN EXTRN g_101CE79C:DWORD:DWORD
EXTRN EXTRN g_101D1B2C:DWORD:DWORD
EXTRN EXTRN g_101D1B30:DWORD:DWORD
EXTRN EXTRN g_101D1BE4:DWORD:DWORD
.CODE
FUN_100173e0 PROC
    push push ebx
    push push edi
    xor xor eax, eax
    mov mov ecx, 0A67h
    mov mov edi, 0101D7FC8h
    rep stosd rep stosd dword ptr es:[edi], eax
    call sub_1001C945
    mov mov ebx, 28
    mov mov edi, 01018E988h
    call sub_10017374
    mov mov eax, dword ptr [g_101CE79C]
    mov mov cl, byte ptr [eax + 8]
    test test cl, cl
    je L0
    mov mov ebx, 12
    mov mov edi, 01018EA68h
    call sub_1001738F
    call sub_100171D4
    mov mov eax, dword ptr [g_101D1B30]
    mov mov ecx, dword ptr [g_101D1B2C]
    mov mov edx, dword ptr [eax + 60]
    cmp cmp edx, dword ptr [ecx + 60]
    jne sub_1001749E
    mov mov edx, dword ptr [eax + 64]
    cmp cmp edx, dword ptr [ecx + 64]
    jne sub_100174A6
    mov mov edx, dword ptr [eax + 56]
    cmp cmp edx, dword ptr [ecx + 56]
    je sub_100174C0
    mov mov ecx, dword ptr [eax + 60]
    mov mov edx, dword ptr [ecx]
    mov mov dword ptr [g_101D1BE4], edx
    mov mov dword ptr [eax + 60], 0101D1BE4h
    pop pop edi
    pop pop ebx
    ret ret
FUN_100173e0 ENDP
END
