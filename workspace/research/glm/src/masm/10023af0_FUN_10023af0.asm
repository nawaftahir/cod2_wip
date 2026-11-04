.686
.MODEL FLAT, C
EXTRN fp_101D49C8:DWORD
EXTRN g_101CE64C:DWORD
EXTRN g_101DA9C8:DWORD
EXTRN g_1067850C:DWORD
EXTRN g_1076A860:DWORD
.CODE
FUN_10023af0 PROC
    mov eax, dword ptr [g_101CE64C]
    mov cl, byte ptr [eax + 8]
    test cl, cl
    je L2
    mov eax, dword ptr [g_1067850C]
    cmp eax, 0000007FEh
    jae L1
    mov edx, dword ptr [g_101DA9C8]
    mov ecx, dword ptr [edx + 0000A000Ch]
    cmp ecx, 000001FF8h
    jae L0
    inc ecx
    mov dword ptr [edx + 0000A000Ch], ecx
    inc dword ptr [g_1067850C]
    ret
L0:
    mov edx, dword ptr [edx]
    cmp dword ptr [g_1076A860], edx
    je L2
    push 000001FF8h
    push 010196D6Ch
    push 2
    mov dword ptr [g_1076A860], edx
    call dword ptr [fp_101D49C8]
    add esp, 12
    or eax, 0FFFFFFFFh
    ret
L1:
    mov ecx, dword ptr [g_101DA9C8]
    mov eax, dword ptr [ecx]
    cmp dword ptr [g_1076A860], eax
    je L2
    push 0000007FEh
    push 010196D44h
    push 2
    mov dword ptr [g_1076A860], eax
    call dword ptr [fp_101D49C8]
    add esp, 12
L2:
    or eax, 0FFFFFFFFh
    ret
FUN_10023af0 ENDP
END
