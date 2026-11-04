.686
.MODEL FLAT, C
EXTRN sub_100F859C:PROC
EXTRN sub_100FB553:PROC
EXTRN sub_100FB5BC:PROC
EXTRN sub_100FB61C:PROC
EXTRN sub_100FB760:PROC
EXTRN sub_100FC031:PROC
EXTRN sub_100FC097:PROC
EXTRN sub_100FC4C2:PROC
EXTRN sub_100FC4F9:PROC
EXTRN sub_10107B1F:PROC
EXTRN fp_1010C030:DWORD
EXTRN g_1076ADB8:DWORD
EXTRN g_1076BDC0:DWORD
.CODE
__getstream PROC
    push 16
    push 01017C8C0h
    call sub_100FB61C
    xor ebx, ebx
    xor edi, edi
    mov dword ptr [ebp - 28], edi
    push 1
    call sub_100FC097
    pop ecx
    mov dword ptr [ebp - 4], ebx
    xor esi, esi
L0:
    mov dword ptr [ebp - 32], esi
    cmp esi, dword ptr [g_1076BDC0]
    jge L7
    mov eax, dword ptr [g_1076ADB8]
    mov eax, dword ptr [eax + esi*4]
    cmp eax, ebx
    je L4
    test byte ptr [eax + 12], 000000083h
    jne L2
    cmp esi, 2
    jle L1
    cmp esi, 20
    jge L1
    lea eax, [esi + 16]
    push eax
    call sub_100FC031
    pop ecx
    test eax, eax
    je L7
L1:
    mov eax, dword ptr [g_1076ADB8]
    push dword ptr [eax + esi*4]
    push esi
    call sub_100FB553
    pop ecx
    pop ecx
    mov eax, dword ptr [g_1076ADB8]
    mov eax, dword ptr [eax + esi*4]
    test byte ptr [eax + 12], 000000083h
    je L3
    push eax
    push esi
    call sub_100FB5BC
    pop ecx
    pop ecx
L2:
    inc esi
    jmp L0
L3:
    mov edi, eax
    jmp L6
L4:
    shl esi, 2
    push 56
    call sub_100FC4F9
    pop ecx
    mov ecx, dword ptr [g_1076ADB8]
    mov dword ptr [esi + ecx], eax
    mov eax, dword ptr [g_1076ADB8]
    mov eax, dword ptr [esi + eax]
    cmp eax, ebx
    je L7
    push 000000FA0h
    add eax, 32
    push eax
    call sub_10107B1F
    pop ecx
    pop ecx
    test eax, eax
    mov eax, dword ptr [g_1076ADB8]
    jne L5
    push dword ptr [esi + eax]
    call sub_100F859C
    pop ecx
    mov eax, dword ptr [g_1076ADB8]
    mov dword ptr [esi + eax], ebx
    jmp L7
L5:
    mov eax, dword ptr [esi + eax]
    add eax, 32
    push eax
    call dword ptr [fp_1010C030]
    mov eax, dword ptr [g_1076ADB8]
    mov edi, dword ptr [esi + eax]
L6:
    mov dword ptr [ebp - 28], edi
L7:
    cmp edi, ebx
    je L8
    mov dword ptr [edi + 4], ebx
    mov dword ptr [edi + 12], ebx
    mov dword ptr [edi + 8], ebx
    mov dword ptr [edi], ebx
    mov dword ptr [edi + 28], ebx
    or dword ptr [edi + 16], 0FFFFFFFFh
L8:
    or dword ptr [ebp - 4], 0FFFFFFFFh
    call sub_100FC4C2
    mov eax, edi
    call sub_100FB760
    ret
__getstream ENDP
END
