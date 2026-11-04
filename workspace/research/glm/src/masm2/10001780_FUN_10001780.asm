.686
.MODEL FLAT, C
EXTRN sub_100017B2:PROC
EXTRN sub_100017B7:PROC
EXTRN EXTRN g_101D1B9C:DWORD:DWORD
EXTRN EXTRN g_1076A830:DWORD:DWORD
.CODE
FUN_10001780 PROC
    mov mov eax, dword ptr [g_101D1B9C]
    mov mov eax, dword ptr [eax + 48]
    test test eax, eax
    je sub_100017B7
    lea lea esp, [esp]
    mov mov ecx, dword ptr [eax]
    push push eax
    call call dword ptr [ecx + 8]
    mov mov ecx, dword ptr [g_1076A830]
    xor xor eax, eax
    test test ecx, ecx
    jne sub_100017B2
    mov mov edx, dword ptr [g_101D1B9C]
    mov mov dword ptr [edx + 48], eax
    ret ret
FUN_10001780 ENDP
END
