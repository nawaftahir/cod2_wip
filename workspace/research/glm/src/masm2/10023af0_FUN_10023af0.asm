.686
.MODEL FLAT, C
EXTRN sub_10023B91:PROC
EXTRN sub_10023BC9:PROC
EXTRN sub_10023BF8:PROC
EXTRN EXTRN fp_101D49C8:DWORD:DWORD
EXTRN EXTRN g_101CE64C:DWORD:DWORD
EXTRN EXTRN g_101DA9C8:DWORD:DWORD
EXTRN EXTRN g_1067850C:DWORD:DWORD
EXTRN EXTRN g_1076A860:DWORD:DWORD
.CODE
FUN_10023af0 PROC
    mov mov eax, dword ptr [g_101CE64C]
    mov mov cl, byte ptr [eax + 8]
    test test cl, cl
    je sub_10023B91
    mov mov eax, dword ptr [g_1067850C]
    cmp cmp eax, 07FEh
    jae L1
    mov mov edx, dword ptr [g_101DA9C8]
    mov mov ecx, dword ptr [edx + 0A000Ch]
    cmp cmp ecx, 01FF8h
    jae L0
    inc inc ecx
    mov mov dword ptr [edx + 0A000Ch], ecx
    inc inc dword ptr [g_1067850C]
    ret ret
    mov mov edx, dword ptr [edx]
    cmp cmp dword ptr [g_1076A860], edx
    je sub_10023BC9
    push push 01FF8h
    push push 010196D6Ch
    push push 2
    mov mov dword ptr [g_1076A860], edx
    call dword ptr [fp_101D49C8]
    add add esp, 12
    or or eax, -1
    ret ret
    mov mov ecx, dword ptr [g_101DA9C8]
    mov mov eax, dword ptr [ecx]
    cmp cmp dword ptr [g_1076A860], eax
    je sub_10023BF8
    push push 07FEh
    push push 010196D44h
    push push 2
L1:
    mov mov dword ptr [g_1076A860], eax
    call dword ptr [fp_101D49C8]
    add add esp, 12
    or or eax, -1
    ret ret
FUN_10023af0 ENDP
END
