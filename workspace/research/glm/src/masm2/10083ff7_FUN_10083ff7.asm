.686
.MODEL FLAT, C
EXTRN sub_10084086:PROC
EXTRN sub_10084094:PROC
EXTRN sub_100840A0:PROC
EXTRN sub_100840A4:PROC
EXTRN sub_100840E9:PROC
EXTRN sub_100F788F:PROC
EXTRN sub_100F7897:PROC
EXTRN sub_100F78AF:PROC
EXTRN sub_100F78BE:PROC
EXTRN sub_100F78C6:PROC
EXTRN EXTRN g_1010C098:DWORD:DWORD
EXTRN EXTRN g_101AC968:DWORD:DWORD
.CODE
FUN_10083ff7 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push ecx
    push push ebx
    xor xor ebx, ebx
    cmp cmp dword ptr [g_101AC968], ebx
    jne sub_10084094
    push push esi
    xor xor esi, esi
    push push edi
    inc inc esi
    push push ebx
    mov mov dword ptr [g_101AC968], esi
    mov mov dword ptr [ebp - 4], ebx
    call sub_100F788F
    push push ebx
    mov mov edi, eax
    call sub_100F7897
    test test edi, edi
    pop pop ecx
    pop pop ecx
    mov mov ebx, eax
    je L0
    test test ebx, ebx
    je L1
    cmp cmp edi, ebx
    jne L2
    mov mov dword ptr [ebp - 4], esi
    test test edi, edi
    je sub_10084086
    push push edi
    call sub_100F78AF
    pop pop ecx
    test test ebx, ebx
    je sub_100840A0
    cmp cmp ebx, edi
    je sub_100840A4
    push push ebx
    call sub_100F78BE
    pop pop ecx
    push push 0
    call sub_100F78C6
    cmp cmp dword ptr [ebp - 4], 0
    pop pop ecx
    je sub_100840E9
    mov mov esi, dword ptr [g_1010C098]
    push push 0101101C8h
    call call esi
    push push 010110168h
    call call esi
    push push 010110110h
    call call esi
    push push 0101100E0h
    call call esi
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret
FUN_10083ff7 ENDP
END
