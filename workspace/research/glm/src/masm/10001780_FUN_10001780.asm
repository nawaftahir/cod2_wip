.686
.MODEL FLAT, C
EXTRN g_101D1B9C:DWORD
EXTRN g_1076A830:DWORD
.CODE
FUN_10001780 PROC
    mov eax, dword ptr [g_101D1B9C]
    mov eax, dword ptr [eax + 48]
    test eax, eax
    je L1
    lea esp, [esp]
L0:
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx + 8]
    mov ecx, dword ptr [g_1076A830]
    xor eax, eax
    test ecx, ecx
    jne L0
    mov edx, dword ptr [g_101D1B9C]
    mov dword ptr [edx + 48], eax
L1:
    ret
FUN_10001780 ENDP
END
