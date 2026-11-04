.686
.MODEL FLAT, C
EXTRN sub_100675F1:PROC
EXTRN sub_100675FC:PROC
EXTRN sub_10067616:PROC
EXTRN sub_1006761D:PROC
EXTRN sub_10067620:PROC
EXTRN sub_10067662:PROC
EXTRN sub_100676B6:PROC
EXTRN sub_100676BD:PROC
EXTRN sub_1006770E:PROC
EXTRN sub_100F78D9:PROC
EXTRN sub_100F7909:PROC
EXTRN sub_100F792C:PROC
EXTRN sub_100F7950:PROC
EXTRN sub_100F799D:PROC
.CODE
FUN_100674ae PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 12
    push push ebx
    mov mov ebx, ecx
    mov mov edx, dword ptr [ebx + 20]
    mov mov ecx, edx
    push push esi
    push push edi
    xor xor edi, edi
    mov mov eax, ecx
    shr shr eax, 1
    cmp cmp ecx, edi
    mov mov dword ptr [ebp - 12], edi
    mov mov dword ptr [ebp - 4], eax
    jbe L3
    mov mov esi, dword ptr [ebx + 24]
    mov mov esi, dword ptr [esi + eax*4]
    cmp cmp dword ptr [ebp + 8], esi
    jbe L0
    lea lea edi, [eax + 1]
    jmp L2
    jae L4
    mov mov ecx, eax
    lea lea eax, [ecx + edi]
    shr shr eax, 1
    cmp cmp edi, ecx
    mov mov dword ptr [ebp - 4], eax
    jb L1
    cmp cmp edi, ecx
    jb sub_10067620
    mov mov ecx, edx
    not not ecx
    inc inc ecx
    and and ecx, edx
    cmp cmp edx, ecx
    jne sub_100675FC
    test test edx, edx
    je L5
    add add edx, edx
L0:
    jmp L6
    xor xor edx, edx
    inc inc edx
L1:
    mov mov eax, edx
    shl shl eax, 2
    push push eax
    call sub_100F78D9
    test test eax, eax
    pop pop ecx
    mov mov dword ptr [ebp - 8], eax
    jne L7
    mov mov dword ptr [ebp - 12], 08007000Eh
    jmp sub_10067662
    mov mov ecx, dword ptr [ebx + 20]
    mov mov esi, dword ptr [ebx + 28]
    shl shl ecx, 2
    mov mov edi, eax
    mov mov eax, ecx
    shr shr ecx, 2
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, eax
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    push push dword ptr [ebx + 28]
    call sub_100F7909
    mov mov eax, dword ptr [ebp - 8]
    mov mov dword ptr [ebx + 28], eax
    mov mov eax, dword ptr [ebx + 20]
    test test eax, eax
    pop pop ecx
    je sub_10067616
    add add eax, eax
    jmp sub_1006761D
    xor xor eax, eax
    inc inc eax
    shl shl eax, 2
    push push eax
    call sub_100F792C
    mov mov edi, eax
    test test edi, edi
    pop pop ecx
    mov mov dword ptr [ebp - 8], edi
    je sub_100675F1
    mov mov ecx, dword ptr [ebx + 20]
    mov mov esi, dword ptr [ebx + 24]
    shl shl ecx, 2
    mov mov eax, ecx
    shr shr ecx, 2
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, eax
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    push push dword ptr [ebx + 24]
    call sub_100F7950
    mov mov eax, dword ptr [ebp - 8]
    mov mov dword ptr [ebx + 24], eax
    mov mov eax, dword ptr [ebp - 4]
    pop pop ecx
    mov mov edx, dword ptr [ebx + 20]
    jmp sub_100676B6
L7:
    lea lea ecx, [ecx + edx*4]
    mov mov esi, dword ptr [ecx - 4]
    mov mov dword ptr [ecx], esi
    mov mov ecx, dword ptr [ebx + 28]
    lea lea ecx, [ecx + edx*4]
    mov mov esi, dword ptr [ecx - 4]
    mov mov dword ptr [ecx], esi
    dec dec edx
    cmp cmp edx, eax
    mov mov ecx, dword ptr [ebx + 24]
    ja sub_100676BD
    mov mov edx, dword ptr [ebp + 8]
    mov mov dword ptr [ecx + eax*4], edx
    mov mov ecx, dword ptr [ebx + 28]
    mov mov dword ptr [ecx + eax*4], 1
    inc inc dword ptr [ebx + 20]
    mov mov ecx, dword ptr [ebp + 12]
    test test ecx, ecx
    je sub_1006770E
    mov mov dword ptr [ecx], eax
    push push 0
    call sub_100F799D
    mov mov eax, dword ptr [ebp - 12]
    pop pop ecx
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 8
FUN_100674ae ENDP
END
