.686
.MODEL FLAT, C
EXTRN sub_10012215:PROC
EXTRN sub_10012EA5:PROC
EXTRN sub_10012EA7:PROC
EXTRN sub_10012EE7:PROC
EXTRN EXTRN g_1010C1C8:DWORD:DWORD
EXTRN EXTRN g_1010C1E0:DWORD:DWORD
EXTRN EXTRN g_101D1BF4:DWORD:DWORD
EXTRN EXTRN g_101D1BF8:DWORD:DWORD
EXTRN EXTRN g_101D4938:DWORD:DWORD
EXTRN EXTRN g_1076A830:DWORD:DWORD
.CODE
FUN_10012db0 PROC
    call sub_10012215
    mov mov eax, dword ptr [g_101D4938]
    test test eax, eax
    je L0
    push push esi
    mov mov esi, dword ptr [g_1010C1E0]
    push push edi
    mov mov edi, dword ptr [g_1010C1C8]
    lea lea esp, [esp]
    dec dec eax
    mov mov dword ptr [g_101D4938], eax
    shl shl eax, 4
    mov mov eax, dword ptr [eax + 0101D493Ch]
    push push eax
    call call esi
    test test eax, eax
    je L1
    mov mov ecx, dword ptr [g_101D4938]
    shl shl ecx, 4
    mov mov edx, dword ptr [ecx + 0101D493Ch]
    push push edx
    call call edi
    mov mov eax, dword ptr [g_101D4938]
    shl shl eax, 4
    mov mov dword ptr [eax + 0101D493Ch], 0
    mov mov eax, dword ptr [g_101D4938]
    test test eax, eax
    jne L2
    pop pop edi
    pop pop esi
    mov mov eax, dword ptr [g_101D1BF8]
    test test eax, eax
    je sub_10012EA5
    mov mov edi, edi
    mov mov ecx, dword ptr [eax]
    push push eax
L0:
    call call dword ptr [ecx + 8]
    mov mov ecx, dword ptr [g_1076A830]
    xor xor eax, eax
L1:
    test test ecx, ecx
    mov mov dword ptr [g_101D1BF8], eax
    jne sub_10012EA7
    mov mov eax, dword ptr [g_101D1BF4]
    test test eax, eax
    je sub_10012EE7
    mov mov edx, dword ptr [eax]
    push push eax
    call call dword ptr [edx + 8]
    mov mov ecx, dword ptr [g_1076A830]
    xor xor eax, eax
    test test ecx, ecx
    mov mov dword ptr [g_101D1BF4], eax
    jne sub_10012EE7
    ret ret
FUN_10012db0 ENDP
END
