.686
.MODEL FLAT, C
EXTRN sub_100F859C:PROC
EXTRN sub_100FB553:PROC
EXTRN sub_100FB5BC:PROC
EXTRN sub_100FB61C:PROC
EXTRN sub_100FB760:PROC
EXTRN sub_100FC031:PROC
EXTRN sub_100FC097:PROC
EXTRN sub_100FC3B9:PROC
EXTRN sub_100FC3E7:PROC
EXTRN sub_100FC412:PROC
EXTRN sub_100FC435:PROC
EXTRN sub_100FC436:PROC
EXTRN sub_100FC461:PROC
EXTRN sub_100FC493:PROC
EXTRN sub_100FC4C2:PROC
EXTRN sub_100FC4F9:PROC
EXTRN sub_10107B1F:PROC
EXTRN EXTRN fp_1010C030:DWORD:DWORD
EXTRN EXTRN g_1076ADB8:DWORD:DWORD
EXTRN EXTRN g_1076BDC0:DWORD:DWORD
.CODE
__getstream PROC
    push push 16
    push push 01017C8C0h
    call sub_100FB61C
    xor xor ebx, ebx
    xor xor edi, edi
    mov mov dword ptr [ebp - 28], edi
    push push 1
    call sub_100FC097
    pop pop ecx
    mov mov dword ptr [ebp - 4], ebx
    xor xor esi, esi
    mov mov dword ptr [ebp - 32], esi
    cmp cmp esi, dword ptr [g_1076BDC0]
    jge sub_100FC3B9
    mov mov eax, dword ptr [g_1076ADB8]
    mov mov eax, dword ptr [eax + esi*4]
    cmp cmp eax, ebx
    je L4
    test test byte ptr [eax + 12], 083h
    jne L3
    cmp cmp esi, 2
    jle L0
    cmp cmp esi, 20
    jge L2
    lea lea eax, [esi + 16]
    push push eax
    call sub_100FC031
    pop pop ecx
    test test eax, eax
    je sub_100FC3E7
    mov mov eax, dword ptr [g_1076ADB8]
    push push dword ptr [eax + esi*4]
    push push esi
    call sub_100FB553
    pop pop ecx
    pop pop ecx
    mov mov eax, dword ptr [g_1076ADB8]
    mov mov eax, dword ptr [eax + esi*4]
    test test byte ptr [eax + 12], 083h
    je L5
    push push eax
    push push esi
    call sub_100FB5BC
    pop pop ecx
    pop pop ecx
    inc inc esi
    jmp L1
    mov mov edi, eax
    jmp sub_100FC412
    shl shl esi, 2
    push push 56
    call sub_100FC4F9
    pop pop ecx
    mov mov ecx, dword ptr [g_1076ADB8]
    mov mov dword ptr [esi + ecx], eax
    mov mov eax, dword ptr [g_1076ADB8]
    mov mov eax, dword ptr [esi + eax]
L1:
    cmp cmp eax, ebx
    je sub_100FC435
    push push 0FA0h
    add add eax, 32
    push push eax
    call sub_10107B1F
    pop pop ecx
    pop pop ecx
    test test eax, eax
    mov mov eax, dword ptr [g_1076ADB8]
    jne sub_100FC436
    push push dword ptr [esi + eax]
    call sub_100F859C
    pop pop ecx
    mov mov eax, dword ptr [g_1076ADB8]
    mov mov dword ptr [esi + eax], ebx
    jmp sub_100FC461
    mov mov eax, dword ptr [esi + eax]
    add add eax, 32
    push push eax
    call dword ptr [fp_1010C030]
    mov mov eax, dword ptr [g_1076ADB8]
    mov mov edi, dword ptr [esi + eax]
    mov mov dword ptr [ebp - 28], edi
    cmp cmp edi, ebx
    je sub_100FC493
    mov mov dword ptr [edi + 4], ebx
    mov mov dword ptr [edi + 12], ebx
    mov mov dword ptr [edi + 8], ebx
    mov mov dword ptr [edi], ebx
    mov mov dword ptr [edi + 28], ebx
    or or dword ptr [edi + 16], -1
    or or dword ptr [ebp - 4], -1
    call sub_100FC4C2
    mov mov eax, edi
    call sub_100FB760
    ret ret
__getstream ENDP
END
