.686
.MODEL FLAT, C
EXTRN sub_10018474:PROC
EXTRN sub_10018545:PROC
EXTRN sub_100188B1:PROC
EXTRN sub_100188B9:PROC
EXTRN sub_100188DD:PROC
EXTRN sub_10018924:PROC
EXTRN sub_10018964:PROC
EXTRN sub_10018986:PROC
EXTRN sub_1005F431:PROC
EXTRN sub_1005F4AA:PROC
EXTRN sub_1005F795:PROC
EXTRN sub_1005FB1C:PROC
EXTRN sub_1005FC57:PROC
EXTRN EXTRN g_101AAC70:DWORD:DWORD
.CODE
FUN_10018710 PROC
    sub sub esp, 12
    push push ebp
    mov mov ebp, dword ptr [esp + 28]
    push push esi
    push push edi
    mov mov esi, eax
    mov mov edi, 010195824h
    mov mov ecx, 12
    xor xor eax, eax
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L0
    mov mov ecx, dword ptr [esp + 28]
    push push 1
    push push 010195820h
    call sub_1005FB1C
    add add esp, 8
    pop pop edi
    test test eax, eax
    pop pop esi
    setne setne al
    pop pop ebp
    add add esp, 12
    ret ret
    push push ebx
    call sub_1005F431
    mov mov edi, dword ptr [esp + 36]
    mov mov ebx, dword ptr [edi + 4]
    mov mov ecx, dword ptr [esp + 32]
    add add edi, 4
    call sub_10018474
    test test eax, eax
    je sub_100188B9
    mov mov ebx, edi
    mov mov edi, dword ptr [esp + 36]
    xor xor esi, esi
    add add edi, 8
    mov mov edx, dword ptr [edi]
    xor xor ecx, ecx
    test test edx, edx
    jne L1
    lea lea edx, [ebx + 4]
    add add edx, 4
    inc inc ecx
    cmp cmp dword ptr [edx], 0
    je L2
    mov mov edx, dword ptr [eax + 4]
    mov mov eax, dword ptr [ebp + ecx*4 + 16]
    or or eax, edx
    mov mov edx, dword ptr [esp + 36]
    mov mov dword ptr [ebp + ecx*4 + 16], eax
    lea lea eax, [esi + ecx]
    mov mov eax, dword ptr [edx + eax*4 + 8]
    mov mov edx, dword ptr [ebp + ecx*4 + 24]
    or or edx, eax
    add add ebx, 16
    mov mov dword ptr [ebp + ecx*4 + 24], edx
    mov mov eax, dword ptr [ebx - 4]
    add add esi, 4
    add add edi, 16
    test test eax, eax
    mov mov dword ptr [esp + 24], esi
    mov mov dword ptr [esp + 16], edi
    mov mov dword ptr [esp + 20], ebx
    je sub_10018924
    mov mov eax, dword ptr [g_101AAC70]
    imul imul eax, eax, 045Ch
    add add eax, 0101A66B0h
    mov mov cl, byte ptr [eax + 0404h]
    test test cl, cl
    je sub_100188DD
    mov mov ecx, dword ptr [eax + 0418h]
    mov mov edx, dword ptr [esp + 32]
    mov mov byte ptr [eax + 0404h], 0
    mov mov dword ptr [edx], ecx
L1:
    mov mov ecx, dword ptr [eax + 0414h]
    mov mov dword ptr [eax + 0400h], ecx
    mov mov edx, dword ptr [esp + 32]
    push push edx
    mov mov eax, 1
    call sub_1005F795
    add add esp, 4
    mov mov edi, 01019581Ch
    mov mov esi, eax
    mov mov ecx, 2
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_10018964
    mov mov ebx, dword ptr [ebx]
    mov mov ecx, dword ptr [esp + 32]
    call sub_10018545
    test test eax, eax
    je sub_10018986
    mov mov edi, dword ptr [esp + 16]
    mov mov ebx, dword ptr [esp + 20]
    mov mov esi, dword ptr [esp + 24]
    jmp sub_100188B1
    push push 01019581Ch
    push push eax
    push push 01019B8F4h
    call sub_1005F4AA
    add add esp, 12
    pop pop ebx
    pop pop edi
    pop pop esi
    xor xor al, al
    pop pop ebp
    add add esp, 12
    ret ret
    mov mov ecx, dword ptr [esp + 32]
    push push 1
    push push 010195820h
    call sub_1005FC57
    add add esp, 8
    pop pop ebx
    pop pop edi
    test test eax, eax
    pop pop esi
    setne setne al
    pop pop ebp
    add add esp, 12
    ret ret
FUN_10018710 ENDP
END
