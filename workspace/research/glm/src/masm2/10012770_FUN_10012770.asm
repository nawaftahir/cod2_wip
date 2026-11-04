.686
.MODEL FLAT, C
EXTRN sub_1001280A:PROC
EXTRN EXTRN fp_1010C1CC:DWORD:DWORD
EXTRN EXTRN fp_1010C1D0:DWORD:DWORD
EXTRN EXTRN g_101CE60C:DWORD:DWORD
EXTRN EXTRN g_101CE610:DWORD:DWORD
EXTRN EXTRN g_101CE66C:DWORD:DWORD
EXTRN EXTRN g_101CE6CC:DWORD:DWORD
.CODE
FUN_10012770 PROC
    mov mov eax, dword ptr [g_101CE60C]
    mov mov cl, byte ptr [eax + 8]
    sub sub esp, 8
    test test cl, cl
    je L0
    mov mov ecx, dword ptr [g_101CE610]
    mov mov edx, dword ptr [ecx + 8]
    lea lea eax, [esp]
    push push eax
    push push 010012750h
    push push 0
    push push 0
    mov mov dword ptr [esp + 16], edx
    mov mov dword ptr [esp + 20], 0
    call dword ptr [fp_1010C1CC]
    mov mov eax, dword ptr [esp + 4]
    test test eax, eax
    jne sub_1001280A
    mov mov ecx, dword ptr [g_101CE6CC]
    mov mov eax, dword ptr [ecx + 8]
    mov mov edx, dword ptr [g_101CE66C]
L0:
    mov mov ecx, dword ptr [edx + 8]
    push push 1
    push push ecx
    push push eax
    call dword ptr [fp_1010C1D0]
    add add esp, 8
    ret ret
FUN_10012770 ENDP
END
