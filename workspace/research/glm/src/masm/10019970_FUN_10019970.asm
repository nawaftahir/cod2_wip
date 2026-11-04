.686
.MODEL FLAT, C
EXTRN sub_1005F3CE:PROC
EXTRN sub_1005F436:PROC
EXTRN sub_1005F444:PROC
EXTRN sub_1005F467:PROC
EXTRN sub_1005F6D5:PROC
EXTRN sub_1005FBA0:PROC
EXTRN sub_1005FBDC:PROC
EXTRN sub_1005FFBB:PROC
EXTRN sub_1005FFEE:PROC
EXTRN g_101AAC70:DWORD
.CODE
FUN_10019970 PROC
    mov eax, dword ptr [g_101AAC70]
    imul eax, eax, 00000045Ch
    add eax, 0101A66B0h
    mov cl, byte ptr [eax + 000000404h]
    test cl, cl
    push ebp
    mov ebp, dword ptr [esp + 8]
    je L0
    mov ecx, dword ptr [eax + 000000418h]
    mov byte ptr [eax + 000000404h], 0
    mov dword ptr [edi], ecx
    mov edx, dword ptr [eax + 000000414h]
    mov dword ptr [eax + 000000400h], edx
L0:
    push edi
    mov eax, 1
    call sub_1005F6D5
    mov cl, byte ptr [eax]
    add esp, 4
    cmp cl, 91
    je L2
    call sub_1005F444
    movzx eax, byte ptr [ebp + 5]
    mov ecx, dword ptr [ebx + 12]
    cmp eax, ecx
    jle L1
    push eax
    mov eax, dword ptr [ebx]
    push ecx
    push eax
    push 0101954E0h
    call sub_1005F3CE
    add esp, 16
    xor al, al
    pop ebp
    ret
L1:
    mov ecx, dword ptr [esp + 12]
    mov dword ptr [ecx], 0
    mov al, 1
    pop ebp
    ret
L2:
    push esi
    mov ecx, edi
    call sub_1005FFBB
    mov esi, eax
    test esi, esi
    jl L4
    cmp esi, dword ptr [ebx + 12]
    jge L4
    mov edx, dword ptr [esp + 16]
    mov dword ptr [edx], esi
    cmp byte ptr [ebp + 5], 1
    jbe L3
    push 1
    push 01019581Ch
    mov ecx, edi
    call sub_1005FBA0
    add esp, 8
    test eax, eax
    je L5
    mov ecx, edi
    call sub_1005FFEE
    movzx ecx, byte ptr [ebp + 5]
    lea ecx, [ecx + esi - 1]
    cmp eax, ecx
    je L3
    push ecx
    push eax
    push 010195490h
    call sub_1005F436
    add esp, 12
    pop esi
    xor al, al
    pop ebp
    ret
L3:
    push 1
    push 0101958A8h
    mov ecx, edi
    call sub_1005FBDC
    add esp, 8
    test eax, eax
    pop esi
    setne al
    pop ebp
    ret
L4:
    mov edx, dword ptr [ebx + 12]
    dec edx
    push edx
    push esi
    push 0101954B8h
    call sub_1005F467
    add esp, 12
L5:
    pop esi
    xor al, al
    pop ebp
    ret
FUN_10019970 ENDP
END
