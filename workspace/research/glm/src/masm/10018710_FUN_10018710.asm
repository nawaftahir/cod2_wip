.686
.MODEL FLAT, C
EXTRN sub_10018474:PROC
EXTRN sub_10018545:PROC
EXTRN sub_1005F431:PROC
EXTRN sub_1005F4AA:PROC
EXTRN sub_1005F795:PROC
EXTRN sub_1005FB1C:PROC
EXTRN sub_1005FC57:PROC
EXTRN g_101AAC70:DWORD
.CODE
FUN_10018710 PROC
    sub esp, 12
    push ebp
    mov ebp, dword ptr [esp + 28]
    push esi
    push edi
    mov esi, eax
    mov edi, 010195824h
    mov ecx, 12
    xor eax, eax
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L0
    mov ecx, dword ptr [esp + 28]
    push 1
    push 010195820h
    call sub_1005FB1C
    add esp, 8
    pop edi
    test eax, eax
    pop esi
    setne al
    pop ebp
    add esp, 12
    ret
L0:
    push ebx
    call sub_1005F431
    mov edi, dword ptr [esp + 36]
    mov ebx, dword ptr [edi + 4]
    mov ecx, dword ptr [esp + 32]
    add edi, 4
    call sub_10018474
    test eax, eax
    je L6
    mov ebx, edi
    mov edi, dword ptr [esp + 36]
    xor esi, esi
    add edi, 8
L1:
    mov edx, dword ptr [edi]
    xor ecx, ecx
    test edx, edx
    jne L3
    lea edx, [ebx + 4]
L2:
    add edx, 4
    inc ecx
    cmp dword ptr [edx], 0
    je L2
L3:
    mov edx, dword ptr [eax + 4]
    mov eax, dword ptr [ebp + ecx*4 + 16]
    or eax, edx
    mov edx, dword ptr [esp + 36]
    mov dword ptr [ebp + ecx*4 + 16], eax
    lea eax, [esi + ecx]
    mov eax, dword ptr [edx + eax*4 + 8]
    mov edx, dword ptr [ebp + ecx*4 + 24]
    or edx, eax
    add ebx, 16
    mov dword ptr [ebp + ecx*4 + 24], edx
    mov eax, dword ptr [ebx - 4]
    add esi, 4
    add edi, 16
    test eax, eax
    mov dword ptr [esp + 24], esi
    mov dword ptr [esp + 16], edi
    mov dword ptr [esp + 20], ebx
    je L7
    mov eax, dword ptr [g_101AAC70]
    imul eax, eax, 00000045Ch
    add eax, 0101A66B0h
    mov cl, byte ptr [eax + 000000404h]
    test cl, cl
    je L4
    mov ecx, dword ptr [eax + 000000418h]
    mov edx, dword ptr [esp + 32]
    mov byte ptr [eax + 000000404h], 0
    mov dword ptr [edx], ecx
    mov ecx, dword ptr [eax + 000000414h]
    mov dword ptr [eax + 000000400h], ecx
L4:
    mov edx, dword ptr [esp + 32]
    push edx
    mov eax, 1
    call sub_1005F795
    add esp, 4
    mov edi, 01019581Ch
    mov esi, eax
    mov ecx, 2
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L5
    mov ebx, dword ptr [ebx]
    mov ecx, dword ptr [esp + 32]
    call sub_10018545
    test eax, eax
    je L6
    mov edi, dword ptr [esp + 16]
    mov ebx, dword ptr [esp + 20]
    mov esi, dword ptr [esp + 24]
    jmp L1
L5:
    push 01019581Ch
    push eax
    push 01019B8F4h
    call sub_1005F4AA
    add esp, 12
L6:
    pop ebx
    pop edi
    pop esi
    xor al, al
    pop ebp
    add esp, 12
    ret
L7:
    mov ecx, dword ptr [esp + 32]
    push 1
    push 010195820h
    call sub_1005FC57
    add esp, 8
    pop ebx
    pop edi
    test eax, eax
    pop esi
    setne al
    pop ebp
    add esp, 12
    ret
FUN_10018710 ENDP
END
