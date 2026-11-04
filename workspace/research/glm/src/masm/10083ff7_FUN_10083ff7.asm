.686
.MODEL FLAT, C
EXTRN sub_100F788F:PROC
EXTRN sub_100F7897:PROC
EXTRN sub_100F78AF:PROC
EXTRN sub_100F78BE:PROC
EXTRN sub_100F78C6:PROC
EXTRN g_1010C098:DWORD
EXTRN g_101AC968:DWORD
.CODE
FUN_10083ff7 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ebx
    xor ebx, ebx
    cmp dword ptr [g_101AC968], ebx
    jne L5
    push esi
    xor esi, esi
    push edi
    inc esi
    push ebx
    mov dword ptr [g_101AC968], esi
    mov dword ptr [ebp - 4], ebx
    call sub_100F788F
    push ebx
    mov edi, eax
    call sub_100F7897
    test edi, edi
    pop ecx
    pop ecx
    mov ebx, eax
    je L0
    test ebx, ebx
    je L0
    cmp edi, ebx
    jne L1
L0:
    mov dword ptr [ebp - 4], esi
L1:
    test edi, edi
    je L2
    push edi
    call sub_100F78AF
    pop ecx
L2:
    test ebx, ebx
    je L3
    cmp ebx, edi
    je L3
    push ebx
    call sub_100F78BE
    pop ecx
L3:
    push 0
    call sub_100F78C6
    cmp dword ptr [ebp - 4], 0
    pop ecx
    je L4
    mov esi, dword ptr [g_1010C098]
    push 0101101C8h
    call esi
    push 010110168h
    call esi
    push 010110110h
    call esi
    push 0101100E0h
    call esi
L4:
    pop edi
    pop esi
L5:
    pop ebx
    leave
    ret
FUN_10083ff7 ENDP
END
