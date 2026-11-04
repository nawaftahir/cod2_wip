.686
.MODEL FLAT, C
EXTRN sub_10083F50:PROC
EXTRN fp_1010C07C:DWORD
EXTRN g_1010C04C:DWORD
EXTRN g_1010C050:DWORD
EXTRN g_1019F228:DWORD
EXTRN g_101AC960:DWORD
EXTRN g_101AC964:DWORD
.CODE
FUN_10083f22 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    cmp dword ptr [g_101AC964], 0
    jne L2
    cmp dword ptr [g_101AC960], 0
    jne L2
    push ebx
    push esi
    push edi
    mov esi, 01010F67Ch
    push esi
    call dword ptr [fp_1010C07C]
    test eax, eax
    mov ebx, dword ptr [g_1010C04C]
    mov edi, dword ptr [g_1010C050]
    je L0
    push esi
    call edi
    test eax, eax
    je L0
    push 0101100D0h
    push eax
    call ebx
    mov dword ptr [g_101AC964], eax
L0:
    mov esi, 0101100C4h
    push esi
    call dword ptr [fp_1010C07C]
    test eax, eax
    je L1
    push esi
    call edi
    test eax, eax
    je L1
    push 0101100D0h
    push eax
    call ebx
    mov dword ptr [g_101AC960], eax
L1:
    pop edi
    pop esi
    pop ebx
L2:
    cmp dword ptr [g_1019F228], -1
    jne L4
    push 4
    push 01019F228h
    push 0101100B4h
    push 4
    call sub_10083F50
    test eax, eax
    jne L3
    and dword ptr [g_1019F228], eax
L3:
    cmp dword ptr [g_1019F228], 0
    je L5
    mov dword ptr [g_1019F228], 1
L4:
    cmp dword ptr [g_1019F228], 0
    jne L7
L5:
    mov eax, dword ptr [g_101AC964]
    test eax, eax
    je L6
    push dword ptr [ebp + 8]
    call eax
    pop ecx
L6:
    mov eax, dword ptr [g_101AC960]
    test eax, eax
    je L7
    push dword ptr [ebp + 8]
    call eax
    pop ecx
L7:
    pop ebp
    ret 4
FUN_10083f22 ENDP
END
