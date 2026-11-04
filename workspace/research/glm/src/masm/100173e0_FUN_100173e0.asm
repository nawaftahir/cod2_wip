.686
.MODEL FLAT, C
EXTRN sub_100171D4:PROC
EXTRN sub_10017374:PROC
EXTRN sub_1001738F:PROC
EXTRN sub_1001C945:PROC
EXTRN g_101CE79C:DWORD
EXTRN g_101D1B2C:DWORD
EXTRN g_101D1B30:DWORD
EXTRN g_101D1BE4:DWORD
.CODE
FUN_100173e0 PROC
    push ebx
    push edi
    xor eax, eax
    mov ecx, 000000A67h
    mov edi, 0101D7FC8h
    rep stosd dword ptr es:[edi], eax
    call sub_1001C945
    mov ebx, 28
    mov edi, 01018E988h
    call sub_10017374
    mov eax, dword ptr [g_101CE79C]
    mov cl, byte ptr [eax + 8]
    test cl, cl
    je L0
    mov ebx, 12
    mov edi, 01018EA68h
    call sub_1001738F
L0:
    call sub_100171D4
    mov eax, dword ptr [g_101D1B30]
    mov ecx, dword ptr [g_101D1B2C]
    mov edx, dword ptr [eax + 60]
    cmp edx, dword ptr [ecx + 60]
    jne L1
    mov edx, dword ptr [eax + 64]
    cmp edx, dword ptr [ecx + 64]
    jne L1
    mov edx, dword ptr [eax + 56]
    cmp edx, dword ptr [ecx + 56]
    je L2
L1:
    mov ecx, dword ptr [eax + 60]
    mov edx, dword ptr [ecx]
    mov dword ptr [g_101D1BE4], edx
    mov dword ptr [eax + 60], 0101D1BE4h
L2:
    pop edi
    pop ebx
    ret
FUN_100173e0 ENDP
END
