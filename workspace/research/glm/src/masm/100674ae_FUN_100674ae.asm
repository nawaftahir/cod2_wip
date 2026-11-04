.686
.MODEL FLAT, C
EXTRN sub_100F78D9:PROC
EXTRN sub_100F7909:PROC
EXTRN sub_100F792C:PROC
EXTRN sub_100F7950:PROC
EXTRN sub_100F799D:PROC
.CODE
FUN_100674ae PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 12
    push ebx
    mov ebx, ecx
    mov edx, dword ptr [ebx + 20]
    mov ecx, edx
    push esi
    push edi
    xor edi, edi
    mov eax, ecx
    shr eax, 1
    cmp ecx, edi
    mov dword ptr [ebp - 12], edi
    mov dword ptr [ebp - 4], eax
    jbe L4
L0:
    mov esi, dword ptr [ebx + 24]
    mov esi, dword ptr [esi + eax*4]
    cmp dword ptr [ebp + 8], esi
    jbe L1
    lea edi, [eax + 1]
    jmp L2
L1:
    jae L3
    mov ecx, eax
L2:
    lea eax, [ecx + edi]
    shr eax, 1
    cmp edi, ecx
    mov dword ptr [ebp - 4], eax
    jb L0
L3:
    cmp edi, ecx
    jb L14
L4:
    mov ecx, edx
    not ecx
    inc ecx
    and ecx, edx
    cmp edx, ecx
    jne L11
    test edx, edx
    je L5
    add edx, edx
    jmp L6
L5:
    xor edx, edx
    inc edx
L6:
    mov eax, edx
    shl eax, 2
    push eax
    call sub_100F78D9
    test eax, eax
    pop ecx
    mov dword ptr [ebp - 8], eax
    jne L8
L7:
    mov dword ptr [ebp - 12], 08007000Eh
    jmp L15
L8:
    mov ecx, dword ptr [ebx + 20]
    mov esi, dword ptr [ebx + 28]
    shl ecx, 2
    mov edi, eax
    mov eax, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, eax
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    push dword ptr [ebx + 28]
    call sub_100F7909
    mov eax, dword ptr [ebp - 8]
    mov dword ptr [ebx + 28], eax
    mov eax, dword ptr [ebx + 20]
    test eax, eax
    pop ecx
    je L9
    add eax, eax
    jmp L10
L9:
    xor eax, eax
    inc eax
L10:
    shl eax, 2
    push eax
    call sub_100F792C
    mov edi, eax
    test edi, edi
    pop ecx
    mov dword ptr [ebp - 8], edi
    je L7
    mov ecx, dword ptr [ebx + 20]
    mov esi, dword ptr [ebx + 24]
    shl ecx, 2
    mov eax, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, eax
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    push dword ptr [ebx + 24]
    call sub_100F7950
    mov eax, dword ptr [ebp - 8]
    mov dword ptr [ebx + 24], eax
    mov eax, dword ptr [ebp - 4]
    pop ecx
L11:
    mov edx, dword ptr [ebx + 20]
    jmp L13
L12:
    lea ecx, [ecx + edx*4]
    mov esi, dword ptr [ecx - 4]
    mov dword ptr [ecx], esi
    mov ecx, dword ptr [ebx + 28]
    lea ecx, [ecx + edx*4]
    mov esi, dword ptr [ecx - 4]
    mov dword ptr [ecx], esi
    dec edx
L13:
    cmp edx, eax
    mov ecx, dword ptr [ebx + 24]
    ja L12
    mov edx, dword ptr [ebp + 8]
    mov dword ptr [ecx + eax*4], edx
    mov ecx, dword ptr [ebx + 28]
    mov dword ptr [ecx + eax*4], 1
    inc dword ptr [ebx + 20]
L14:
    mov ecx, dword ptr [ebp + 12]
    test ecx, ecx
    je L15
    mov dword ptr [ecx], eax
L15:
    push 0
    call sub_100F799D
    mov eax, dword ptr [ebp - 12]
    pop ecx
    pop edi
    pop esi
    pop ebx
    leave
    ret 8
FUN_100674ae ENDP
END
