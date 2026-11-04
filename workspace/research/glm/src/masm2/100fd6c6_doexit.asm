.686
.MODEL FLAT, C
EXTRN sub_100FB61C:PROC
EXTRN sub_100FC090:PROC
EXTRN sub_100FD68E:PROC
EXTRN sub_100FD6A3:PROC
EXTRN sub_100FD6B3:PROC
EXTRN sub_100FD77F:PROC
EXTRN sub_100FD783:PROC
EXTRN sub_100FD78B:PROC
EXTRN sub_100FD798:PROC
EXTRN sub_100FD80C:PROC
EXTRN sub_100FD81F:PROC
EXTRN sub_100FD836:PROC
EXTRN EXTRN fp_1010C148:DWORD:DWORD
EXTRN EXTRN fp_1010C14C:DWORD:DWORD
EXTRN EXTRN g_101AE044:DWORD:DWORD
EXTRN EXTRN g_101AE048:DWORD:DWORD
EXTRN EXTRN g_101AE04C:DWORD:DWORD
EXTRN EXTRN g_1076ADA4:DWORD:DWORD
EXTRN EXTRN g_1076ADA8:DWORD:DWORD
.CODE
doexit PROC
    push push 8
    push push 01017C9B0h
    call sub_100FB61C
    push push 8
    call sub_100FC090
    pop pop ecx
    xor xor edi, edi
    mov mov dword ptr [ebp - 4], edi
    xor xor esi, esi
    inc inc esi
    cmp cmp dword ptr [g_101AE04C], esi
    jne L0
    push push dword ptr [ebp + 8]
    call dword ptr [fp_1010C14C]
    push push eax
    call dword ptr [fp_1010C148]
    mov mov dword ptr [g_101AE048], esi
    mov mov al, byte ptr [ebp + 16]
    mov mov byte ptr [g_101AE044], al
    cmp cmp dword ptr [ebp + 12], edi
    jne sub_100FD78B
    cmp cmp dword ptr [g_1076ADA8], edi
    je sub_100FD783
    mov mov eax, dword ptr [g_1076ADA4]
    sub sub eax, 4
    mov mov dword ptr [g_1076ADA4], eax
    cmp cmp eax, dword ptr [g_1076ADA8]
    jb sub_100FD798
    mov mov eax, dword ptr [eax]
    cmp cmp eax, edi
    je sub_100FD77F
    call call eax
    jmp sub_100FD783
    push push 01019E02Ch
    mov mov eax, 01019E024h
    call sub_100FD6A3
    pop pop ecx
    push push 01019E034h
    mov mov eax, 01019E030h
    call sub_100FD6B3
    pop pop ecx
    or or dword ptr [ebp - 4], -1
    call sub_100FD80C
    cmp cmp dword ptr [ebp + 16], edi
    jne sub_100FD81F
    mov mov dword ptr [g_101AE04C], esi
    push push dword ptr [ebp + 8]
    call sub_100FD68E
    xor xor edi, edi
    xor xor esi, esi
    inc inc esi
    cmp cmp dword ptr [ebp + 16], edi
    je sub_100FD836
doexit ENDP
END
