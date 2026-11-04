.686
.MODEL FLAT, C
EXTRN sub_100FB61C:PROC
EXTRN sub_100FC0C6:PROC
EXTRN sub_100FD878:PROC
EXTRN sub_100FD880:PROC
EXTRN sub_100FD889:PROC
EXTRN sub_100FD8A9:PROC
EXTRN sub_100FD8D3:PROC
EXTRN sub_100FD8F5:PROC
EXTRN sub_100FD90A:PROC
EXTRN sub_100FD912:PROC
EXTRN sub_100FD925:PROC
EXTRN sub_101003B2:PROC
EXTRN sub_10101E22:PROC
EXTRN sub_10107F48:PROC
EXTRN EXTRN fp_1010C130:DWORD:DWORD
EXTRN EXTRN g_101AE238:DWORD:DWORD
EXTRN EXTRN g_1076AC70:DWORD:DWORD
EXTRN EXTRN g_1076AC94:DWORD:DWORD
EXTRN EXTRN g_1076AC98:DWORD:DWORD
.CODE
_calloc PROC
    push push 16
    push push 01017C9C0h
    call sub_100FB61C
    mov mov esi, dword ptr [ebp + 8]
    imul imul esi, dword ptr [ebp + 12]
    mov mov dword ptr [ebp - 32], esi
    test test esi, esi
    jne L0
    inc inc esi
    xor xor edi, edi
    mov mov dword ptr [ebp - 28], edi
    cmp cmp esi, -32
    ja sub_100FD878
    cmp cmp dword ptr [g_1076AC98], 3
    jne L1
    add add esi, 15
    and and esi, -16
    mov mov dword ptr [ebp + 12], esi
    mov mov ebx, dword ptr [ebp - 32]
    cmp cmp ebx, dword ptr [g_1076AC70]
    ja sub_100FD880
    push push 4
    call sub_100FC0C6
    pop pop ecx
    and and dword ptr [ebp - 4], edi
    push push ebx
    call sub_10101E22
    pop pop ecx
    mov mov dword ptr [ebp - 28], eax
    or or dword ptr [ebp - 4], -1
    call sub_100FD8D3
    mov mov edi, dword ptr [ebp - 28]
    test test edi, edi
    je sub_100FD8A9
    push push dword ptr [ebp - 32]
    push push 0
    push push edi
    call sub_101003B2
    add add esp, 12
    test test edi, edi
    jne sub_100FD8F5
    push push esi
    push push 8
    push push dword ptr [g_1076AC94]
    call dword ptr [fp_1010C130]
    mov mov edi, eax
    test test edi, edi
    jne sub_100FD90A
    cmp cmp dword ptr [g_101AE238], edi
    je sub_100FD912
    push push esi
    call sub_10107F48
    pop pop ecx
    test test eax, eax
    jne sub_100FD889
    jmp sub_100FD925
    mov mov esi, dword ptr [ebp + 12]
    push push 4
_calloc ENDP
END
