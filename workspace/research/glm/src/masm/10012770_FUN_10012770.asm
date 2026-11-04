.686
.MODEL FLAT, C
EXTRN fp_1010C1CC:DWORD
EXTRN fp_1010C1D0:DWORD
EXTRN g_101CE60C:DWORD
EXTRN g_101CE610:DWORD
EXTRN g_101CE66C:DWORD
EXTRN g_101CE6CC:DWORD
.CODE
FUN_10012770 PROC
    mov eax, dword ptr [g_101CE60C]
    mov cl, byte ptr [eax + 8]
    sub esp, 8
    test cl, cl
    je L0
    mov ecx, dword ptr [g_101CE610]
    mov edx, dword ptr [ecx + 8]
    lea eax, [esp]
    push eax
    push 010012750h
    push 0
    push 0
    mov dword ptr [esp + 16], edx
    mov dword ptr [esp + 20], 0
    call dword ptr [fp_1010C1CC]
    mov eax, dword ptr [esp + 4]
    test eax, eax
    jne L1
L0:
    mov ecx, dword ptr [g_101CE6CC]
    mov eax, dword ptr [ecx + 8]
    mov edx, dword ptr [g_101CE66C]
    mov ecx, dword ptr [edx + 8]
    push 1
    push ecx
    push eax
    call dword ptr [fp_1010C1D0]
L1:
    add esp, 8
    ret
FUN_10012770 ENDP
END
