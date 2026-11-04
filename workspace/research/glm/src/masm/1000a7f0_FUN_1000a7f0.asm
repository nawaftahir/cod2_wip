.686
.MODEL FLAT, C
EXTRN g_101CE580:DWORD
EXTRN g_101D1B9C:DWORD
.CODE
FUN_1000a7f0 PROC
    mov eax, dword ptr [g_101D1B9C]
    test eax, eax
    mov dword ptr [g_101CE580], 0
    je L1
    mov edx, dword ptr [eax + 0000000FCh]
    xor ecx, ecx
    test edx, edx
    jle L1
    xor edx, edx
    push edi
L0:
    mov eax, dword ptr [eax + 000000100h]
    mov dword ptr [eax + edx + 56], 0
    mov eax, dword ptr [g_101D1B9C]
    mov edi, dword ptr [eax + 0000000FCh]
    inc ecx
    add edx, 60
    cmp ecx, edi
    jl L0
    pop edi
L1:
    ret
FUN_1000a7f0 ENDP
END
