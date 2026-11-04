.686
.MODEL FLAT, C
EXTRN sub_100FB61C:PROC
EXTRN sub_100FC090:PROC
EXTRN sub_100FD68E:PROC
EXTRN sub_100FD6A3:PROC
EXTRN sub_100FD6B3:PROC
EXTRN sub_100FD81F:PROC
EXTRN sub_100FD836:PROC
EXTRN fp_1010C148:DWORD
EXTRN fp_1010C14C:DWORD
EXTRN g_101AE044:DWORD
EXTRN g_101AE048:DWORD
EXTRN g_101AE04C:DWORD
EXTRN g_1076ADA4:DWORD
EXTRN g_1076ADA8:DWORD
.CODE
doexit PROC
    push 8
    push 01017C9B0h
    call sub_100FB61C
    push 8
    call sub_100FC090
    pop ecx
    xor edi, edi
    mov dword ptr [ebp - 4], edi
    xor esi, esi
    inc esi
    cmp dword ptr [g_101AE04C], esi
    jne L0
    push dword ptr [ebp + 8]
    call dword ptr [fp_1010C14C]
    push eax
    call dword ptr [fp_1010C148]
L0:
    mov dword ptr [g_101AE048], esi
    mov al, byte ptr [ebp + 16]
    mov byte ptr [g_101AE044], al
    cmp dword ptr [ebp + 12], edi
    jne L3
    cmp dword ptr [g_1076ADA8], edi
    je L2
L1:
    mov eax, dword ptr [g_1076ADA4]
    sub eax, 4
    mov dword ptr [g_1076ADA4], eax
    cmp eax, dword ptr [g_1076ADA8]
    jb L2
    mov eax, dword ptr [eax]
    cmp eax, edi
    je L1
    call eax
    jmp L1
L2:
    push 01019E02Ch
    mov eax, 01019E024h
    call sub_100FD6A3
    pop ecx
L3:
    push 01019E034h
    mov eax, 01019E030h
    call sub_100FD6B3
    pop ecx
    or dword ptr [ebp - 4], 0FFFFFFFFh
    call L4
    cmp dword ptr [ebp + 16], edi
    jne sub_100FD81F
    mov dword ptr [g_101AE04C], esi
    push dword ptr [ebp + 8]
    call sub_100FD68E
    xor edi, edi
    xor esi, esi
    inc esi
L4:
    cmp dword ptr [ebp + 16], edi
    je sub_100FD836
doexit ENDP
END
