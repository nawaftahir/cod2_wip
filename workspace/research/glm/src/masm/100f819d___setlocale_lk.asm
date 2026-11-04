.686
.MODEL FLAT, C
EXTRN sub_100F5EF1:PROC
EXTRN sub_100F7E29:PROC
EXTRN sub_100F7EA3:PROC
EXTRN sub_100F7F0D:PROC
EXTRN sub_100F7F38:PROC
EXTRN sub_100F801D:PROC
EXTRN sub_100F8099:PROC
EXTRN sub_100F868D:PROC
EXTRN sub_100FA2C1:PROC
EXTRN sub_101003D1:PROC
EXTRN sub_1010051C:PROC
EXTRN sub_10100E92:PROC
EXTRN sub_10101093:PROC
EXTRN sub_10101099:PROC
EXTRN g_101A47C4:DWORD
EXTRN g_101A50D0:DWORD
.CODE
__setlocale_lk PROC
    push ebp
    lea ebp, [esp - 120]
    sub esp, 000000094h
    mov eax, dword ptr [g_101A50D0]
    push ebx
    push esi
    mov esi, edx
    xor ebx, ebx
    cmp esi, ebx
    push edi
    mov dword ptr [ebp + 116], eax
    mov edi, ecx
    je L1
    cmp edi, ebx
    je L0
    push edi
    call sub_100F7F38
    pop ecx
    jmp L11
L0:
    lea eax, [esi + esi*2]
    mov esi, dword ptr [eax*4 + 0101A47C4h]
    jmp L12
L1:
    cmp edi, ebx
    mov dword ptr [ebp - 24], 1
    mov dword ptr [ebp - 20], ebx
    je L10
    cmp byte ptr [edi], 76
    jne L15
    cmp byte ptr [edi + 1], 67
    jne L15
    cmp byte ptr [edi + 2], 95
    jne L15
L2:
    push 01017C68Ch
    push edi
    call sub_10101099
    mov ebx, eax
    test ebx, ebx
    pop ecx
    pop ecx
    je L14
    sub eax, edi
    mov dword ptr [ebp - 24], eax
    je L14
    cmp byte ptr [ebx], 59
    je L14
    mov dword ptr [ebp - 28], 1
    mov esi, 0101A47CCh
    jmp L4
L3:
    mov eax, dword ptr [ebp - 24]
L4:
    push eax
    push edi
    push dword ptr [esi]
    call sub_10101093
    add esp, 12
    test eax, eax
    jne L5
    push dword ptr [esi]
    call sub_100FA2C1
    cmp dword ptr [ebp - 24], eax
    pop ecx
    je L6
L5:
    inc dword ptr [ebp - 28]
    add esi, 12
    cmp esi, 0101A47FCh
    jle L3
L6:
    inc ebx
    push 010195820h
    push ebx
    call sub_101003D1
    mov edi, eax
    test edi, edi
    pop ecx
    pop ecx
    jne L7
    cmp byte ptr [ebx], 59
    jne L14
L7:
    mov esi, dword ptr [ebp - 28]
    cmp esi, 5
    jg L8
    push edi
    lea eax, [ebp - 16]
    push ebx
    push eax
    call sub_100F5EF1
    lea eax, [ebp - 16]
    push eax
    mov byte ptr [ebp + edi - 16], 0
    call sub_100F801D
    add esp, 16
    test eax, eax
    je L8
    inc dword ptr [ebp - 20]
L8:
    add edi, ebx
    cmp byte ptr [edi], 0
    je L9
    inc edi
    cmp byte ptr [edi], 0
    jne L2
L9:
    xor esi, esi
    cmp dword ptr [ebp - 20], esi
    je L12
L10:
    call sub_100F7E29
L11:
    mov esi, eax
L12:
    mov eax, esi
L13:
    mov ecx, dword ptr [ebp + 116]
    pop edi
    pop esi
    pop ebx
    call sub_10100E92
    add ebp, 120
    leave
    ret
L14:
    xor eax, eax
    jmp L13
L15:
    push ebx
    push ebx
    push ebx
    lea eax, [ebp - 16]
    push eax
    push edi
    call sub_100F7F0D
    mov esi, eax
    add esp, 20
    cmp esi, ebx
    je L12
    mov edi, 0101A47C4h
    xor esi, esi
    mov ebx, edi
L16:
    cmp ebx, edi
    je L18
    push dword ptr [ebx]
    lea eax, [ebp - 16]
    push eax
    call sub_1010051C
    test eax, eax
    pop ecx
    pop ecx
    je L17
    lea eax, [ebp - 16]
    push eax
    call sub_100F8099
    test eax, eax
    pop ecx
    jne L17
    and dword ptr [ebp - 24], eax
    jmp L18
L17:
    inc dword ptr [ebp - 20]
L18:
    add ebx, 12
    inc esi
    cmp ebx, 0101A4800h
    jle L16
    xor edi, edi
    cmp dword ptr [ebp - 24], edi
    je L19
    call sub_100F7EA3
    push dword ptr [g_101A47C4]
    mov esi, eax
    call sub_100F868D
    pop ecx
    mov dword ptr [g_101A47C4], edi
    jmp L12
L19:
    cmp dword ptr [ebp - 20], edi
    jne L10
    xor esi, esi
    jmp L12
__setlocale_lk ENDP
END
