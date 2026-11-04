.686
.MODEL FLAT, C
EXTRN sub_100862C8:PROC
EXTRN sub_100F78C5:PROC
EXTRN sub_100F7A8D:PROC
.CODE
FUN_100c4a8b PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    and dword ptr [ebp - 4], 0
    push ebx
    push esi
    xor eax, eax
    xor edx, edx
    cmp dword ptr [ebp + 24], eax
    push edi
    mov esi, ecx
    jbe L2
    mov ecx, dword ptr [esi + 000000150h]
L0:
    mov edi, dword ptr [ebp + 20]
    cmp ecx, dword ptr [edi + eax*4]
    jne L1
    xor edx, edx
    inc edx
L1:
    inc eax
    cmp eax, dword ptr [ebp + 24]
    jb L0
L2:
    mov ebx, dword ptr [ebp + 8]
    cmp dword ptr [esi + 00000014Ch], ebx
    jbe L3
    test edx, edx
    je L14
L3:
    or eax, 0FFFFFFFFh
    lea edi, [esi + 00000013Ch]
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    mov eax, dword ptr [esi + 44]
    shl eax, 2
    push eax
    call sub_100F78C5
    mov edi, eax
    test edi, edi
    pop ecx
    mov dword ptr [ebp - 4], edi
    je L21
    mov ecx, dword ptr [esi + 44]
    shl ecx, 2
    mov edx, ecx
    shr ecx, 2
    or eax, 0FFFFFFFFh
    rep stosd dword ptr es:[edi], eax
    mov ecx, edx
    and ecx, 3
    xor edx, edx
    rep stosb byte ptr es:[edi], al
    cmp dword ptr [esi + 8], edx
    jbe L7
L4:
    mov eax, dword ptr [esi + 20]
    mov eax, dword ptr [eax + edx*4]
    mov ecx, dword ptr [esi + 000000088h]
    cmp ecx, dword ptr [eax + 4]
    jne L6
    cmp dword ptr [eax + 8], -1
    jne L6
    mov ecx, dword ptr [eax + 12]
    cmp ecx, dword ptr [esi + 44]
    jae L6
    cmp dword ptr [eax + 72], ebx
    jae L5
    cmp dword ptr [eax + 88], ebx
    jb L5
    mov edi, dword ptr [ebp - 4]
    and dword ptr [edi + ecx*4], 0
L5:
    mov ecx, dword ptr [eax + 72]
    cmp ecx, ebx
    jb L6
    mov eax, dword ptr [eax + 12]
    mov edi, dword ptr [ebp - 4]
    lea eax, [edi + eax*4]
    cmp ecx, dword ptr [eax]
    jae L6
    mov dword ptr [eax], ecx
L6:
    inc edx
    cmp edx, dword ptr [esi + 8]
    jb L4
L7:
    mov edx, dword ptr [esi + 44]
    xor eax, eax
    cmp edx, eax
    mov dword ptr [esi + 000000150h], eax
    mov dword ptr [esi + 00000014Ch], eax
    jbe L13
L8:
    xor ecx, ecx
    cmp dword ptr [ebp + 24], ecx
    jbe L11
L9:
    mov edi, dword ptr [ebp + 20]
    cmp eax, dword ptr [edi + ecx*4]
    je L10
    inc ecx
    cmp ecx, dword ptr [ebp + 24]
    jb L9
L10:
    cmp ecx, dword ptr [ebp + 24]
    jb L12
L11:
    mov ecx, dword ptr [ebp - 4]
    mov edi, dword ptr [esi + 00000014Ch]
    lea ecx, [ecx + eax*4]
    cmp edi, dword ptr [ecx]
    jae L12
    mov dword ptr [esi + 000000150h], eax
    mov ecx, dword ptr [ecx]
    mov dword ptr [esi + 00000014Ch], ecx
L12:
    inc eax
    cmp eax, dword ptr [esi + 44]
    jb L8
L13:
    cmp dword ptr [esi + 00000014Ch], ebx
    ja L14
    or dword ptr [esi + 00000014Ch], 0FFFFFFFFh
    mov dword ptr [esi + 000000150h], edx
L14:
    mov edi, dword ptr [ebp + 16]
    dec edi
    neg edi
    sbb edi, edi
    and dword ptr [ebp + 20], 0
    and edi, 0FFFFFFFDh
    add edi, 3
    cmp dword ptr [ebp + 16], 0
    jbe L19
    lea eax, [esi + edi*4 + 00000013Ch]
    mov dword ptr [ebp + 24], eax
L15:
    mov eax, dword ptr [ebp + 24]
    mov eax, dword ptr [eax]
    cmp eax, -1
    je L16
    mov ecx, dword ptr [esi + 20]
    mov eax, dword ptr [ecx + eax*4]
    mov dword ptr [eax + 80], ebx
L16:
    push ecx
    fldz
    push ecx
    fstp qword ptr [esp]
    push edi
    push dword ptr [esi + 000000150h]
    mov ecx, esi
    push dword ptr [esi + 000000088h]
    call sub_100862C8
    cmp eax, -1
    mov ecx, dword ptr [ebp + 24]
    mov dword ptr [ecx], eax
    je L21
    mov ecx, dword ptr [esi + 20]
    mov eax, dword ptr [ecx + eax*4]
    and dword ptr [eax + 60], 0
    and dword ptr [eax + 48], 0
    mov dword ptr [eax + 72], ebx
    mov ecx, dword ptr [esi + 00000014Ch]
    mov dword ptr [eax + 80], ecx
    mov dword ptr [eax + 84], ebx
    mov dword ptr [eax + 88], ebx
    mov dword ptr [eax + 92], 1
    mov ecx, dword ptr [esi + 24]
    mov ecx, dword ptr [ecx + ebx*4]
    cmp dword ptr [ecx + 12], 0
    je L17
    mov ecx, dword ptr [ecx + 16]
    mov ecx, dword ptr [ecx]
    mov edx, dword ptr [esi + 20]
    mov ecx, dword ptr [edx + ecx*4]
    mov ecx, dword ptr [ecx + 24]
    mov dword ptr [eax + 24], ecx
    mov ecx, dword ptr [esi + 24]
    mov ecx, dword ptr [ecx + ebx*4]
    mov ecx, dword ptr [ecx + 16]
    mov ecx, dword ptr [ecx]
    mov edx, dword ptr [esi + 20]
    mov ecx, dword ptr [edx + ecx*4]
    mov ecx, dword ptr [ecx + 20]
    mov dword ptr [eax + 20], ecx
L17:
    mov eax, dword ptr [ebp + 12]
    test eax, eax
    je L18
    mov ecx, dword ptr [ebp + 24]
    mov ecx, dword ptr [ecx]
    mov edx, dword ptr [ebp + 20]
    mov dword ptr [eax + edx*4], ecx
L18:
    add dword ptr [ebp + 24], 4
    inc edi
    inc dword ptr [ebp + 20]
    mov eax, dword ptr [ebp + 20]
    cmp eax, dword ptr [ebp + 16]
    jb L15
L19:
    xor esi, esi
L20:
    push dword ptr [ebp - 4]
    call sub_100F7A8D
    pop ecx
    pop edi
    mov eax, esi
    pop esi
    pop ebx
    leave
    ret 20
L21:
    mov esi, 08007000Eh
    jmp L20
FUN_100c4a8b ENDP
END
