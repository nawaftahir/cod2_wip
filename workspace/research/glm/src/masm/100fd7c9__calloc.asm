.686
.MODEL FLAT, C
EXTRN sub_100FB61C:PROC
EXTRN sub_100FC0C6:PROC
EXTRN sub_100FD8F5:PROC
EXTRN sub_100FD90A:PROC
EXTRN sub_100FD912:PROC
EXTRN sub_100FD925:PROC
EXTRN sub_101003B2:PROC
EXTRN sub_10101E22:PROC
EXTRN sub_10107F48:PROC
EXTRN fp_1010C130:DWORD
EXTRN g_101AE238:DWORD
EXTRN g_1076AC70:DWORD
EXTRN g_1076AC94:DWORD
EXTRN g_1076AC98:DWORD
.CODE
_calloc PROC
    push 16
    push 01017C9C0h
    call sub_100FB61C
    mov esi, dword ptr [ebp + 8]
    imul esi, dword ptr [ebp + 12]
    mov dword ptr [ebp - 32], esi
    test esi, esi
    jne L0
    inc esi
L0:
    xor edi, edi
    mov dword ptr [ebp - 28], edi
    cmp esi, -32
    ja L3
    cmp dword ptr [g_1076AC98], 3
    jne L1
    add esi, 15
    and esi, 0FFFFFFF0h
    mov dword ptr [ebp + 12], esi
    mov ebx, dword ptr [ebp - 32]
    cmp ebx, dword ptr [g_1076AC70]
    ja L1
    push 4
    call sub_100FC0C6
    pop ecx
    and dword ptr [ebp - 4], edi
    push ebx
    call sub_10101E22
    pop ecx
    mov dword ptr [ebp - 28], eax
    or dword ptr [ebp - 4], 0FFFFFFFFh
    call L4
    mov edi, dword ptr [ebp - 28]
    test edi, edi
    je L2
    push dword ptr [ebp - 32]
    push 0
    push edi
    call sub_101003B2
    add esp, 12
L1:
    test edi, edi
    jne sub_100FD8F5
L2:
    push esi
    push 8
    push dword ptr [g_1076AC94]
    call dword ptr [fp_1010C130]
    mov edi, eax
L3:
    test edi, edi
    jne sub_100FD90A
    cmp dword ptr [g_101AE238], edi
    je sub_100FD912
    push esi
    call sub_10107F48
    pop ecx
    test eax, eax
    jne L0
    jmp sub_100FD925
    mov esi, dword ptr [ebp + 12]
L4:
    push 4
_calloc ENDP
END
