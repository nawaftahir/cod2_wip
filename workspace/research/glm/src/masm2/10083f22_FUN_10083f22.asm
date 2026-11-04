.686
.MODEL FLAT, C
EXTRN sub_10084046:PROC
EXTRN sub_1008404A:PROC
EXTRN sub_10084075:PROC
EXTRN sub_100840A0:PROC
EXTRN sub_100840A6:PROC
EXTRN sub_100840BE:PROC
EXTRN EXTRN fp_1010C07C:DWORD:DWORD
EXTRN EXTRN g_1010C04C:DWORD:DWORD
EXTRN EXTRN g_1010C050:DWORD:DWORD
EXTRN EXTRN g_1019F228:DWORD:DWORD
EXTRN EXTRN g_101AC960:DWORD:DWORD
EXTRN EXTRN g_101AC964:DWORD:DWORD
.CODE
FUN_10083f22 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    cmp cmp dword ptr [g_101AC964], 0
    jne L1
    cmp cmp dword ptr [g_101AC960], 0
    jne L4
    push push ebx
    push push esi
    push push edi
    mov mov esi, 01010F67Ch
    push push esi
    call dword ptr [fp_1010C07C]
    test test eax, eax
    mov mov ebx, dword ptr [g_1010C04C]
L0:
    mov mov edi, dword ptr [g_1010C050]
    je L2
    push push esi
    call call edi
    test test eax, eax
    je L3
    push push 0101100D0h
    push push eax
    call call ebx
    mov mov dword ptr [g_101AC964], eax
    mov mov esi, 0101100C4h
    push push esi
    call dword ptr [fp_1010C07C]
    test test eax, eax
    je L5
    push push esi
    call call edi
    test test eax, eax
    je L6
    push push 0101100D0h
    push push eax
    call call ebx
    mov mov dword ptr [g_101AC960], eax
    pop pop edi
    pop pop esi
    pop pop ebx
    cmp cmp dword ptr [g_1019F228], -1
    jne sub_10084046
    push push 4
    push push 01019F228h
    push push 0101100B4h
    push push 4
L4:
    call L0
    test test eax, eax
    jne sub_1008404A
    and and dword ptr [g_1019F228], eax
    cmp cmp dword ptr [g_1019F228], 0
    je sub_10084075
    mov mov dword ptr [g_1019F228], 1
    cmp cmp dword ptr [g_1019F228], 0
    jne sub_100840A6
    mov mov eax, dword ptr [g_101AC964]
    test test eax, eax
    je sub_100840A0
    push push dword ptr [ebp + 8]
    call call eax
    pop pop ecx
    mov mov eax, dword ptr [g_101AC960]
    test test eax, eax
    je sub_100840BE
    push push dword ptr [ebp + 8]
    call call eax
    pop pop ecx
    pop pop ebp
    ret ret 4
FUN_10083f22 ENDP
END
