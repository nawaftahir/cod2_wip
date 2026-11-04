.686
.MODEL FLAT, C
EXTRN sub_10012215:PROC
EXTRN g_1010C1C8:DWORD
EXTRN g_1010C1E0:DWORD
EXTRN g_101D1BF4:DWORD
EXTRN g_101D1BF8:DWORD
EXTRN g_101D4938:DWORD
EXTRN g_1076A830:DWORD
.CODE
FUN_10012db0 PROC
    call sub_10012215
    mov eax, dword ptr [g_101D4938]
    test eax, eax
    je L2
    push esi
    mov esi, dword ptr [g_1010C1E0]
    push edi
    mov edi, dword ptr [g_1010C1C8]
    lea esp, [esp]
L0:
    dec eax
    mov dword ptr [g_101D4938], eax
    shl eax, 4
    mov eax, dword ptr [eax + 0101D493Ch]
    push eax
    call esi
    test eax, eax
    je L1
    mov ecx, dword ptr [g_101D4938]
    shl ecx, 4
    mov edx, dword ptr [ecx + 0101D493Ch]
    push edx
    call edi
L1:
    mov eax, dword ptr [g_101D4938]
    shl eax, 4
    mov dword ptr [eax + 0101D493Ch], 0
    mov eax, dword ptr [g_101D4938]
    test eax, eax
    jne L0
    pop edi
    pop esi
L2:
    mov eax, dword ptr [g_101D1BF8]
    test eax, eax
    je L4
    mov edi, edi
L3:
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx + 8]
    mov ecx, dword ptr [g_1076A830]
    xor eax, eax
    test ecx, ecx
    mov dword ptr [g_101D1BF8], eax
    jne L3
L4:
    mov eax, dword ptr [g_101D1BF4]
    test eax, eax
    je L6
L5:
    mov edx, dword ptr [eax]
    push eax
    call dword ptr [edx + 8]
    mov ecx, dword ptr [g_1076A830]
    xor eax, eax
    test ecx, ecx
    mov dword ptr [g_101D1BF4], eax
    jne L5
L6:
    ret
FUN_10012db0 ENDP
END
