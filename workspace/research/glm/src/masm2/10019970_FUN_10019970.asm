.686
.MODEL FLAT, C
EXTRN sub_10019AF0:PROC
EXTRN sub_10019AF8:PROC
EXTRN sub_10019AFD:PROC
EXTRN sub_10019B18:PROC
EXTRN sub_10019B31:PROC
EXTRN sub_1005F3CE:PROC
EXTRN sub_1005F436:PROC
EXTRN sub_1005F444:PROC
EXTRN sub_1005F467:PROC
EXTRN sub_1005F6D5:PROC
EXTRN sub_1005FBA0:PROC
EXTRN sub_1005FBDC:PROC
EXTRN sub_1005FFBB:PROC
EXTRN sub_1005FFEE:PROC
EXTRN EXTRN g_101AAC70:DWORD:DWORD
.CODE
FUN_10019970 PROC
    mov mov eax, dword ptr [g_101AAC70]
    imul imul eax, eax, 045Ch
    add add eax, 0101A66B0h
    mov mov cl, byte ptr [eax + 0404h]
    test test cl, cl
    push push ebp
    mov mov ebp, dword ptr [esp + 8]
    je L0
    mov mov ecx, dword ptr [eax + 0418h]
    mov mov byte ptr [eax + 0404h], 0
    mov mov dword ptr [edi], ecx
    mov mov edx, dword ptr [eax + 0414h]
    mov mov dword ptr [eax + 0400h], edx
    push push edi
    mov mov eax, 1
    call sub_1005F6D5
    mov mov cl, byte ptr [eax]
    add add esp, 4
    cmp cmp cl, 91
    je L1
    call sub_1005F444
    movzx movzx eax, byte ptr [ebp + 5]
    mov mov ecx, dword ptr [ebx + 12]
    cmp cmp eax, ecx
    jle L2
    push push eax
    mov mov eax, dword ptr [ebx]
    push push ecx
    push push eax
    push push 0101954E0h
    call sub_1005F3CE
    add add esp, 16
    xor xor al, al
    pop pop ebp
    ret ret
    mov mov ecx, dword ptr [esp + 12]
    mov mov dword ptr [ecx], 0
    mov mov al, 1
    pop pop ebp
    ret ret
    push push esi
    mov mov ecx, edi
    call sub_1005FFBB
    mov mov esi, eax
    test test esi, esi
    jl sub_10019AF8
    cmp cmp esi, dword ptr [ebx + 12]
    jge sub_10019AFD
    mov mov edx, dword ptr [esp + 16]
    mov mov dword ptr [edx], esi
    cmp cmp byte ptr [ebp + 5], 1
    jbe sub_10019AF0
    push push 1
    push push 01019581Ch
    mov mov ecx, edi
    call sub_1005FBA0
    add add esp, 8
    test test eax, eax
    je sub_10019B31
    mov mov ecx, edi
    call sub_1005FFEE
    movzx movzx ecx, byte ptr [ebp + 5]
    lea lea ecx, [ecx + esi - 1]
    cmp cmp eax, ecx
    je sub_10019B18
    push push ecx
    push push eax
    push push 010195490h
    call sub_1005F436
    add add esp, 12
    pop pop esi
    xor xor al, al
    pop pop ebp
    ret ret
    push push 1
    push push 0101958A8h
    mov mov ecx, edi
    call sub_1005FBDC
    add add esp, 8
    test test eax, eax
    pop pop esi
    setne setne al
    pop pop ebp
    ret ret
    mov mov edx, dword ptr [ebx + 12]
    dec dec edx
    push push edx
    push push esi
    push push 0101954B8h
    call sub_1005F467
    add add esp, 12
    pop pop esi
    xor xor al, al
    pop pop ebp
    ret ret
FUN_10019970 ENDP
END
